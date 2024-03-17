import 'package:flutter/material.dart';

import '../../theme/infra/app_colors.dart';
import '../../theme/infra/app_dimension.dart';
import '../../theme/infra/app_fonts.dart';

enum SnackBarType {
  info,
  error,
  success,
}

final _snackBarType = <SnackBarType, dynamic>{
  SnackBarType.info: {
    'color': AppColors.neutral800,
    'icon': const Icon(
      Icons.warning_rounded,
      color: AppColors.white,
    )
  },
  SnackBarType.success: {
    'color': AppColors.green,
    'icon': const Icon(
      Icons.check_circle_rounded,
      color: AppColors.white,
    )
  },
  SnackBarType.error: {
    'color': AppColors.red,
    'icon': const Icon(
      Icons.dangerous_rounded,
      color: AppColors.white,
    )
  },
};

class SnackbarComponent {
  SnackbarComponent._();

  static void _build(
    BuildContext context, {
    required SnackBarType type,
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            _snackBarType[type]['icon'],
            const SizedBox(
              width: AppDimension.medium,
            ),
            Flexible(
              child: Text(
                message,
                style: AppFonts.bodyLarge(color: AppColors.white),
              ),
            ),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: _snackBarType[type]['color'],
      ),
    );
  }

  static void success(BuildContext context, {required String message}) =>
      _build(context, type: SnackBarType.success, message: message);

  static void error(BuildContext context, {required String message}) =>
      _build(context, type: SnackBarType.error, message: message);

  static void info(BuildContext context, {required String message}) =>
      _build(context, type: SnackBarType.info, message: message);
}
