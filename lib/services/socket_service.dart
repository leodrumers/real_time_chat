import 'package:chat_app/global/environment.dart';
import 'package:chat_app/services/auth_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus { Online, Offline, Connecting }

class SocketServiceProvider with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Connecting;
  IO.Socket _socket;

  ServerStatus get serverStatus => this._serverStatus;
  IO.Socket get socket => _socket;
  Function get emit => this._socket.emit;

  SocketServiceProvider() {
    this.connect();
  }

  void connect() async {
    final String token = await AuthService.getToken();

    // Dart client
    this._socket = IO.io(Environment.socketUrl, {
      'transports': ['websocket'],
      'autoConnect': true,
      'forceNew': true,
      'extraHeaders': {'x-token': token}
    });
    this._socket.on('connect', (_) {
      _serverStatus = ServerStatus.Online;
      notifyListeners();
    });
    this._socket.on('disconnect', (_) {
      _serverStatus = ServerStatus.Offline;
      notifyListeners();
    });

    this._socket.on('nuevo-mensaje', (data) {
      print('Recibiendo data del servidor: $data');
    });
  }

  void disconnect() {
    this._socket.disconnect();
  }
}
