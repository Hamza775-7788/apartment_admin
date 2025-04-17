import 'package:apartment_admin/core/error/exceptions.dart';
import 'package:apartment_admin/core/error/failure.dart';


// تعريف الدوال
Exception codeToException(int code) {
  switch (code) {
    case 301:
      return DuplicateException();
    case 400:
      return OperationNotCompletedException();
    case 300:
      return EmptyRemotDataException();
    case 1451:
      return LinkedRecourdException();
    case 302:
      return EmptyCashException();
    case 500:
      return ServerException();
    case 501:
      return OfflineException();
    case 502:
      return PassowrdWrongExeption();
    case 503:
      return PermissionException();
    case 504:
      return BalanceNotEneghException();
    case 505:
      return NameNotEneghException();
    case 506:
      return EmailExistsExeption();
    case 507:
      return EmailWrongExeption();
    case 508:
      return CodeIsWrongExeption();
    case 509:
      return TimeDoneException();
    case 510:
      return ImageToLagargeException();
    case 511:
      return InvalidTypeImageException();
    default:
      return UnexpectedErrorException();
  }
}

Failure exceptionToFailure(Exception exception) {
  if (exception is DuplicateException) {
    return DuplicateFailuer();
  } else if (exception is OperationNotCompletedException) {
    return OperationNotCompletedFailure();
  } else if (exception is EmptyRemotDataException) {
    return EmptyRemotDataFailure();
  } else if (exception is LinkedRecourdException) {
    return LinkedRecourdFailuer();
  } else if (exception is EmptyCashException) {
    return EmptyCashFailure();
  } else if (exception is ServerException) {
    return ServerFailure();
  } else if (exception is OfflineException) {
    return OfflineFailure();
  } else if (exception is PassowrdWrongExeption) {
    return PassowrdWrongFailuer();
  } else if (exception is PermissionException) {
    return PermissionFailuer();
  } else if (exception is BalanceNotEneghException) {
    return BalanceNotEneghFailuer();
  } else if (exception is NameNotEneghException) {
    return NameNotEneghFailuer();
  } else if (exception is EmailExistsExeption) {
    return EmailExistsFailuer();
  } else if (exception is EmailWrongExeption) {
    return EmailWrongFailuer();
  } else if (exception is CodeIsWrongExeption) {
    return CodeIsFailure();
  } else if (exception is TimeDoneException) {
    return TimeDoneFailure();
  } else if (exception is ImageToLagargeException) {
    return ImageToLagargeFailure();
  } else if (exception is InvalidTypeImageException) {
    return InvalidImageTypeFailure();
  } else {
    return UnexpectedErrorFailuer();
  }
}
