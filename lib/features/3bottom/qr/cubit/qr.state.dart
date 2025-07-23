// scanner_state.dart
abstract class ScannerState {}

class ScannerInitial extends ScannerState {}

class ScannerLoading extends ScannerState {}

class ScannerSuccess extends ScannerState {
  final String response;
  ScannerSuccess(this.response);
}

class ScannerFailure extends ScannerState {
  final String error;
  ScannerFailure(this.error);
}
