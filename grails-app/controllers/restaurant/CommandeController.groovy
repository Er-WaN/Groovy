package restaurant

import org.springframework.dao.DataIntegrityViolationException

class CommandeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [commandeInstanceList: Commande.list(params), commandeInstanceTotal: Commande.count()]
    }
    

    def show() {
        def commandeInstance = Commande.get(params.id)
        if (!commandeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'commande.label', default: 'Commande'), params.id])
            redirect(action: "list")
            return
        }

        [commandeInstance: commandeInstance]
    }
    
    def cloturer()
    {
        def c = restaurant.Commande.get(params.id)
        c.etat = 0
        c.save(flush:true)
        redirect(action: "list")
    }
    
    def rouvrir()
    {
        def c = restaurant.Commande.get(params.id)
        c.etat = 1
        c.save(flush:true)
        redirect(action: "show", id: params.id)
    }


    def update() {
        def commandeInstance = Commande.get(params.id)
        if (!commandeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'commande.label', default: 'Commande'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (commandeInstance.version > version) {
                commandeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'commande.label', default: 'Commande')] as Object[],
                          "Another user has updated this Commande while you were editing")
                render(view: "edit", model: [commandeInstance: commandeInstance])
                return
            }
        }

        commandeInstance.properties = params

        if (!commandeInstance.save(flush: true)) {
            render(view: "edit", model: [commandeInstance: commandeInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'commande.label', default: 'Commande'), commandeInstance.id])
        redirect(action: "show", id: commandeInstance.id)
    }

    
}
