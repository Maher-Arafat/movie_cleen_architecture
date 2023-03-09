import 'package:movies/core/network/error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  ServerException({required this.errorMessageModel});
}

class Localeexception implements Exception {
  final String error;

  Localeexception({required this.error});
}
