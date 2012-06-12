package grailsapplication2

class RedirectController {

    def index() {
        def r = session.SPRING_SECURITY_CONTEXT.authentication.principal.authorities
        switch (r) {
            case '[ROLE_USER]':
                redirect (contrller: "client")
                break
            case '[ROLE_COOKER]':
                redirect (contrller: "redirect", action: "accueil")
                break
            case '[ROLE_DIRECTOR]':
                redirect (contrller: "redirect", action: "accueil")
                break
            case '[ROLE_SERVER]':
                redirect (contrller: "serveur")
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
