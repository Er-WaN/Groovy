package cuisine

import org.springframework.dao.DataIntegrityViolationException

class BoissonController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [boissonInstanceList: Boisson.list(params), boissonInstanceTotal: Boisson.count()]
    }

    def create() {
        [boissonInstance: new Boisson(params)]
    }

    def save() {
        def boissonInstance = new Boisson(params)
        if (!boissonInstance.save(flush: true)) {
            render(view: "create", model: [boissonInstance: boissonInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'boisson.label', default: 'Boisson'), boissonInstance.id])
        redirect(action: "show", id: boissonInstance.id)
    }

    def show() {
        def boissonInstance = Boisson.get(params.id)
        if (!boissonInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'boisson.label', default: 'Boisson'), params.id])
            redirect(action: "list")
            return
        }

        [boissonInstance: boissonInstance]
    }

    def edit() {
        def boissonInstance = Boisson.get(params.id)
        if (!boissonInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'boisson.label', default: 'Boisson'), params.id])
            redirect(action: "list")
            return
        }

        [boissonInstance: boissonInstance]
    }

    def update() {
        def boissonInstance = Boisson.get(params.id)
        if (!boissonInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'boisson.label', default: 'Boisson'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (boissonInstance.version > version) {
                boissonInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'boisson.label', default: 'Boisson')] as Object[],
                          "Another user has updated this Boisson while you were editing")
                render(view: "edit", model: [boissonInstance: boissonInstance])
                return
            }
        }

        boissonInstance.properties = params

        if (!boissonInstance.save(flush: true)) {
            render(view: "edit", model: [boissonInstance: boissonInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'boisson.label', default: 'Boisson'), boissonInstance.id])
        redirect(action: "show", id: boissonInstance.id)
    }

    def delete() {
        def boissonInstance = Boisson.get(params.id)
        if (!boissonInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'boisson.label', default: 'Boisson'), params.id])
            redirect(action: "list")
            return
        }

        try {
            boissonInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'boisson.label', default: 'Boisson'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'boisson.label', default: 'Boisson'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
