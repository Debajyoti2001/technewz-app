import 'package:flutter/material.dart';
import 'package:tech_news_application/backend/functions.dart';
import 'package:tech_news_application/utils/colors.dart';
import 'package:tech_news_application/widgets/appbar.dart';
import 'package:tech_news_application/widgets/newsbox.dart';
import 'package:tech_news_application/widgets/searchbar.dart';

import '../utils/constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

late Future<List> news;
class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    news = fetchNews();
  }
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: Appbar(),
      body: Column(
        children: [
          SearchBarWidget(),
          Expanded(
              child: SizedBox(
            width: w,
            child: FutureBuilder<List>(
              future: fetchNews(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return NewsBox(
                          imageUrl: snapshot.data![index]['urlToImage'] ?? Constants.imageurl,
                          title: snapshot.data![index]['title'],
                          time: snapshot.data![index]['publishedAt'],
                          description: snapshot.data![index]['description'].toString(),
                          url: snapshot.data![index]['url']);
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  );
                }
              },
            ),
          ))
        ],
      ),
    );
  }
}
