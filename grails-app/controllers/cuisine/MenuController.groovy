package cuisine

import org.springframework.dao.DataIntegrityViolationException

class MenuController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [menuInstanceList: Menu.list(params), menuInstanceTotal: Menu.count()]
    }

    def create() {
        
        [menuInstance: new Menu(params)]
    }

    def save() {
        println("params : "+params)
        def menuInstance = new Menu(params)
        if (!menuInstance.save(flush: true)) {
            render(view: "create", model: [menuInstance: menuInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'menu.label', default: 'Menu'), menuInstance.id])
        redirect(action: "show", id: menuInstance.id)
    }

    def show() {
        def menuInstance = Menu.get(params.id)
        if (!menuInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'menu.label', default: 'Menu'), params.id])
            redirect(action: "list")
            return
        }

        [menuInstance: menuInstance]
    }

    def edit() {
        def menuInstance = Menu.get(params.id)
        if (!menuInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'menu.label', default: 'Menu'), params.id])
            redirect(action: "list")
            return
        }

        [menuInstance: menuInstance]
    }

    def update() {
        def menuInstance = Menu.get(params.id)
        if (!menuInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'menu.label', default: 'Menu'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (menuInstance.version > version) {
                menuInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'menu.label', default: 'Menu')] as Object[],
                          "Another user has updated this Menu while you were editing")
                render(view: "edit", model: [menuInstance: menuInstance])
                return
            }
        }

        menuInstance.properties = params

        if (!menuInstance.save(flush: true)) {
            render(view: "edit", model: [menuInstance: menuInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'menu.label', default: 'Menu'), menuInstance.id])
        redirect(action: "show", id: menuInstance.id)
    }

    def delete() {
        def menuInstance = Menu.get(params.id)
        if (!menuInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'menu.label', default: 'Menu'), params.id])
            redirect(action: "list")
            return
        }

        try {
            menuInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'menu.label', default: 'Menu'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'menu.label', default: 'Menu'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
