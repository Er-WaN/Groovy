package restaurant

import org.joda.time.*
import org.joda.time.contrib.hibernate.*

class Reservation {
    
    int id
    int table_id
    String nom_client
    int nombre_personnes
    LocalTime heure
    String commentaire
    static constraints = {
    }
}
