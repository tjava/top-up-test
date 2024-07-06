import 'package:equatable/equatable.dart';

class CacheException extends Equatable implements Exception {
  final String message;
  final int statusCode;
  const CacheException({
    required this.message,
    this.statusCode = 500,
  });

  @override
  List<Object> get props => [message, statusCode];
}
