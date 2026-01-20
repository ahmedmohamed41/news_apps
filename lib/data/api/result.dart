class Result<T> {}

class Success<T> extends Result<T> {
  T data;
  Success(this.data);
}

class ServerError<T> extends Result<T> {
  String message;
  ServerError(
    this.message,
  );
}

class Error<T> extends Result<T> {
  String exception;
  Error(
    this.exception,
  );
}
