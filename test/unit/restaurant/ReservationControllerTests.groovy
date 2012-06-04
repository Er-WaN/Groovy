package restaurant



import org.junit.*
import grails.test.mixin.*

@TestFor(ReservationController)
@Mock(Reservation)
class ReservationControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/reservation/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.reservationInstanceList.size() == 0
        assert model.reservationInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.reservationInstance != null
    }

    void testSave() {
        controller.save()

        assert model.reservationInstance != null
        assert view == '/reservation/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/reservation/show/1'
        assert controller.flash.message != null
        assert Reservation.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/reservation/list'


        populateValidParams(params)
        def reservation = new Reservation(params)

        assert reservation.save() != null

        params.id = reservation.id

        def model = controller.show()

        assert model.reservationInstance == reservation
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/reservation/list'


        populateValidParams(params)
        def reservation = new Reservation(params)

        assert reservation.save() != null

        params.id = reservation.id

        def model = controller.edit()

        assert model.reservationInstance == reservation
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/reservation/list'

        response.reset()


        populateValidParams(params)
        def reservation = new Reservation(params)

        assert reservation.save() != null

        // test invalid parameters in update
        params.id = reservation.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/reservation/edit"
        assert model.reservationInstance != null

        reservation.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/reservation/show/$reservation.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        reservation.clearErrors()

        populateValidParams(params)
        params.id = reservation.id
        params.version = -1
        controller.update()

        assert view == "/reservation/edit"
        assert model.reservationInstance != null
        assert model.reservationInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/reservation/list'

        response.reset()

        populateValidParams(params)
        def reservation = new Reservation(params)

        assert reservation.save() != null
        assert Reservation.count() == 1

        params.id = reservation.id

        controller.delete()

        assert Reservation.count() == 0
        assert Reservation.get(reservation.id) == null
        assert response.redirectedUrl == '/reservation/list'
    }
}
