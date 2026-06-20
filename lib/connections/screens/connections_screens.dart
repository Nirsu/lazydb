import 'package:lazydb/connections/widgets/last_connections.dart';
import 'package:lazydb/shared/constant.dart';
import 'package:nocterm/nocterm.dart';

class ConnectionsScreens extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(logoASCII),
          const LastConnections(),
          const Text('+ New Connection'),
        ],
      ),
    );
  }
}
