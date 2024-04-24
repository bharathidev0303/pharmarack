import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;

class InternetConnectionUtils {
  const InternetConnectionUtils({checkconnection});
  Future<dynamic> checkconnection() async {
    try {
      final url = Uri.https('google.com');
      var response = await http.head(url);
      if (response.statusCode == 200) {
        print("ssdfssddzfsdfsd");

        return true;
      } else {
        print("sdfsddasdsd");
        return false;
      }
    } catch (e) {
      print("sdfsd");
      return false;
    }
    // final Connectivity connectivity = Connectivity();
    // var result = await connectivity.checkConnectivity();
    // print(result);
    // print("dxfsdz");
    // switch (result) {
    //   case [ConnectivityResult.mobile]:
    //     try {
    //       final result = await InternetAddress.lookup('google.com');
    //       if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
    //         return true;
    //       }
    //     } on SocketException catch (_) {
    //       return false;
    //     }
    //   case [ConnectivityResult.wifi]:
    //     try {
    //       final result = await InternetAddress.lookup('google.com');
    //       if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
    //         return true;
    //       }
    //     } on SocketException catch (_) {
    //       return false;
    //     }
    //   case [ConnectivityResult.none]:
    //     return false;
    //   default:
    //     return false;
    // }
  }
}

class ConnectionStatusListener {
  //This creates the single instance by calling the `_internal` constructor specified below
  static final _singleton = ConnectionStatusListener._internal();

  ConnectionStatusListener._internal();

  bool hasShownNoInternet = false;

  //connectivity_plus
  final Connectivity _connectivity = Connectivity();

  //This is what's used to retrieve the instance through the app
  static ConnectionStatusListener getInstance() => _singleton;

  //This tracks the current connection status
  bool hasConnection = false;

  //This is how we'll allow subscribing to connection changes
  StreamController connectionChangeController = StreamController.broadcast();

  Stream get connectionChange => connectionChangeController.stream;

  //flutter_connectivity's listener
  void _connectionChange(ConnectivityResult result) {
    checkConnection();
  }

  //The test to actually see if there is a connection
  Future<bool> checkConnection() async {
    bool previousConnection = hasConnection;

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        hasConnection = true;
      } else {
        hasConnection = false;
      }
    } on SocketException catch (_) {
      hasConnection = false;
    }

    //The connection status changed send out an update to all listeners
    if (previousConnection != hasConnection) {
      connectionChangeController.add(hasConnection);
    }

    return hasConnection;
  }

  //Hook into connectivity_plus's Stream to listen for changes
  //And check the connection status out of the gate
  Future<void> initialize() async {
    _connectivity.onConnectivityChanged.listen(
        _connectionChange as void Function(List<ConnectivityResult> event)?);
    await checkConnection();
  }

  //A clean up method to close our StreamController
  //Because this is meant to exist through the entire application life cycle this isn't really an issue
  void dispose() {
    connectionChangeController.close();
  }
}

updateConnectivity(
  dynamic hasConnection,
  ConnectionStatusListener connectionStatus,
) {
  print("dfjhgsxvzdfsgnbdfcg");
  if (!hasConnection) {
    connectionStatus.hasShownNoInternet = true;
    print("sdzsdsdfx");
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => const NoInternetScreen()),
    // );
  } else {
    if (connectionStatus.hasShownNoInternet) {
      connectionStatus.hasShownNoInternet = false;
      print("sdfsdsdfsdfsf");
      // Navigator.pop(context);
    }
  }
}

initNoInternetListener() async {
  var connectionStatus = ConnectionStatusListener.getInstance();
  await connectionStatus.initialize();
  if (!connectionStatus.hasConnection) {
    updateConnectivity(false, connectionStatus);
  }
  connectionStatus.connectionChange.listen((event) {
    print("initNoInternetListener $event");
    print(connectionStatus);
    print("sdfssdfsdfsdgdfs");
    updateConnectivity(event, connectionStatus);
  });
}
