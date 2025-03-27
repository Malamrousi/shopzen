extension StringFormat on String {
  String toCapitalized() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }

    String imageProductFormate() {
    return replaceAll(RegExp(r'^\["?|"\]?|"$'), '');
  }
}
