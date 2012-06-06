package grailsapplication2

class RedirectController {

    def index() {
        def r = session.SPRING_SECURITY_CONTEXT.authentication.principal.authorities
        switch (r) {
            case '[ROLE_USER]':
                redirect (controller: "redirect", action: "accueil")
                break
            case '[ROLE_COOKER]':
                redirect (controller: "redirect", action: "accueil")
                break
            case '[ROLE_DIRECTOR]':
                redirect (controller: "redirect", action: "accueil")
                break
            case '[ROLE_SERVER]':
                redirect (controller: "serveur")
                break
            default:
                println "Don't know"
            }
    }
    
    def accueil() {
        def r = session.SPRING_SECURITY_CONTEXT.authentication.principal.authorities
        [r:r]
    }
    
    def cooker() {}
}
