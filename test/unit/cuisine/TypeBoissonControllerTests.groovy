package cuisine



import org.junit.*
import grails.test.mixin.*

@TestFor(TypeBoissonController)
@Mock(TypeBoisson)
class TypeBoissonControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/typeBoisson/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.typeBoissonInstanceList.size() == 0
        assert model.typeBoissonInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.typeBoissonInstance != null
    }

    void testSave() {
        controller.save()

        assert model.typeBoissonInstance != null
        assert view == '/typeBoisson/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/typeBoisson/show/1'
        assert controller.flash.message != null
        assert TypeBoisson.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/typeBoisson/list'


        populateValidParams(params)
        def typeBoisson = new TypeBoisson(params)

        assert typeBoisson.save() != null

        params.id = typeBoisson.id

        def model = controller.show()

        assert model.typeBoissonInstance == typeBoisson
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/typeBoisson/list'


        populateValidParams(params)
        def typeBoisson = new TypeBoisson(params)

        assert typeBoisson.save() != null

        params.id = typeBoisson.id

        def model = controller.edit()

        assert model.typeBoissonInstance == typeBoisson
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/typeBoisson/list'

        response.reset()


        populateValidParams(params)
        def typeBoisson = new TypeBoisson(params)

        assert typeBoisson.save() != null

        // test invalid parameters in update
        params.id = typeBoisson.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/typeBoisson/edit"
        assert model.typeBoissonInstance != null

        typeBoisson.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/typeBoisson/show/$typeBoisson.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        typeBoisson.clearErrors()

        populateValidParams(params)
        params.id = typeBoisson.id
        params.version = -1
        controller.update()

        assert view == "/typeBoisson/edit"
        assert model.typeBoissonInstance != null
        assert model.typeBoissonInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/typeBoisson/list'

        response.reset()

        populateValidParams(params)
        def typeBoisson = new TypeBoisson(params)

        assert typeBoisson.save() != null
        assert TypeBoisson.count() == 1

        params.id = typeBoisson.id

        controller.delete()

        assert TypeBoisson.count() == 0
        assert TypeBoisson.get(typeBoisson.id) == null
        assert response.redirectedUrl == '/typeBoisson/list'
    }
}
