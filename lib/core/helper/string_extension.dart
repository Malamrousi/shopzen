extension StringFormat on String {
  String toCapitalized() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String imageProductFormate() {
    return replaceAll(RegExp(r'^\["?|"\]?|"$'), '');
  }

  String convertLongString() {
    final shortString = split(' ').sublist(0, split(' ').length - 2).join(' ');
    return shortString;
  }
}
