const logoASCII = r'''
██╗      █████╗ ███████╗██╗   ██╗██████╗ ██████╗
██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██╔══██╗██╔══██╗
██║     ███████║  ███╔╝  ╚████╔╝ ██║  ██║██████╔╝
██║     ██╔══██║ ███╔╝    ╚██╔╝  ██║  ██║██╔══██╗
███████╗██║  ██║███████╗   ██║   ██████╔╝██████╔╝
╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═════╝ ╚═════╝
''';

// Get the width of the ASCII logo by using the longest rendered line.
final logoWidth = logoASCII
    .trim()
    .split('\n')
    .fold<double>(
      0,
      (width, line) => line.length > width ? line.length.toDouble() : width,
    );
