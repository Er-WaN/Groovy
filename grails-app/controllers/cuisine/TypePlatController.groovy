package cuisine

class TypePlatController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [typePlatInstanceList: TypePlat.list(params), typePlatInstanceTotal: TypePlat.count()]
    }

    def create = {
        def typePlatInstance = new TypePlat()
        typePlatInstance.properties = params
        return [typePlatInstance: typePlatInstance]
    }

    def save = {
        def typePlatInstance = new TypePlat(params)
        if (typePlatInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'typePlat.label', default: 'TypePlat'), typePlatInstance.id])}"
            redirect(action: "show", id: typePlatInstance.id)
        }
        else {
            render(view: "create", model: [typePlatInstance: typePlatInstance])
        }
    }

    def show = {
        def typePlatInstance = TypePlat.get(params.id)
        if (!typePlatInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'typePlat.label', default: 'TypePlat'), params.id])}"
            redirect(action: "list")
        }
        else {
            [typePlatInstance: typePlatInstance]
        }
    }

    def edit = {
        def typePlatInstance = TypePlat.get(params.id)
        if (!typePlatInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'typePlat.label', default: 'TypePlat'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [typePlatInstance: typePlatInstance]
        }
    }

    def update = {
        def typePlatInstance = TypePlat.get(params.id)
        if (typePlatInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (typePlatInstance.version > version) {
                    
                    typePlatInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'typePlat.label', default: 'TypePlat')] as Object[], "Another user has updated this TypePlat while you were editing")
                    render(view: "edit", model: [typePlatInstance: typePlatInstance])
                    return
                }
            }
            typePlatInstance.properties = params
            if (!typePlatInstance.hasErrors() && typePlatInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'typePlat.label', default: 'TypePlat'), typePlatInstance.id])}"
                redirect(action: "show", id: typePlatInstance.id)
            }
            else {
                render(view: "edit", model: [typePlatInstance: typePlatInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'typePlat.label', default: 'TypePlat'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def typePlatInstance = TypePlat.get(params.id)
        if (typePlatInstance) {
            try {
                typePlatInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'typePlat.label', default: 'TypePlat'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'typePlat.label', default: 'TypePlat'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'typePlat.label', default: 'TypePlat'), params.id])}"
            redirect(action: "list")
        }
    }
}
