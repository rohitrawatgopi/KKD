import 'package:paint_shop/app/import.dart';

class SuccesCoinAlertDilogBox {
  final String conin;
  BuildContext context;

  SuccesCoinAlertDilogBox({required this.context, required this.conin}) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 24,
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 12),
                    AppText(
                      title: AppString.congratulations,
                      fontWeight: FontWeight.w500,
                      fontSize: 24.sp,
                    ),
                    const SizedBox(height: 24),
                    Image.asset(AppImage.dollar),
                    const SizedBox(height: 14),
                    AppText(
                      title: conin,
                      fontWeight: FontWeight.w700,
                      fontSize: 24.sp,
                    ),
                    AppText(
                      title: AppString.haveBeenAddedToWallet,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ),

                    const SizedBox(height: 24),
                  ],
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(4),
                      child: Icon(Icons.close, size: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
