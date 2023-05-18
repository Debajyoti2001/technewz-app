import 'package:flutter/material.dart';
import 'package:tech_news_application/utils/colors.dart';

import '../utils/text.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  Appbar({Key? key})
      : preferredSize = Size.fromHeight(50.0),
        super(key: key);

  @override
  final Size preferredSize;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.black,
      title: Center(
        child: SizedBox(
          height: 40,
          child: Row(
            children: [
              BoldText(
                text: 'Tech',
                size: 20,
                color: AppColors.primary,
              ),
              ModifiedText(
                text: 'Newz',
                color: AppColors.lightwhite,
                size: 20,
              )
            ],
          ),
        ),
      ),
      centerTitle: true,
    );
  }
}
