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
        println(params)
    }
    
    def choix_formule()
    {
        session.nombre_personnes = params.nb_place
    }
    
    def boissons(){}
    
    def menus() {}
    
    
}
