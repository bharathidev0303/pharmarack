class Success<T> {
  T data;

  Success(this.data);
}

class Failure {
  String failureMessage;
  int statusCode;

  Failure(this.failureMessage, this.statusCode);
}
