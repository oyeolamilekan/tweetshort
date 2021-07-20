import 'dart:io';

import '../../exceptions/http_exception.dart';

class ApiError {
  static checkResponse(statusCode) {
    switch (statusCode) {
      case 500:
        throw FetchDataException();
      case 400:
        throw BadRequestException();
      case 401:
      case 403:
        throw UnauthorisedException();
      case 404:
        throw DataNotFoundException();
      case 504:
        throw TimeOutException();
      case 503:
        throw ServiceUnavailable();
      default:
    }
  }

  static convertExceptionToString(Exception e) {
    String message = "Something bad, don't worry we are fixing it.";
    if (e is TimeOutException) {
      message = "There is a time out error, don't worry we are fixing it.";
    } else if (e is SocketException) {
      message = "Please kindly check your internet.";
    } else if (e is BadRequestException) {
      message = "Authentication Failed! Wrong password.";
    } else if (e is DataNotFoundException) {
      message = "The data you asked for can't be found on our servers.";
    } else if (e is FetchDataException) {
      message =
          "There is something wrong with our servers, kindly check your link and try again.";
    } else if (e is ServiceUnavailable) {
      message = "The server is currently unable to handle your request.";
    } else if (e is TimeOutException) {
      message =
          "Looks like the server is taking to long to respond, please try again in sometime.";
    }
    return message;
  }
}
