package cuisine

class Plat {
    int id
    String libelle
    int typeplatid
    String description
    double prix
    
    static hasMany = [menus:Menu]
    static belongsTo = TypePlat
    
    static optionals = ["description"]
    
    static constraints = {
        libelle(maxLength:50,blank:false)
        description(blank:false,nullable:true)
        typeplatid(blank:false,nullable:false)
        prix(blank:false,nullable:false)  
    }
}
