extension BoolParisng on String {
  bool parseBool() {
    switch (toLowerCase()) {
      case 'true':
        return true;
      case 'false':
        return false;
      default:
        throw Exception('"$this" can not be parsed to boolean');
    }
  }
}
