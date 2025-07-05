import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum ToastStatus { success, error, warning, info }

class AppToast {
  static void show({
    required String message,
    required ToastStatus status,
    ToastGravity gravity = ToastGravity.BOTTOM,
    int durationSeconds = 3,
  }) {
    // Background color based on status
    Color bgColor;
    IconData icon;
    switch (status) {
      case ToastStatus.success:
        bgColor = Colors.green[600]!;
        icon = Icons.check_circle;
        break;
      case ToastStatus.error:
        bgColor = Colors.red[600]!;
        icon = Icons.error;
        break;
      case ToastStatus.warning:
        bgColor = Colors.orange[600]!;
        icon = Icons.warning;
        break;
      case ToastStatus.info:
      default:
        bgColor = Colors.blue[600]!;
        icon = Icons.info;
    }

    // Build custom toast widget
    final toastWidget = Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 12),
          Flexible(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );

    Fluttertoast.showToast(
      msg: "", // msg ignored when using web-based widget
      toastLength: Toast.LENGTH_LONG,
      gravity: gravity,
      timeInSecForIosWeb: durationSeconds,
      backgroundColor: Colors.transparent,
      textColor: Colors.transparent,
      fontSize: 16.0,
      webPosition: "center",
      webBgColor: "transparent",
    );

    // Overlay the toast widget (required for custom)
  }

  // Convenience methods
  static void success(
    String msg, {
    ToastGravity gravity = ToastGravity.BOTTOM,
  }) => show(message: msg, status: ToastStatus.success, gravity: gravity);

  static void error(String msg, {ToastGravity gravity = ToastGravity.BOTTOM}) =>
      show(message: msg, status: ToastStatus.error, gravity: gravity);

  static void warning(
    String msg, {
    ToastGravity gravity = ToastGravity.BOTTOM,
  }) => show(message: msg, status: ToastStatus.warning, gravity: gravity);

  static void info(String msg, {ToastGravity gravity = ToastGravity.BOTTOM}) =>
      show(message: msg, status: ToastStatus.info, gravity: gravity);
}
