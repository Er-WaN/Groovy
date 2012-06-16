package cuisine

import org.springframework.dao.DataIntegrityViolationException

class TypeBoissonController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [typeBoissonInstanceList: TypeBoisson.list(params), typeBoissonInstanceTotal: TypeBoisson.count()]
    }

    def create() {
        [typeBoissonInstance: new TypeBoisson(params)]
    }

    def save() {
        def typeBoissonInstance = new TypeBoisson(params)
        if (!typeBoissonInstance.save(flush: true)) {
            render(view: "create", model: [typeBoissonInstance: typeBoissonInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'typeBoisson.label', default: 'TypeBoisson'), typeBoissonInstance.id])
        redirect(action: "show", id: typeBoissonInstance.id)
    }

    def show() {
        def typeBoissonInstance = TypeBoisson.get(params.id)
        if (!typeBoissonInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'typeBoisson.label', default: 'TypeBoisson'), params.id])
            redirect(action: "list")
            return
        }

        [typeBoissonInstance: typeBoissonInstance]
    }

    def edit() {
        def typeBoissonInstance = TypeBoisson.get(params.id)
        if (!typeBoissonInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'typeBoisson.label', default: 'TypeBoisson'), params.id])
            redirect(action: "list")
            return
        }

        [typeBoissonInstance: typeBoissonInstance]
    }

    def update() {
        def typeBoissonInstance = TypeBoisson.get(params.id)
        if (!typeBoissonInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'typeBoisson.label', default: 'TypeBoisson'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (typeBoissonInstance.version > version) {
                typeBoissonInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'typeBoisson.label', default: 'TypeBoisson')] as Object[],
                          "Another user has updated this TypeBoisson while you were editing")
                render(view: "edit", model: [typeBoissonInstance: typeBoissonInstance])
                return
            }
        }

        typeBoissonInstance.properties = params

        if (!typeBoissonInstance.save(flush: true)) {
            render(view: "edit", model: [typeBoissonInstance: typeBoissonInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'typeBoisson.label', default: 'TypeBoisson'), typeBoissonInstance.id])
        redirect(action: "show", id: typeBoissonInstance.id)
    }

    def delete() {
        def typeBoissonInstance = TypeBoisson.get(params.id)
        if (!typeBoissonInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'typeBoisson.label', default: 'TypeBoisson'), params.id])
            redirect(action: "list")
            return
        }

        try {
            typeBoissonInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'typeBoisson.label', default: 'TypeBoisson'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'typeBoisson.label', default: 'TypeBoisson'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
