abstract class WithDrawState {}

class WithDrawInitial extends WithDrawState {}

class WithDrawLoading extends WithDrawState {}

class WithDrawSuccess extends WithDrawState {
  final String message;
  WithDrawSuccess(this.message);
}

class WithDrawFailure extends WithDrawState {
  final String message;
  WithDrawFailure(this.message);
}
