package restaurant



import org.junit.*
import grails.test.mixin.*

@TestFor(TablController)
@Mock(Tabl)
class TablControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/tabl/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.tablInstanceList.size() == 0
        assert model.tablInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.tablInstance != null
    }

    void testSave() {
        controller.save()

        assert model.tablInstance != null
        assert view == '/tabl/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/tabl/show/1'
        assert controller.flash.message != null
        assert Tabl.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/tabl/list'


        populateValidParams(params)
        def tabl = new Tabl(params)

        assert tabl.save() != null

        params.id = tabl.id

        def model = controller.show()

        assert model.tablInstance == tabl
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/tabl/list'


        populateValidParams(params)
        def tabl = new Tabl(params)

        assert tabl.save() != null

        params.id = tabl.id

        def model = controller.edit()

        assert model.tablInstance == tabl
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/tabl/list'

        response.reset()


        populateValidParams(params)
        def tabl = new Tabl(params)

        assert tabl.save() != null

        // test invalid parameters in update
        params.id = tabl.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/tabl/edit"
        assert model.tablInstance != null

        tabl.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/tabl/show/$tabl.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        tabl.clearErrors()

        populateValidParams(params)
        params.id = tabl.id
        params.version = -1
        controller.update()

        assert view == "/tabl/edit"
        assert model.tablInstance != null
        assert model.tablInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/tabl/list'

        response.reset()

        populateValidParams(params)
        def tabl = new Tabl(params)

        assert tabl.save() != null
        assert Tabl.count() == 1

        params.id = tabl.id

        controller.delete()

        assert Tabl.count() == 0
        assert Tabl.get(tabl.id) == null
        assert response.redirectedUrl == '/tabl/list'
    }
}
