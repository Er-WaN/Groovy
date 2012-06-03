package restaurant

import org.springframework.dao.DataIntegrityViolationException

class TablController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [tablInstanceList: Tabl.list(params), tablInstanceTotal: Tabl.count()]
    }

    def create() {
        [tablInstance: new Tabl(params)]
    }

    def save() {
        def tablInstance = new Tabl(params)
        if (!tablInstance.save(flush: true)) {
            render(view: "create", model: [tablInstance: tablInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'tabl.label', default: 'Tabl'), tablInstance.id])
        redirect(action: "show", id: tablInstance.id)
    }

    def show() {
        def tablInstance = Tabl.get(params.id)
        if (!tablInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'tabl.label', default: 'Tabl'), params.id])
            redirect(action: "list")
            return
        }

        [tablInstance: tablInstance]
    }

    def edit() {
        def tablInstance = Tabl.get(params.id)
        if (!tablInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tabl.label', default: 'Tabl'), params.id])
            redirect(action: "list")
            return
        }

        [tablInstance: tablInstance]
    }

    def update() {
        def tablInstance = Tabl.get(params.id)
        if (!tablInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tabl.label', default: 'Tabl'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (tablInstance.version > version) {
                tablInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'tabl.label', default: 'Tabl')] as Object[],
                          "Another user has updated this Tabl while you were editing")
                render(view: "edit", model: [tablInstance: tablInstance])
                return
            }
        }

        tablInstance.properties = params

        if (!tablInstance.save(flush: true)) {
            render(view: "edit", model: [tablInstance: tablInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'tabl.label', default: 'Tabl'), tablInstance.id])
        redirect(action: "show", id: tablInstance.id)
    }

    def delete() {
        def tablInstance = Tabl.get(params.id)
        if (!tablInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'tabl.label', default: 'Tabl'), params.id])
            redirect(action: "list")
            return
        }

        try {
            tablInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'tabl.label', default: 'Tabl'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'tabl.label', default: 'Tabl'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
