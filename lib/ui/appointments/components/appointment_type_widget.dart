import 'package:e_clinic_dr/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentType extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;
  const AppointmentType({
    Key? key,
    required this.title,
    required this.selected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
      ),
      builder: (context, w) => InkWell(
        onTap:onTap,
        child: AnimatedOpacity(
          opacity: selected ? 1.0 : 0.8,
          duration: const Duration(milliseconds: 300),
          child: Container(
            alignment: Alignment.center,
            height: 32.h,
            width: 156.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.w),
              color: selected ? kPrimaryColor : Colors.white,
            ),
            child: Text(
              title,
              style: TextStyle(
                color: selected ? Colors.white : Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
