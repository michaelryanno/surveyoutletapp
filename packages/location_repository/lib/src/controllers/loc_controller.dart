import 'package:location_repository/location_repository.dart';
import 'package:geolocator/geolocator.dart';
import 'package:survey_outlet_app/utils/auth/cache_manager.dart';

class CurrPosition with CacheManager{

  Future<dynamic> getCurrentPosition() async {
    HandleLoc _handleLoc = HandleLoc();
    final hasPermission = await _handleLoc.handleLocationPermission();
    if (!hasPermission) return;
    var dd = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((Position position) {
      // setState(() => _currentPosition = position);
      var ps = {
        "latitude": double.parse(position.latitude.toString()),
        "longitude": double.parse(position.longitude.toString())
        // "latitude": position.latitude.toString(),
        // "longitude": position.longitude.toString()
      };
      // saveCurPosition(ps);
      // print(position.runtimeType);
      return ps;
    }).catchError((e) {
      // debugPrint(e);
      // print(e);
      return null;
    });
    return dd;
  }
}