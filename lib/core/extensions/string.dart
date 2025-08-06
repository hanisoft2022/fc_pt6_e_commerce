extension StringX on String {
  String toSnakeCase() {
    final exp = RegExp(r'(?<=[a-z0-9])(?=[A-Z])');
    final snake = replaceAllMapped(exp, (match) => '_');
    return snake.toLowerCase();
  }
}
