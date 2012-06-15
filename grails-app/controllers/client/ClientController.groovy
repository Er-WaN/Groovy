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
        def entres = params.commande.entres
        def plats = params.commande.plats
        def desserts = params.commande.desserts
        def commande = [:]
        commande << entres
        commande << plats
        commande << desserts
        println(commande)
        def total = 0;
        session.commande = commande
        [commande: commande, total: total]
    }
    
    def choix_formule()
    {
        session.nombre_personnes = params.nb_place
    }
    
    def boissons(){}
    
    def menus() {}
    
    
}
