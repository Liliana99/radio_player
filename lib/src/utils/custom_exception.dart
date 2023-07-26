class CustomException implements Exception {
  CustomException({
    this.innerException,
  });
  final dynamic innerException;
  @override
  String toString() => '$innerException  ';
}
