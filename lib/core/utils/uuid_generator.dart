import 'dart:math';

String generateUuid() {
  const int length = 24;
  const String charset = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';

  final Random random = Random();
  String result = '';

  for (int i = 0; i < length; i++) {
    final int randomIndex = random.nextInt(charset.length);
    result += charset[randomIndex];
  }

  return result;
}
