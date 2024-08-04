import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:survey_outlet_app/widgets/snackbar_widget.dart';

class HandleLoc {

  Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //     content: Text('Location services are disabled. Please enable the services')));
      SnackBarWidget(title: "Fail", message: "Location services are disabled. Please enable the services", type: SnackBarType.error).show();
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {   
        // ScaffoldMessenger.of(context).showSnackBar(
        //     const SnackBar(content: Text('Location permissions are denied')));
        SnackBarWidget(title: "Fail", message: "Location permissions are denied", type: SnackBarType.error).show();
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //     content: Text('Location permissions are permanently denied, we cannot request permissions.')));
      SnackBarWidget(title: "Fail", message: "Location permissions are permanently denied, we cannot request permissions.", type: SnackBarType.error).show();
      return false;
    }
    return true;
  }
}