class CustomException implements Exception {
  final _message;
  final _prefix;

  CustomException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException([String? message]) : super(message, "Couldn't fetch data");
}

class TimeOutException extends CustomException {
  TimeOutException([String? message])
      : super(message, "There has been a timeout exception from server");
}

class ServiceUnavailable extends CustomException {
  ServiceUnavailable([String? message])
      : super(message, "Server is down during Communication: ");
}

class DataNotFoundException extends CustomException {
  DataNotFoundException([String? message])
      : super(message,
            "The data you are looking for can not be found on our servers");
}

class BadRequestException extends CustomException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}
