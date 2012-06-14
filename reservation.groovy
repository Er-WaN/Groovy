import org.springframework.dao.DataIntegrityViolationException
import groovy.time.*
import org.codehaus.groovy.runtime.*
import static java.util.Calendar.*

use(TimeCategory)
        {
            def d = new Date()
            def p = d - 5.days


            def t = restaurant.Reservation.withCriteria{
            between('dat', p, d)
            }.table.id
            
           
            
            

           
    }