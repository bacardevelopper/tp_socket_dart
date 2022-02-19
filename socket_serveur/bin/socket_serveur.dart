// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'dart:typed_data';

void main() async {
  print('Mon adresse IP: ${InternetAddress.anyIPv4}');
  // lier serveur_socket à une adresse et un port
  final server = await ServerSocket.bind(mon_ip_ipv4, mon_port);

  // écouter les connexions clients au serveur
  server.listen((client) {
    saisir_connection(client);
  });
}

void saisir_connection(Socket client) {
  print('Connection depuis : '
      '${client.remoteAddress.address}:${client.remotePort}');

  // écouter evenement client
  client.listen((Uint8List data) async {
    await Future.delayed(Duration(seconds: 1));
    final message = String.fromCharCodes(data);

    traitement_message(client, message);
  }, onError: (error) {
    print(error);
    client.close();
  }, onDone: () {
    print('Client left');
    client.close();
  });
}

// -- ip et port config
InternetAddress mon_ip_ipv4 = InternetAddress.anyIPv4;
int mon_port = 4000;

// -- traitement
Future traitement_message(Socket client, String message) async {
  if (message == "Toc Toc") {
    client.write('Who is there ?');
  } else if (message.length < 10) {
    client.write('$message who ?');
  } else {
    client.write('Very funny');
    client.close();
  }
}
