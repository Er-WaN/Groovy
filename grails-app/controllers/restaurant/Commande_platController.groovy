package restaurant

import org.springframework.dao.DataIntegrityViolationException

class Commande_platController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [commande_platInstanceList: Commande_plat.list(params), commande_platInstanceTotal: Commande_plat.count()]
    }

    def create() {
        [commande_platInstance: new Commande_plat(params)]
    }

    def cloturer_plat()
    {
        def commande = restaurant.Commande.get(params.commande)
        def plat = params.plat_id.toInteger()
        def cp = restaurant.Commande_plat.find("from restaurant.Commande_plat where commande = ? and plat_id = ? and type = 1", commande, plat)
        cp.etat = 2
        cp.save(flush:true)
        redirect(action: "show", controller: "commande", id: commande.id, fragment: "plat")
    }
    def commencer_plat()
    {
        def commande = restaurant.Commande.get(params.commande)
        def plat = params.plat_id.toInteger()
        def cp = restaurant.Commande_plat.find("from restaurant.Commande_plat where commande = ? and plat_id = ? and type = 1", commande, plat)
        cp.etat = 1
        cp.save(flush:true)
        redirect(action: "show", controller: "commande", id: commande.id, fragment: "plat")
    }
    def ouvrir_plat()
    {
        def commande = restaurant.Commande.get(params.commande)
        def plat = params.plat_id.toInteger()
        def cp = restaurant.Commande_plat.find("from restaurant.Commande_plat where commande = ? and plat_id = ? and type = 1", commande, plat)
        cp.etat = 0
        cp.save(flush:true)
        redirect(action: "show", controller: "commande", id: commande.id, fragment: "plat")
    }
    
    def cloturer_boisson()
    {
        def commande = restaurant.Commande.get(params.commande)
        def plat = params.plat_id.toInteger()
        def cp = restaurant.Commande_plat.find("from restaurant.Commande_plat where commande = ? and plat_id = ? and type = 2", commande, plat)
        cp.etat = false
        cp.save(flush:true)
        redirect(action: "show", controller: "commande", id: commande.id, fragment: "boisson")
    }
    def ouvrir_boisson()
    {
        def commande = restaurant.Commande.get(params.commande)
        def plat = params.plat_id.toInteger()
        def cp = restaurant.Commande_plat.find("from restaurant.Commande_plat where commande = ? and plat_id = ? and type = 2", commande, plat)
        cp.etat = true
        cp.save(flush:true)
        redirect(action: "show", controller: "commande", id: commande.id, fragment: "boisson")
    }
    
    def save() {
        def commande_platInstance = new Commande_plat(params)
        if (!commande_platInstance.save(flush: true)) {
            render(view: "create", model: [commande_platInstance: commande_platInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'commande_plat.label', default: 'Commande_plat'), commande_platInstance.id])
        redirect(action: "show", id: commande_platInstance.id)
    }

    def show() {
        def commande_platInstance = Commande_plat.get(params.id)
        if (!commande_platInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'commande_plat.label', default: 'Commande_plat'), params.id])
            redirect(action: "list")
            return
        }

        [commande_platInstance: commande_platInstance]
    }

    def edit() {
        def commande_platInstance = Commande_plat.get(params.id)
        if (!commande_platInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'commande_plat.label', default: 'Commande_plat'), params.id])
            redirect(action: "list")
            return
        }

        [commande_platInstance: commande_platInstance]
    }

    def update() {
        def commande_platInstance = Commande_plat.get(params.id)
        if (!commande_platInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'commande_plat.label', default: 'Commande_plat'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (commande_platInstance.version > version) {
                commande_platInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'commande_plat.label', default: 'Commande_plat')] as Object[],
                          "Another user has updated this Commande_plat while you were editing")
                render(view: "edit", model: [commande_platInstance: commande_platInstance])
                return
            }
        }

        commande_platInstance.properties = params

        if (!commande_platInstance.save(flush: true)) {
            render(view: "edit", model: [commande_platInstance: commande_platInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'commande_plat.label', default: 'Commande_plat'), commande_platInstance.id])
        redirect(action: "show", id: commande_platInstance.id)
    }

    def delete() {
        def commande_platInstance = Commande_plat.get(params.id)
        if (!commande_platInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'commande_plat.label', default: 'Commande_plat'), params.id])
            redirect(action: "list")
            return
        }

        try {
            commande_platInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'commande_plat.label', default: 'Commande_plat'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'commande_plat.label', default: 'Commande_plat'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
