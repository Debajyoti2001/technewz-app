import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:tech_news_application/utils/text.dart';
import 'package:tech_news_application/widgets/bottomsheet.dart';
import 'package:tech_news_application/widgets/components.dart';
import '../utils/colors.dart';

class NewsBox extends StatelessWidget {
  final String imageUrl, title, time, description, url;
  const NewsBox(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.time,
      required this.description,
      required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (){
        showMyBottomSheet(context, title, description, imageUrl, url);
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(left: 5, right: 5, top: 5),
            width: w,
            color: AppColors.black,
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: imageUrl,
                  imageBuilder: (context, imageProvider) => Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.yellow),
                  ),
                  placeholder: (context, url) => CircularProgressIndicator(
                    color: AppColors.primary,
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    children: [
                      ModifiedText(text: title, color: AppColors.white, size: 16),
                      const SizedBox(height: 5,),
                      ModifiedText(text: time, color: AppColors.white, size: 12)
                    ],
                  ),
                )
              ],
            ),
          ),
          DividerWidget(),
        ],
      ),
    );
  }
}
