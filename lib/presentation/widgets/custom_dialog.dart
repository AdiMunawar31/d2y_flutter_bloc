import 'package:d2y_flutter_bloc/core/common/app_screen.dart';
import 'package:d2y_flutter_bloc/core/common/colors.dart';
import 'package:d2y_flutter_bloc/core/common/constants.dart';
import 'package:d2y_flutter_bloc/presentation/blocs/theme/theme_bloc.dart';
import 'package:d2y_flutter_bloc/presentation/widgets/custom_elevated_button.dart';
import 'package:d2y_flutter_bloc/presentation/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<dynamic> showBottomDialog(
  BuildContext context, {
  required Widget child,
}) {
  final theme = Theme.of(context);
  return showModalBottomSheet(
    context: context,
    backgroundColor: theme.cardColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(RADIUS),
        topRight: Radius.circular(RADIUS),
      ),
    ),
    builder: (context) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: MARGIN),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(RADIUS),
            topRight: Radius.circular(RADIUS),
          ),
        ),
        width: Screens.width(context),
        child: child,
      );
    },
  );
}

Future<dynamic> showPickImageDialog(
  BuildContext context, {
  required VoidCallback onCameraTap,
  required VoidCallback onGalleryTap,
}) {
  final theme = Theme.of(context);
  return showModalBottomSheet(
    context: context,
    backgroundColor: theme.cardColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(RADIUS),
        topRight: Radius.circular(RADIUS),
      ),
    ),
    builder: (context) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: MARGIN),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(RADIUS),
            topRight: Radius.circular(RADIUS),
          ),
        ),
        width: Screens.width(context),
        height: 230,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: SPACE8),
            Center(
              child: Container(
                width: 50,
                height: 3,
                decoration: BoxDecoration(
                  color: theme.hintColor,
                  borderRadius: BorderRadius.circular(RADIUS),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Row(
              children: [
                _BuildButtonIcon(
                  icon: Icons.photo,
                  label: 'Gallery',
                  onTap: onGalleryTap,
                ),
                const SizedBox(width: SPACE25),
                _BuildButtonIcon(
                  icon: Icons.camera_alt,
                  label: 'Camera',
                  onTap: onCameraTap,
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}

Future<dynamic> showConfirmationDialog(
  BuildContext context, {
  bool barrierDismissible = false,
  required String title,
  required String primaryButtonLabel,
  String? secondaryButtonLabel,
  required VoidCallback onPrimaryButtonTap,
  VoidCallback? onSecondaryButtonTap,
}) {
  return showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (context) {
      return BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          final theme = Theme.of(context);
          return AlertDialog(
            backgroundColor:
                (state is ThemeDark) ? ColorDark.card : ColorLight.card,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(RADIUS),
            ),
            content: SizedBox(
              width: MediaQuery.of(context).size.width - 80,
              height: 150,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                    height: 45,
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomOutlinedButton(
                            onTap:
                                (onSecondaryButtonTap == null)
                                    ? () => Navigator.pop(context)
                                    : onSecondaryButtonTap,
                            label: secondaryButtonLabel ?? 'Back',
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: CustomElevatedButton(
                            onTap: onPrimaryButtonTap,
                            label: primaryButtonLabel,
                            color: theme.primaryColor,
                            labelColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

class _BuildButtonIcon extends StatelessWidget {
  const _BuildButtonIcon({
    super.key,
    required this.onTap,
    required this.icon,
    required this.label,
  });

  final VoidCallback onTap;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: theme.primaryColor,
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(height: SPACE8),
          Text(label, style: theme.textTheme.displaySmall),
        ],
      ),
    );
  }
}
