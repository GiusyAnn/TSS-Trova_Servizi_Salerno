class GeoException implements Exception {
  String cause;
  GeoException(this.cause);
  @override
  String toString() {
    return cause;
  }
}