import 'package:lazydb/shared/constant.dart';
import 'package:nocterm/nocterm.dart';

class LastConnections extends StatelessComponent {
  const LastConnections({
    super.key,
    required this.connections,
    required this.selectedIndex,
  });

  final List<String> connections;
  final int? selectedIndex;

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
          for (var index = 0; index < connections.length; index++)
            Container(
              width: double.infinity,
              color: selectedIndex == index ? Colors.white : null,
              child: Text(
                connections[index],
                style: TextStyle(
                  color: selectedIndex == index ? Colors.black : Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
