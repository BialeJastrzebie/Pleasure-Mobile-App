import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  // Stream to listen for connectivity changes
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final StreamController<ConnectivityResult> _connectivityStreamController = StreamController<ConnectivityResult>.broadcast();

  ConnectivityService() {
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      _connectivityStreamController.add(result);
    });
  }

  // Stream getter
  Stream<ConnectivityResult> get connectivityStream => _connectivityStreamController.stream;

  // Check the initial connectivity status
  Future<ConnectivityResult> checkConnectivity() async {
    return await _connectivity.checkConnectivity();
  }

  void dispose() {
    _connectivitySubscription.cancel();
    _connectivityStreamController.close();
  }
}
