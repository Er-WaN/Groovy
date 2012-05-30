package cuisine



import org.junit.*
import grails.test.mixin.*

@TestFor(MenuController)
@Mock(Menu)
class MenuControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/menu/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.menuInstanceList.size() == 0
        assert model.menuInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.menuInstance != null
    }

    void testSave() {
        controller.save()

        assert model.menuInstance != null
        assert view == '/menu/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/menu/show/1'
        assert controller.flash.message != null
        assert Menu.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/menu/list'


        populateValidParams(params)
        def menu = new Menu(params)

        assert menu.save() != null

        params.id = menu.id

        def model = controller.show()

        assert model.menuInstance == menu
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/menu/list'


        populateValidParams(params)
        def menu = new Menu(params)

        assert menu.save() != null

        params.id = menu.id

        def model = controller.edit()

        assert model.menuInstance == menu
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/menu/list'

        response.reset()


        populateValidParams(params)
        def menu = new Menu(params)

        assert menu.save() != null

        // test invalid parameters in update
        params.id = menu.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/menu/edit"
        assert model.menuInstance != null

        menu.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/menu/show/$menu.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        menu.clearErrors()

        populateValidParams(params)
        params.id = menu.id
        params.version = -1
        controller.update()

        assert view == "/menu/edit"
        assert model.menuInstance != null
        assert model.menuInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/menu/list'

        response.reset()

        populateValidParams(params)
        def menu = new Menu(params)

        assert menu.save() != null
        assert Menu.count() == 1

        params.id = menu.id

        controller.delete()

        assert Menu.count() == 0
        assert Menu.get(menu.id) == null
        assert response.redirectedUrl == '/menu/list'
    }
}
