import 'package:nocterm/nocterm.dart';

class ShortcutBar extends StatelessComponent {
  const ShortcutBar({
    super.key,
    required this.shortcuts,
  });

  final List<({String key, String label})> shortcuts;

  @override
  Component build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var index = 0; index < shortcuts.length; index++) ...[
          if (index > 0) const SizedBox(width: 3),
          Text(shortcuts[index].key),
          const Text(': '),
          Text(
            shortcuts[index].label,
            style: TextStyle(color: Color(0xFF808080)),
          ),
        ],
      ],
    );
  }
}
