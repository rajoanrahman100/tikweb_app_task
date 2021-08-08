import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:tikwebapptask/components/storage.dart';

class LocationController extends GetxController{



  @override
  void onInit() {
    // TODO: implement onInit
    getTimeZoneInfo();
  }

  getTimeZoneInfo() async {

    print("calling coordinates");

    await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high).then((value){
      return getAddressFromLatLng(value);
    });

  }

  Future<Position?> getAddressFromLatLng(position) async {
    try {

      print("lat ${position.latitude} and long ${position.longitude}}");


      boxStorage.write(USER_LAT, position.latitude.toString());
      boxStorage.write(USER_LONG, position.longitude.toString());

      List<Placemark?> placemarks =
      await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0]!;
      print(place);
      var _currentAddress = "${place.street}, ${place.subLocality}, ${place.locality}";

      print("address $_currentAddress");
    } catch (e) {
      print(e);
    }
  }

}