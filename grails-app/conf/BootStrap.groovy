import grailsapplication2.Role
import grailsapplication2.User
import grailsapplication2.UserRole


class BootStrap {

    def init = { servletContext ->
        def directorRole= Role.findByAuthority("ROLE_DIRECTOR") ?: new Role(authority:"ROLE_DIRECTOR").save(FailOnError:true)
        def cookerRole= Role.findByAuthority("ROLE_COOKER") ?: new Role(authority:"ROLE_COOKER").save(FailOnError:true)
        def serverRole= Role.findByAuthority("ROLE_SERVER") ?: new Role(authority:"ROLE_SERVER").save(FailOnError:true)
        def userRole= Role.findByAuthority("ROLE_USER") ?: new Role(authority:"ROLE_USER").save(FailOnError:true)
        def client= new User(username:"client", password:"client", enabled:true).save()
        def serveur= new User(username:"serveur", password:"serveur", enabled:true).save()
        def chef= new User(username:"chef", password:"chef", enabled:true).save()
        def directeur= new User(username:"directeur", password:"directeur", enabled:true).save()
        UserRole.create client, userRole
        UserRole.create serveur, serverRole
        UserRole.create chef, cookerRole
        UserRole.create directeur, directorRole
        Locale.setDefault(Locale.FRENCH) 

    }
    def destroy = {
    }
    
}
