// scanner_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paint_shop/core/network/response_model.dart';
import 'package:paint_shop/features/3bottom/qr/cubit/qr.state.dart';
import 'package:paint_shop/features/repo/qr.dart';
import 'package:paint_shop/utils/dio.erro.dart';

class ScannerCubit extends Cubit<ScannerState> {
  ScannerCubit() : super(ScannerInitial());

  Future<void> QrScan({required Map<String, dynamic> value}) async {
    try {
      final payload = {"qrData": value};

      emit(ScannerLoading());

      final ResponseModel response = await QrRepo.scanQr(data: payload);

      if (response.success == true) {
        emit(ScannerSuccess(response.message!));
      } else {
        emit(ScannerFailure(response.message.toString() ?? 'scna failed'));
      }
    } catch (e) {
      final errorMessage = DioErrorHandler.getErrorMessage(e);
      print(errorMessage);
      emit(ScannerFailure(errorMessage));
    }
  }
}
