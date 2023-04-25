import 'package:socket_io_client/socket_io_client.dart' as io;

class Global {
  late io.Socket socket;

  void connectToServer() {
    socket = io.io('http://172.16.1.8:3000/', <String, dynamic>{
      'transports': ['websocket'],
      'rejectUnauthorized': false,
    });
    socket.onConnect((_) {
      handleListener();
      print('connect at Time: ${DateTime.now()}');
      print('connect success');
    });
  }

  void handleListener() {
    socket.on('client', (response) => {});
    socket.on('connect_timeout', (response) => {});
    socket.on(
        'connect_error', (response) => {print('connect_error => Time: ')});
    socket.on('disconnect', (response) => {print(response)});
  }

  //Send to Server
  void send(option) {
    if (option.token) {
      if (option.client) {
        Object response = {
          "status": 1,
          "token": option.token,
          "data": option.data,
          "message": null
        };
        // response.next(response);
      } else {
        option['authentication'] = {};
        socket.emit('server', option);
      }
    }
  }
}
