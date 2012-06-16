package restaurant

class Commande {
    int id
    int etat
    Date dat
    int table_id
    int prix

    static constraints = {
        table_id blank: true
    }
}
