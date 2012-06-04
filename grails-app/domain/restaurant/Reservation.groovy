package restaurant


class Reservation {
    
    int id
    Tabl table
    String nom_client
    int nombre_personnes
    Date dat
    int heure
    int minute
    String commentaire
    static constraints =
    {
        heure(inList:[11, 12, 13, 19, 20, 21, 22, 23])
        minute(inList:[00, 15, 30, 45])
        table(nullable:true)
    }
    
    
}
