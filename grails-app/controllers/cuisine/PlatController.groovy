package cuisine

class PlatController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [platInstanceList: Plat.list(params), platInstanceTotal: Plat.count()]
    }

    def create = {
        def platInstance = new Plat()
        platInstance.properties = params
        return [platInstance: platInstance]
    }

    def save = {
        def platInstance = new Plat(params)
        if (platInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'plat.label', default: 'Plat'), platInstance.id])}"
            redirect(action: "show", id: platInstance.id)
        }
        else {
            render(view: "create", model: [platInstance: platInstance])
        }
    }

    def show = {
        def platInstance = Plat.get(params.id)
        if (!platInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'plat.label', default: 'Plat'), params.id])}"
            redirect(action: "list")
        }
        else {
            [platInstance: platInstance]
        }
    }

    def edit = {
        def platInstance = Plat.get(params.id)
        if (!platInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'plat.label', default: 'Plat'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [platInstance: platInstance]
        }
    }

    def update = {
        def platInstance = Plat.get(params.id)
        if (platInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (platInstance.version > version) {
                    
                    platInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'plat.label', default: 'Plat')] as Object[], "Another user has updated this Plat while you were editing")
                    render(view: "edit", model: [platInstance: platInstance])
                    return
                }
            }
            platInstance.properties = params
            if (!platInstance.hasErrors() && platInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'plat.label', default: 'Plat'), platInstance.id])}"
                redirect(action: "show", id: platInstance.id)
            }
            else {
                render(view: "edit", model: [platInstance: platInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'plat.label', default: 'Plat'), params.id])}"
            redirect(action: "list")
        }
        
        params.menus.each()
        { 
            def m = cuisine.Menu.get(it)
            cuisine.Plat.get(params.id).addToMenus(m)
        }
    }

    def delete = {
        def platInstance = Plat.get(params.id)
        if (platInstance) {
            try {
                platInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'plat.label', default: 'Plat'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'plat.label', default: 'Plat'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'plat.label', default: 'Plat'), params.id])}"
            redirect(action: "list")
        }
    }
}
