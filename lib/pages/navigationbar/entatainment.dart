import 'package:flutter/material.dart';

import 'dart:developer';
import 'package:newsapp/model/news_model.dart';
import 'package:newsapp/network/repository.dart';
import 'package:newsapp/pages/screen/navigate.dart';

class Entertainment extends StatefulWidget {
  Entertainment({super.key});

  @override
  State<Entertainment> createState() => _EntertainmentState();
}

class _EntertainmentState extends State<Entertainment> {
  Repository repository = Repository();

  List<Articles>? news = [];

  void getNews() async {
    final newsCall = await repository.getNews(
        path:
            'top-headlines?category=entertainment&lang=en&apikey=4c774d22549d00a6df7edd09a6346bea');

    setState(() {
      news = newsCall.articles;
    });
  }

  @override
  void initState() {
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text('NewsApp'),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            tooltip: 'about',
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 28.0, left: 15, right: 15, bottom: 10),
        child: news!.isNotEmpty
            ? ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: news?.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                          title: Text('${news![index].title}'),
                          subtitle: GestureDetector(
                              child: Text('${news![index].description}'),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const NavigatingScreen(),
                                    ));
                              }),
                          contentPadding: const EdgeInsets.all(12),
                          trailing: Image.network(
                            '${news![index].image}',
                            width: 60,
                            height: 120,
                          ),
                          tileColor: const Color(0xFFF1f1f1)),
                      Divider(
                        color: Colors.black45,
                      )
                    ],
                  );
                },
              )
            : Container(
                child: Center(
                    child: Text(
                  "Loading News",
                  style: TextStyle(
                      color: Colors.redAccent, fontWeight: FontWeight.bold),
                )),
              ),
      ),
    );
  }
}
