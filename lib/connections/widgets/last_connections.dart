import 'package:lazydb/shared/constant.dart';
import 'package:nocterm/nocterm.dart';

class LastConnections extends StatefulComponent {
  const LastConnections({super.key});

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
          Text('Connection 1'),
          Text('Connection 2'),
          Text('Connection 3'),
        ],
      ),
    );
  }
}
