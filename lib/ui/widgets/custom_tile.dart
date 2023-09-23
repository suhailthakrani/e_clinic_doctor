import 'package:e_clinic_dr/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  final String title;
  final Widget icon;
  final VoidCallback onTap;

  const CustomTile({
    required this.title,
    this.icon = const Icon(Icons.arrow_forward_ios),
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        dense: true,
        // contentPadding: EdgeInsets.zero,
        tileColor: kWhiteColor,
        titleTextStyle: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: kBlackColor),
        splashColor: kFieldBorderColor,
        title: Text(title),
        onTap: onTap,
        trailing: icon,
      ),
    );
  }
}
