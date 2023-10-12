import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tithe_tracker/utils/theme.dart';

class TitheTile extends StatelessWidget {
  const TitheTile({
    required this.month,
    required this.isPaid,
    required this.onTap,
    super.key,
  });

  final String month;
  final bool isPaid;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    bool isCurrentMonth = DateFormat.MMMM().format(DateTime.now()) == month;

    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.all(0),
      horizontalTitleGap: 0,
      leading: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(scale: animation, child: child);
        },
        child: isPaid
            ? const Icon(
                key: ValueKey<int>(0),
                Icons.check_circle,
                size: 28,
                color: kPrimary,
              )
            : const Icon(
                key: ValueKey<int>(1),
                Icons.panorama_fish_eye,
                size: 28,
                color: kMuted,
              ),
      ),
      title: Text(
        month,
        style: const TextStyle(
          fontSize: 16,
          color: kTextPrimary,
        ),
      ),
      trailing: isCurrentMonth
          ? Text(
              "Current month",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
                color: Colors.red[300],
                fontWeight: FontWeight.w600,
              ),
            )
          : null,
    );
  }
}
