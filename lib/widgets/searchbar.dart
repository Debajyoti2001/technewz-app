import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_news_application/backend/functions.dart';
import 'package:tech_news_application/utils/colors.dart';

class SearchBarWidget extends StatelessWidget {
  static TextEditingController searchController =
  TextEditingController(text: '');
  const SearchBarWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: AppColors.darkgrey,
                borderRadius: BorderRadius.circular(50)),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      controller: SearchBarWidget.searchController,
                      decoration: InputDecoration(
                          hintText: 'Search a keyword or a Phrase',
                          hintStyle: GoogleFonts.lato(),
                          border: InputBorder.none),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        InkWell(
          onTap: (){
            FocusScope.of(context).unfocus();
            fetchNews();
          },
          child: Container(
            height: 45,
            width: 45,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: AppColors.darkgrey),
            child: Icon(
              Icons.search,
              color: AppColors.white,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
