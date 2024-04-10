
import 'package:pharmarack/packages/core/common_utils/location_manager/location_manager.dart';

class LocationInfo {
  final double latitude;
  final double longitude;
  final PermissionState permissionState;

  LocationInfo({
    required this.latitude,
    required this.longitude,
    required this.permissionState,
  });
}
