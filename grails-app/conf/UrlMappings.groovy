class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}
                "/client/choix_formule?/$nb_place?"(controller: "client", action: "choix_formule")

		"/"(controller: "login")
		"500"(view:'/error')
	}
}
