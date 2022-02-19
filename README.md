# SOCKET

## PRISE DE NOTE

Socket permet de faire des requêtes bidirectionnelles sur le réseau. Diffèrent avec http qui lui fait (requête/réponse).
- SOCKET nous laissons le canal ouvert pour une communication du style tchat par exemple
- SERVEUR SOCKET peut écouter et recevoir des connexions de plusieurs clients de sockets

## AVEC DART LANG
- nous créons des "socket client" à l'aide de la "class" Socket
- "socket serveur" => SocketServer => class

### Uint8List
- Une liste de longueur fixe d'entiers (8bits)

#### PACKAGE NATIVE

```dart
import 'dart:io';
import 'dart:typed_data';
```

