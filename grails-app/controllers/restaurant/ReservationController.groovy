package restaurant

import org.springframework.dao.DataIntegrityViolationException
import groovy.time.*
import org.codehaus.groovy.runtime.*
import static java.util.Calendar.*

class ReservationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def testDatePicker() {
    }
    
    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [reservationInstanceList: Reservation.list(params), reservationInstanceTotal: Reservation.count()]
    }

    def create() {
        [reservationInstance: new Reservation(params)]
    }

    def save() {
        use(TimeCategory)
        {
            def reservationInstance = new Reservation(params)
            def d = reservationInstance.dat
        
            def p = d - 2.hours
            def t = restaurant.Reservation.withCriteria{
                between('dat',p, d)
                }.table.id
            t << 0            
            def a = restaurant.Tabl.withCriteria{
                not {
                    'in'('id', t)
                    }
                ge('nb_places', reservationInstance.nombre_personnes)
                order('nb_places', 'asc')
            }.id
            

            if (a.size() == 0) 
            {
                flash.message = "Toutes les tables sont réservées pour ces horaires"
                render(view: "create", model: [reservationInstance: reservationInstance])
                return
            }
            println("if4")
            reservationInstance.table = restaurant.Tabl.get(a[0])
            if (!reservationInstance.save(flush: true)) {
                
                render(view: "create", model: [reservationInstance: reservationInstance])
                return
            }

		flash.message = "Réservation créée"
            redirect(action: "show", id: reservationInstance.id)
        }
    }

    def show() {
        def reservationInstance = Reservation.get(params.id)
        if (!reservationInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'reservation.label', default: 'Reservation'), params.id])
            redirect(action: "list")
            return
        }

        [reservationInstance: reservationInstance]
    }

    def edit() {
        def reservationInstance = Reservation.get(params.id)
        if (!reservationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reservation.label', default: 'Reservation'), params.id])
            redirect(action: "list")
            return
        }

        [reservationInstance: reservationInstance]
    }

    def update() {
        use(TimeCategory)
        {
            def reservationInstance = Reservation.get(params.id)
            if (!reservationInstance) {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'reservation.label', default: 'Reservation'), params.id])
                redirect(action: "list")
                return
            }

            if (params.version) {
                def version = params.version.toLong()
                if (reservationInstance.version > version) {
                    reservationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                            [message(code: 'reservation.label', default: 'Reservation')] as Object[],
                            "Another user has updated this Reservation while you were editing")
                    render(view: "edit", model: [reservationInstance: reservationInstance])
                    return
                }
            }
            
            def d = reservationInstance.dat
            def p = d - 2.hours
            
            def t = restaurant.Reservation.withCriteria{
                between('dat',p, d)
                not{
                    'in'('id', reservationInstance.id)
                }
                    
                }.table.id
                
            t << 0   
            println params.nombre_personnes.class.name
            def a = restaurant.Tabl.withCriteria{
                not {
                    'in'('id', t)
                    }
                ge('nb_places', params.nombre_personnes.toInteger())
                order('nb_places', 'asc')
            }.id
            
            if (a.size() == 0) 
            {
                flash.message = "Toutes les tables sont réservées pour ces horaires"
                render(view: "edit", id: reservationInstance.id, model: [reservationInstance: reservationInstance])
                return
            }
            println("a= "+a)
            reservationInstance.properties = params
            reservationInstance.table = restaurant.Tabl.get(a[0])

            if (!reservationInstance.save(flush: true)) {
                render(view: "edit", model: [reservationInstance: reservationInstance])
                return
            }

                    flash.message = "Réservation modifiée"
            redirect(action: "show", id: reservationInstance.id)
        }
    }

    def delete() {
        def reservationInstance = Reservation.get(params.id)
        if (!reservationInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'reservation.label', default: 'Reservation'), params.id])
            redirect(action: "list")
            return
        }

        try {
            reservationInstance.delete(flush: true)
			"Réservation supprimée"
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = "La réservation n'a pas pu être supprimée"
            redirect(action: "show", id: params.id)
        }
    }
}
