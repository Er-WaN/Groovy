import grailsapplication2.Role
import grailsapplication2.User
import grailsapplication2.UserRole


class BootStrap {

    def init = { servletContext ->
        def userRole= Role.findByAuthority("ROLE_USER") ?: new Role(authority:"ROLE_USER").save(FailOnError:true)
        def adminRole= Role.findByAuthority("ROLE_ADMIN") ?: new Role(authority:"ROLE_ADMIN").save(FailOnError:true)
        def client= new User(username:"client", password:"client", enabled:true).save()
        def serveur= new User(username:"serveur", password:"serveur", enabled:true).save()
        def chef= new User(username:"chef", password:"chef", enabled:true).save()
        UserRole.create client, userRole
        UserRole.create serveur, userRole
        UserRole.create chef, adminRole
        Locale.setDefault(Locale.FRENCH) 

    }
    def destroy = {
    }
    
}
