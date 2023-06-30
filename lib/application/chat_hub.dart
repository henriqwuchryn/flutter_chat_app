import "package:injectable/injectable.dart";
import "package:signalr_netcore/signalr_client.dart";

import "../model/auth/auth.dart";
import "authentication/auth_storage.dart";

@Singleton()
class ChatHub {
  ChatHub(this.authStorage);

  final AuthStorage authStorage;

  static const serverUrl = "http://10.0.2.2:5266/hub";

  HubConnection? hubConnection;

  Future<void> _connect() async {
    await _disconnect();
    var auth = authStorage.currentAuth;
    var localHubConnection = HubConnectionBuilder()
        .withUrl(
          serverUrl,
          options: HttpConnectionOptions(
              accessTokenFactory: () async {
                return auth?.token ?? (throw Exception());
              },
              skipNegotiation: true,
              transport: HttpTransportType.WebSockets),
        )
        .build();

    await localHubConnection.start();
    print("connected");
    localHubConnection.on("updateRoom", (arguments) {
      print(arguments);
    });
    localHubConnection.onclose(({error}) {
      print("ConnectionClosed");
    });

    hubConnection = localHubConnection;
  }

  Future<void> _disconnect() async {
    await hubConnection?.stop();
  }

  Future<void> init() async {
    authStorage.currentAuthStream.listen((event) async {
      await checkAuth(event);
    });
    await checkAuth(authStorage.currentAuth);
  }

  Future<void> checkAuth(Auth? auth) async {
    if (auth == null) {
      await _disconnect();
    } else {
      await _connect();
    }
  }
}
