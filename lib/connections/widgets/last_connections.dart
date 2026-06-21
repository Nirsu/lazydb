import 'package:lazydb/shared/constant.dart';
import 'package:nocterm/nocterm.dart';

class LastConnections extends StatefulComponent {
  const LastConnections({
    super.key,
    required this.connections,
    required this.selectedIndex,
  });

  final List<String> connections;
  final int? selectedIndex;

  @override
  State<LastConnections> createState() => _LastConnectionsState();
}

class _LastConnectionsState extends State<LastConnections> {
  @override
  Component build(BuildContext context) {
    return Container(
      width: logoWidth,
      decoration: BoxDecoration(
        border: BoxBorder.all(color: Colors.white),
        title: const BorderTitle(text: 'Last Connections'),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var index = 0; index < component.connections.length; index++)
            Container(
              width: double.infinity,
              color: component.selectedIndex == index ? Colors.white : null,
              child: Text(
                component.connections[index],
                style: TextStyle(
                  color: component.selectedIndex == index
                      ? Colors.black
                      : Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
