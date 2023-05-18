import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_news_application/utils/text.dart';
import 'package:tech_news_application/widgets/components.dart';
import 'package:url_launcher/url_launcher.dart';

void showMyBottomSheet(BuildContext context, String title, String description,
    String imageUrl, url) {
  showBottomSheet(
    backgroundColor: Colors.black,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(20),
        topLeft: Radius.circular(20),
      ),
    ),
    elevation: 20,
    context: context,
    builder: (context) {
      return MyBottomSheetLayout(
        title: title,
        imageUrl: imageUrl,
        url: url,
        description: description,
      );
    },
  );
}

_launchUrl(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could Not Launch $url';
  }
}

class MyBottomSheetLayout extends StatelessWidget {
  final String title, imageUrl, url, description;
  const MyBottomSheetLayout(
      {Key? key,
      required this.title,
      required this.imageUrl,
      required this.url,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20))),
      child: Column(
        children: [
          BottomSheetImage(imageUrl: imageUrl, title: title),
          Container(
            padding: const EdgeInsets.all(10),
            child:
                ModifiedText(text: description, color: Colors.white, size: 16),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: RichText(
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text: 'Read Full Article',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        _launchUrl(url);
                      },
                    style: GoogleFonts.lato(color: Colors.blue.shade400))
              ]),
            ),
          )
        ],
      ),
    );
  }
}
