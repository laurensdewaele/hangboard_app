import 'dart:async';

import 'package:flutter/widgets.dart';

import 'package:app/services/parser.dart';
import 'package:app/services/toast.dart';
import 'package:app/services/validation.dart';
import 'package:app/styles/styles.dart' as styles;

bool get isInDebugMode {
  bool inDebugMode = false;
  assert(inDebugMode = true);
  return inDebugMode;
}

class ErrorService {
  ToastService _toastService;

  // Creates a singleton.
  ErrorService._(ToastService toastService) : _toastService = toastService;
  static final ErrorService _errorService = ErrorService._(ToastService());
  factory ErrorService() {
    return _errorService;
  }

  Future<Null> handleFlutterError(FlutterErrorDetails details) {
    if (isInDebugMode) {
      FlutterError.dumpErrorToConsole(details);
    } else {
      // This will be caught by runZoned's onError.
      // In our case, being handled by ErrorService.handleZonedError.
      Zone.current.handleUncaughtError(details.exception, details.stack);
    }
    return Future.value();
  }

  Future<Null> handleZonedError(dynamic error, dynamic stackTrace) {
    if (error is AppException) {
      if (error is ValidationException) {
        _toastService.add(error.errorMessage);
      } else if (error is ParseException) {
        _toastService.add(error.errorMessage);
      } else {
        print('You forgot to handle an AppExpection!');
      }
    } else {
      print('Caught error: $error');

      if (isInDebugMode) {
        print(stackTrace);
      } else {
        // TODO: Handle by sentry
      }
    }
    return Future.value();
  }
}

class AppException {}

abstract class ErrorMessages {
  static Widget maxAllowedFingers({int maxAllowedFingers}) => Text(
        'This hold only has room for $maxAllowedFingers fingers.',
        textAlign: TextAlign.center,
        style: styles.Lato.sBlack,
      );
  static Widget holdAlreadyTaken() => Text(
        'Hold is already taken.',
        textAlign: TextAlign.center,
      );
  static Widget biggerThanZero({String inputField}) => RichText(
        textAlign: TextAlign.center,
        text: TextSpan(text: '', style: styles.Lato.sBlack, children: [
          TextSpan(
            text: '$inputField ',
            style: styles.Lato.sBlackBold,
          ),
          TextSpan(
            text: 'input needs to be ',
            style: styles.Lato.sBlack,
          ),
          TextSpan(text: 'bigger than 0.', style: styles.Lato.sBlackBold)
        ]),
      );
  static Widget inputNotEmpty({String inputField}) => RichText(
        textAlign: TextAlign.center,
        text: TextSpan(text: '', style: styles.Lato.sBlack, children: [
          TextSpan(
            text: '$inputField ',
            style: styles.Lato.sBlackBold,
          ),
          TextSpan(
            text: 'input can ',
            style: styles.Lato.sBlack,
          ),
          TextSpan(text: 'not be empty.', style: styles.Lato.sBlackBold)
        ]),
      );
  static Widget inputNotANumber({String inputField}) => RichText(
        textAlign: TextAlign.center,
        text: TextSpan(text: '', style: styles.Lato.sBlack, children: [
          TextSpan(
            text: '$inputField ',
            style: styles.Lato.sBlackBold,
          ),
          TextSpan(
            text: 'input is ',
            style: styles.Lato.sBlack,
          ),
          TextSpan(text: 'not a number.', style: styles.Lato.sBlackBold)
        ]),
      );
  static Widget inputSmallerThanZero({String inputField}) => RichText(
        textAlign: TextAlign.center,
        text: TextSpan(text: '', style: styles.Lato.sBlack, children: [
          TextSpan(
            text: '$inputField ',
            style: styles.Lato.sBlackBold,
          ),
          TextSpan(
            text: 'input can not be ',
            style: styles.Lato.sBlack,
          ),
          TextSpan(text: 'smaller than 0.', style: styles.Lato.sBlackBold)
        ]),
      );
  static Widget inputLargerThan({int max, String inputField}) => RichText(
        textAlign: TextAlign.center,
        text: TextSpan(text: '', style: styles.Lato.sBlack, children: [
          TextSpan(
            text: '$inputField ',
            style: styles.Lato.sBlackBold,
          ),
          TextSpan(
            text: 'input can not be ',
            style: styles.Lato.sBlack,
          ),
          TextSpan(text: 'larger than $max.', style: styles.Lato.sBlackBold)
        ]),
      );
  static Widget betweenRange({int min, int max, String inputField}) => RichText(
        textAlign: TextAlign.center,
        text: TextSpan(text: '', style: styles.Lato.sBlack, children: [
          TextSpan(
            text: '$inputField ',
            style: styles.Lato.sBlackBold,
          ),
          TextSpan(
            text: 'input can not be ',
            style: styles.Lato.sBlack,
          ),
          TextSpan(text: 'smaller than $min ', style: styles.Lato.sBlackBold),
          TextSpan(
            text: 'or ',
            style: styles.Lato.sBlack,
          ),
          TextSpan(text: 'larger than $max.', style: styles.Lato.sBlackBold),
        ]),
      );
}
