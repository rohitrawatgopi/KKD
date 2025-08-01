import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paint_shop/core/network/response_model.dart';
import 'package:paint_shop/features/3bottom/withdraw/cubit/withdraw.state.dart';
import 'package:paint_shop/features/repo/WithDraw.dart';

class WithDrawCubit extends Cubit<WithDrawState> {
  WithDrawCubit() : super(WithDrawInitial());

  Future<void> withdrawCoin({required String coin}) async {
    emit(WithDrawLoading());

    try {
      if (int.parse(coin) < 0 || coin.isEmpty) {
        emit(WithDrawFailure("enter vaild coin"));
      }
      emit(WithDrawLoading());

      final ResponseModel response = await WithDrawRepo.withdraw(coin: coin);

      if (response.message == "Withdrawal request submitted") {
        emit(WithDrawSuccess(response.message ?? "With draw Successfully"));
      } else {
        emit(WithDrawFailure(response.message ?? "Fail to Withdraw"));
      }
    } catch (e) {
      emit(WithDrawFailure("Something went wrong"));
    }
  }
}
