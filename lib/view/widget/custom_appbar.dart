import 'package:flutter/material.dart';
import 'package:movies/utils/app_padding.dart';
import 'package:movies/utils/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/view/widget/favoirt_btn.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppPadding.paddingSmall.w),
      child: Row(
        children: [
          Text(
            "popular movies",
            style: TextStyles.title,
          ),
          const Spacer(),
          const FavoirtBtn(),
          IconButton(
            icon: const Icon(Icons.sunny),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
