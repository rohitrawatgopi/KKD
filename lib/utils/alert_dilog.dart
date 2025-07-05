import 'package:paint_shop/app/import.dart';

class WrongAlertDilogBox {
  final String userName;
  final DateTime usedDate;
  final VoidCallback? onClose;
  BuildContext context;

  WrongAlertDilogBox({
    required this.context,
    required this.userName,
    required this.usedDate,
    this.onClose,
  }) {
    // Format date – e.g., "16th March 2003"
    final day = usedDate.day;
    final daySuffix = (day >= 11 && day <= 13)
        ? 'th'
        : {1: 'st', 2: 'nd', 3: 'rd'}[day % 10] ?? 'th';
    final formattedDate =
        '$day$daySuffix ${_monthName(usedDate.month)} ${usedDate.year}';
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
                    const Text(
                      'Oops!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Image.asset(AppImage.wrong),
                    const SizedBox(height: 24),
                    ReqAppText(
                      title: AppString.ThisQRcodehasalreadybeenusedby,
                      title2: userName,
                      title4: formattedDate.toString(),
                      title3: " on ",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      fontWeight2: FontWeight.w600,
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: InkWell(
                    onTap: onClose ?? () => Navigator.of(context).pop(),
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

  String _monthName(int m) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[m - 1];
  }
}
