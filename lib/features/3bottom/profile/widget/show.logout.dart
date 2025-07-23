import 'package:hive_flutter/adapters.dart';
import 'package:paint_shop/app/import.dart';

void showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: AppColors.appColor,
      title: Row(
        children: [
          Icon(Icons.logout, color: Colors.red),
          SizedBox(width: 8),
          Text("Logout", style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
      content: Text("Are you sure you want to logout?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Cancel", style: TextStyle(color: Colors.grey[700])),
        ),
        AppButton(
          hight: 40.h,
          width: 100.w,
          radius: 12,
          title: "Logout",
          color: Colors.red,
          onPressed: () {
            Navigator.pop(context);
            print(Hive.box('authBox').get('token'));
            context.go('/login');
            Hive.box('authBox').delete('token');

            print(Hive.box('authBox').get('token'));
          },
        ),
      ],
    ),
  );
}
