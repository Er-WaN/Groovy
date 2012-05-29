package cuisine

class Menu {
    int id
    String libelle
    String description
    double prix
    
    static hasMany = [plats:Plat]
    static belongsTo = Plat
    
    static optionals = ["description"]
    
    static constraints = {
        libelle(maxLength:50,blank:false)
        description(maxLength:50,nullable:true)
        prix(nullable:false)
    }
}
