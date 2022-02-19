import 'dart:io';
import 'dart:typed_data';

void main() async {
  // se connecter au serveur de socket
  final socket = await Socket.connect('localhost', 4000);
  print('Connecté à : ${socket.remoteAddress.address}:${socket.remotePort}');

  // écouter les réponses du serveur
  socket.listen((Uint8List data) {
    final serverReponse = String.fromCharCodes(data);
    print('Serveur : $serverReponse');
  }, onError: (error) {
    print(error);
    socket.destroy();
  }, onDone: () {
    print('Server left');
    socket.destroy();
  });

  await envoyerMessage(socket, 'Toc Toc');
}

Future<void> envoyerMessage(Socket socket, String message) async {
  print('Client : $message');
  socket.write(message);
  await Future.delayed(Duration(seconds: 2));
}
