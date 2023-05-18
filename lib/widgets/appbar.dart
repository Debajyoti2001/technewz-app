import 'package:flutter/material.dart';
import 'package:tech_news_application/utils/colors.dart';

import '../utils/text.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  const Appbar({Key? key})
      : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

  @override
  final Size preferredSize;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.black,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }
}
