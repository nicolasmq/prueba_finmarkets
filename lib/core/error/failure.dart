
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {

  final String message;
  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);

}

class Unauthorized extends Failure {
  const Unauthorized(super.message);

}

class BadRequest extends Failure {
  const BadRequest(super.message);

}

class Forbidden extends Failure {
  const Forbidden(super.message);

}

class TooManyRequest extends Failure {
  const TooManyRequest(super.message);

}

class NoData extends Failure {
  const NoData(super.message);

}
