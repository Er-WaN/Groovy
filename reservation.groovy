import org.codehaus.groovy.runtime.TimeCategory
now = new Date()
use(TimeCategory)
    {
        now2 = now - 2.hours
        println now2
    }


def t = restaurant.Reservation.findAll("from restaurant.Reservation as r where r.dat = '$now'").table.id

def a = restaurant.Tabl.withCriteria {
    not {
        'in'('id', t)
    }
    gt('nb_places', 2)
    order('nb_places', 'asc')
}.collect{it.id}

