package restaurant



import org.junit.*
import grails.test.mixin.*

@TestFor(Commande_platController)
@Mock(Commande_plat)
class Commande_platControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/commande_plat/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.commande_platInstanceList.size() == 0
        assert model.commande_platInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.commande_platInstance != null
    }

    void testSave() {
        controller.save()

        assert model.commande_platInstance != null
        assert view == '/commande_plat/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/commande_plat/show/1'
        assert controller.flash.message != null
        assert Commande_plat.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/commande_plat/list'


        populateValidParams(params)
        def commande_plat = new Commande_plat(params)

        assert commande_plat.save() != null

        params.id = commande_plat.id

        def model = controller.show()

        assert model.commande_platInstance == commande_plat
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/commande_plat/list'


        populateValidParams(params)
        def commande_plat = new Commande_plat(params)

        assert commande_plat.save() != null

        params.id = commande_plat.id

        def model = controller.edit()

        assert model.commande_platInstance == commande_plat
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/commande_plat/list'

        response.reset()


        populateValidParams(params)
        def commande_plat = new Commande_plat(params)

        assert commande_plat.save() != null

        // test invalid parameters in update
        params.id = commande_plat.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/commande_plat/edit"
        assert model.commande_platInstance != null

        commande_plat.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/commande_plat/show/$commande_plat.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        commande_plat.clearErrors()

        populateValidParams(params)
        params.id = commande_plat.id
        params.version = -1
        controller.update()

        assert view == "/commande_plat/edit"
        assert model.commande_platInstance != null
        assert model.commande_platInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/commande_plat/list'

        response.reset()

        populateValidParams(params)
        def commande_plat = new Commande_plat(params)

        assert commande_plat.save() != null
        assert Commande_plat.count() == 1

        params.id = commande_plat.id

        controller.delete()

        assert Commande_plat.count() == 0
        assert Commande_plat.get(commande_plat.id) == null
        assert response.redirectedUrl == '/commande_plat/list'
    }
}
