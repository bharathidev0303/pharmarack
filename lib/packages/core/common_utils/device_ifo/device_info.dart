/// Container class to get Device info
/// Some common fields included in this [DeviceInfo] class
class DeviceInfo {
  final String model;
  final String manufacturer;
  final String os;
  final String version;
  final String deviceId;

  DeviceInfo({
    required this.model,
    required this.manufacturer,
    required this.os,
    required this.version,
    required this.deviceId,
  });
}
