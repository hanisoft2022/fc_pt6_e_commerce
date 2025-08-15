extension StringX on String {
  String get toSnakeCase {
    final exp = RegExp(r'(?<=[a-z0-9])(?=[A-Z])');
    final snake = replaceAllMapped(exp, (match) => '_');
    return snake.toLowerCase();
  }
}
