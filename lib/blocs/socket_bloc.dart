import 'package:flutter/foundation.dart';
import 'package:messenger/blocs/auth_bloc.dart';

import 'package:socket_io_client/socket_io_client.dart' as io;

import '../globals/env.dart';

enum ServerStatus { online, offline, connecting }

class SocketBloc with ChangeNotifier {
  ServerStatus _status = ServerStatus.connecting;
  ServerStatus get status => _status;
  bool get isConnected => _status == ServerStatus.online;

  io.Socket _socket;
  io.Socket get socket => _socket;

  Function get emit => _socket.emit;

  void connect() async {
    final token = await AuthBloc.getToken();

    _socket = io.io(Environment.serverURL, {
      'transports': ['websocket'],
      'autoConnect': true,
      'forceNew': true,
      'extraHeaders': {'x-token': token}
    })
      ..on('connect', (_) {
        _status = ServerStatus.online;
        notifyListeners();
      })
      ..on('disconnect', (_) {
        _status = ServerStatus.offline;
        notifyListeners();
      });
  }

  void disconnect() => _socket.disconnect();
}
