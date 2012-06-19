package grailsapplication2

class AdministrationController {

    def index() {
        def r = session.SPRING_SECURITY_CONTEXT.authentication.principal.authorities
        switch (r) {
            case '[ROLE_USER]':
                redirect (controller: "client")
                break
            case '[ROLE_COOKER]':
                redirect (controller: "administration", action: "accueil")
                break
            case '[ROLE_DIRECTOR]':
                redirect (controller: "administration", action: "accueil")
                break
            case '[ROLE_SERVER]':
                redirect (controller: "administration", action: "accueil")
                break
            default:
                println "Don't know"
            }
    }
    
    def accueil() {
        def u = session.SPRING_SECURITY_CONTEXT.authentication.principal.username
        def userInstance = grailsapplication2.User.findAll("from grailsapplication2.User as u where u.username ='$u'")[0]
        println("role: "+userInstance.getAuthorities().authority[0])
        [u:u, userInstance:userInstance]
    }
    
    def cooker() {}
}
