package restaurant

class Tabl {
    
    int id
    int nb_places    
    
    static constraints = {
        nb_places(range:2..8, bank:false, nullable:false)
    }
}
