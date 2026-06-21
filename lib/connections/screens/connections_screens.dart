import 'package:lazydb/connections/widgets/last_connections.dart';
import 'package:lazydb/shared/constant.dart';
import 'package:nocterm/nocterm.dart';

class ConnectionsScreens extends StatefulComponent {
  const ConnectionsScreens({super.key});

  @override
  State<ConnectionsScreens> createState() => _ConnectionsScreensState();
}

class _ConnectionsScreensState extends State<ConnectionsScreens> {
  final _connections = const [
    'Connection 1',
    'Connection 2',
    'Connection 3',
    'Connection 4',
  ];

  int _selectedIndex = 0;

  bool _handleKeyEvent(KeyboardEvent event) {
    if (event.logicalKey == LogicalKey.arrowUp ||
        (event.logicalKey == LogicalKey.tab && event.isShiftPressed)) {
      setState(() {
        _selectedIndex = (_selectedIndex - 1).clamp(0, _connections.length);
      });
      return true;
    }

    if (event.logicalKey == LogicalKey.arrowDown ||
        event.logicalKey == LogicalKey.tab) {
      setState(() {
        _selectedIndex = (_selectedIndex + 1).clamp(0, _connections.length);
      });
      return true;
    }

    if (event.logicalKey == LogicalKey.enter) {
      if (_selectedIndex == _connections.length) {
        print('New Connection button pressed');
      } else {
        print('Connection selected: ${_connections[_selectedIndex]}');
      }
      return true;
    }

    return false;
  }

  @override
  Component build(BuildContext context) {
    return Focusable(
      focused: true,
      onKeyEvent: _handleKeyEvent,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(logoASCII),
            LastConnections(
              connections: _connections,
              selectedIndex: _selectedIndex < _connections.length
                  ? _selectedIndex
                  : null,
            ),
            Container(
              width: logoWidth,
              decoration: BoxDecoration(
                border: BoxBorder.all(color: Colors.white),
              ),
              child: Container(
                alignment: Alignment.center,
                color: _selectedIndex == _connections.length
                    ? Colors.white
                    : null,
                child: Text(
                  '+ Add new connection',
                  style: TextStyle(
                    color: _selectedIndex == _connections.length
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
