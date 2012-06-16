package cuisine



import org.junit.*
import grails.test.mixin.*

@TestFor(BoissonController)
@Mock(Boisson)
class BoissonControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/boisson/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.boissonInstanceList.size() == 0
        assert model.boissonInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.boissonInstance != null
    }

    void testSave() {
        controller.save()

        assert model.boissonInstance != null
        assert view == '/boisson/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/boisson/show/1'
        assert controller.flash.message != null
        assert Boisson.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/boisson/list'


        populateValidParams(params)
        def boisson = new Boisson(params)

        assert boisson.save() != null

        params.id = boisson.id

        def model = controller.show()

        assert model.boissonInstance == boisson
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/boisson/list'


        populateValidParams(params)
        def boisson = new Boisson(params)

        assert boisson.save() != null

        params.id = boisson.id

        def model = controller.edit()

        assert model.boissonInstance == boisson
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/boisson/list'

        response.reset()


        populateValidParams(params)
        def boisson = new Boisson(params)

        assert boisson.save() != null

        // test invalid parameters in update
        params.id = boisson.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/boisson/edit"
        assert model.boissonInstance != null

        boisson.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/boisson/show/$boisson.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        boisson.clearErrors()

        populateValidParams(params)
        params.id = boisson.id
        params.version = -1
        controller.update()

        assert view == "/boisson/edit"
        assert model.boissonInstance != null
        assert model.boissonInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/boisson/list'

        response.reset()

        populateValidParams(params)
        def boisson = new Boisson(params)

        assert boisson.save() != null
        assert Boisson.count() == 1

        params.id = boisson.id

        controller.delete()

        assert Boisson.count() == 0
        assert Boisson.get(boisson.id) == null
        assert response.redirectedUrl == '/boisson/list'
    }
}
