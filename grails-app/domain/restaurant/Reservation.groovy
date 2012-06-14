package restaurant

class Reservation {
    
    int id
    Tabl table
    String nom_client
    int nombre_personnes
    Date dat
    String commentaire
    static constraints =
    {
        table(nullable:true)
    }
    

    
    
}
