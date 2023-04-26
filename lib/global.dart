import 'dart:async';

import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:rxdart/rxdart.dart';

late io.Socket socketIO;
late BehaviorSubject<Map<String, dynamic>> result;

class Global {
  BehaviorSubject<Map<String, dynamic>> getResponse() {
    return result;
  }

  void connectServer() {
    try {
      result = BehaviorSubject<Map<String, dynamic>>();
      socketIO = io.io('http://192.168.1.5:3000/', <String, dynamic>{
        'transports': ['websocket'],
        'rejectUnauthorized': false,
      });
      socketIO.on('connect', (_) {
        handleListener();
        print('connect at Time: ${DateTime.now()}');
        print('connect success');
      });
    } catch (error) {
      print('Failed to connect to server: $error');
    }
  }

  void handleListener() {
    socketIO.on('client', (response) {
      result.add(response);
    });
    socketIO.on('connect_timeout', (response) => {});
    socketIO.on(
        'connect_error', (response) => {print('connect_error => Time: ')});
    socketIO.on('disconnect', (response) => {print(response)});
  }

  // Send a message to the server
  void send(Map<String, dynamic> option) {
    option['authentication'] = {};
    socketIO.emit('server', option);
  }

  void setTimeout(callback, time) {
    Duration timeDelay = Duration(milliseconds: time);
    Timer(timeDelay, callback);
  }
}
