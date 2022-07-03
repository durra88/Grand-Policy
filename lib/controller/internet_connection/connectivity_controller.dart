import 'dart:async';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:get/get.dart';

class ConnectivityController extends GetxController {
  var status = true.obs;
  // // ignore: prefer_typing_uninitialized_variables
  // var subscription;
  var connectionStatus = 1.obs;
  late StreamSubscription<InternetConnectionStatus> _listener;

  @override
  onInit() {
    _listener = InternetConnectionChecker()
        .onStatusChange
        .listen((InternetConnectionStatus status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          connectionStatus.value = 1;
          break;
        case InternetConnectionStatus.disconnected:
          connectionStatus.value = 0;
          break;
      }
    });
    // subscription = Connectivity()
    //     .onConnectivityChanged
    //     .listen((ConnectivityResult result) {
    //   if (result == ConnectivityResult.none) {
    //     status.value = "Offline";
    //   } else {
    //     status.value = "Online";
    //   }
    // });
    super.onInit();
  }

  // Future<bool> getInternetUsingInternetConnectivity() async {
  //   bool result = await InternetConnectionChecker().hasConnection;
  //   return result;
  // }

  // static getConnectivity() async {
  //   var connectivityResult = await (Connectivity().checkConnectivity());
  //   if (connectivityResult == ConnectivityResult.mobile) {
  //     // I am connected to a mobile network.
  //     log("Mobile Data Connected !");
  //   } else if (connectivityResult == ConnectivityResult.wifi) {
  //     // I am connected to a wifi network.
  //     log("Wifi Connected !");
  //   } else {
  //     log("No Internet !");
  //   }
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   subscription.cancel();
  // }
  @override
  void onClose() {
    _listener.cancel();
  }
}
