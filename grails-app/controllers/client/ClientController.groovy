package client

class ClientController {

    def index()
    {
    }
    
    def carte()
    {
    }
    
    def valider_carte()
    {
        
        if (params?.commande?.plats)
        {
           session["plats"] = params.commande.plats
           def total = 0;
           [total: total]
        }
        else if (params?.commande?.boissons)
        {
           session["boissons"] = params.commande.boissons
           def total = 0;
           [total: total]
        }        
        else
        {   
            def total = 0;
            [total: total]
        }
    }
    
    def validation_commande()
    {
        def commandeInstance = new restaurant.Commande()
        commandeInstance.dat = new Date()
        commandeInstance.table_id = restaurant.Tabl.get(1).id
        commandeInstance.prix = session.prix_commande
        commandeInstance.etat = 1
        commandeInstance.save(flush:true)        
        
        if (session.plats)
        {
            for (i in session.plats)
            {
                if (i.value != "0")
                {
                   def commandePlatInstance = new restaurant.Commande_plat()
                    commandePlatInstance.type = 1
                    commandePlatInstance.commande = commandeInstance
                    commandePlatInstance.plat_id = i.key.toInteger()
                    commandePlatInstance.quantite = i.value.toInteger()
                    commandePlatInstance.save(flush:true) 
                }         
            }
        }
        if (session.boissons)
        {
            for (i in session.boissons)
            {
                if (i.value != "0")
                {
                    def commandePlatInstance = new restaurant.Commande_plat()
                    commandePlatInstance.type = 2
                    commandePlatInstance.commande = commandeInstance
                    commandePlatInstance.plat_id = i.key.toInteger()
                    commandePlatInstance.quantite = i.value.toInteger()
                    commandePlatInstance.save(flush:true)
                }
            }
        }
        
    }
    
    def choix_formule()
    {
        session.nombre_personnes = params.nb_place
    }
    
    def boissons(){}
    
    def menus() {}
    
    
}
