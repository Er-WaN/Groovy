package restaurant



import org.junit.*
import grails.test.mixin.*

@TestFor(CommandeController)
@Mock(Commande)
class CommandeControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/commande/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.commandeInstanceList.size() == 0
        assert model.commandeInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.commandeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.commandeInstance != null
        assert view == '/commande/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/commande/show/1'
        assert controller.flash.message != null
        assert Commande.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/commande/list'


        populateValidParams(params)
        def commande = new Commande(params)

        assert commande.save() != null

        params.id = commande.id

        def model = controller.show()

        assert model.commandeInstance == commande
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/commande/list'


        populateValidParams(params)
        def commande = new Commande(params)

        assert commande.save() != null

        params.id = commande.id

        def model = controller.edit()

        assert model.commandeInstance == commande
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/commande/list'

        response.reset()


        populateValidParams(params)
        def commande = new Commande(params)

        assert commande.save() != null

        // test invalid parameters in update
        params.id = commande.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/commande/edit"
        assert model.commandeInstance != null

        commande.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/commande/show/$commande.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        commande.clearErrors()

        populateValidParams(params)
        params.id = commande.id
        params.version = -1
        controller.update()

        assert view == "/commande/edit"
        assert model.commandeInstance != null
        assert model.commandeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/commande/list'

        response.reset()

        populateValidParams(params)
        def commande = new Commande(params)

        assert commande.save() != null
        assert Commande.count() == 1

        params.id = commande.id

        controller.delete()

        assert Commande.count() == 0
        assert Commande.get(commande.id) == null
        assert response.redirectedUrl == '/commande/list'
    }
}
