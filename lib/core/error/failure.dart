import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class OfflineFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class EmptyCashFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class PassowrdWrongFailuer extends Failure {
  @override
  List<Object?> get props => [];
}

class OperationNotCompletedFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class EmptyRemotDataFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class UnexpectedErrorFailuer extends Failure {
  @override
  List<Object?> get props => [];
}

class DuplicateFailuer extends Failure {
  @override
  List<Object?> get props => [];
}

class PermissionFailuer extends Failure {
  @override
  List<Object?> get props => [];
}

class LinkedRecourdFailuer extends Failure {
  @override
  List<Object?> get props => [];
}

class BalanceNotEneghFailuer extends Failure {
  @override
  List<Object?> get props => [];
}

class NameNotEneghFailuer extends Failure {
  @override
  List<Object?> get props => [];
}

class EmailExistsFailuer extends Failure {
  @override
  List<Object?> get props => [];
}

class EmailWrongFailuer extends Failure {
  @override
  List<Object?> get props => [];
}

class TimeDoneFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class CodeIsFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class InvalidImageTypeFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ImageToLagargeFailure extends Failure {
  @override
  List<Object?> get props => [];
}
