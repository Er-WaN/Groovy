def n = new Date()
def now = n.format("yyyy-MM-dd 00:00:00")
def h = n.format("hh")
def m = n.format("mm")

def t = restaurant.Reservation.withCriteria {
    eq('dat', now)   
}

println t
println now
println(h+m)

def a = restaurant.Tabl.withCriteria {
    not {
        'in'('id', t)
    }
    gt('nb_places', 2)
    order('nb_places', 'asc')
}.collect{it.id}

println("table choisie: "+a[0])