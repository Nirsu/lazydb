import 'package:lazydb/connections/widgets/last_connections.dart';
import 'package:lazydb/shared/constant.dart';
import 'package:lazydb/shared/widgets/shortcut_bar.dart';
import 'package:nocterm/nocterm.dart';

class ConnectionsScreens extends StatefulComponent {
  const ConnectionsScreens({super.key});

  @override
  State<ConnectionsScreens> createState() => _ConnectionsScreensState();
}

class _ConnectionsScreensState extends State<ConnectionsScreens> {
  final _connections = const <String>[];

  int _selectedIndex = 0;

  int get _addConnectionIndex => _connections.length;

  int get _focusableCount => _connections.length + 1;

  bool get _isAddConnectionSelected => _selectedIndex == _addConnectionIndex;

  void _moveSelection(int delta) {
    setState(() {
      _selectedIndex = (_selectedIndex + delta).clamp(0, _focusableCount - 1);
    });
  }

  bool _handleKeyEvent(KeyboardEvent event) {
    if (event.logicalKey == LogicalKey.keyQ) {
      shutdownApp();
      return true;
    }

    if (event.logicalKey == LogicalKey.arrowUp ||
        (event.logicalKey == LogicalKey.tab && event.isShiftPressed)) {
      _moveSelection(-1);
      return true;
    }

    if (event.logicalKey == LogicalKey.arrowDown ||
        event.logicalKey == LogicalKey.tab) {
      _moveSelection(1);
      return true;
    }

    if (event.logicalKey == LogicalKey.enter) {
      _openSelectedItem();
      return true;
    }

    return false;
  }

  void _openSelectedItem() {
    if (_isAddConnectionSelected) {
      // TODO: Open the new connection flow when it exists.
    }
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
            if (_connections.isNotEmpty)
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
                color: _isAddConnectionSelected ? Colors.white : null,
                child: Text(
                  '+ Add new connection',
                  style: TextStyle(
                    color: _isAddConnectionSelected
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
              ),
            ),
            const ShortcutBar(
              shortcuts: [
                (key: '↑/↓', label: 'Navigate'),
                (key: 'Enter', label: 'Select'),
                (key: 'q', label: 'Quit'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
