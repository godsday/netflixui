import 'package:flutter/material.dart';
import 'package:netflix/pages/coming_soon/coming_soon.dart';
import 'package:netflix/pages/downloads.dart/downloadpage.dart';
import 'package:netflix/pages/homepage.dart';
import 'package:netflix/pages/search_page/searchpage.dart';
import 'package:netflix/wigets/bottom_navigationbar/footer_list.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activetab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: activetab,
      children: const [HomePage(), ComingSoon(), SearchPage(), DownloadPage()],
    );
  }

  Widget getFooter() {
    return Container(
      height: 80,
      decoration: const BoxDecoration(color: Colors.black),
      child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(items.length, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  activetab = index;
                });
              },
              child: Column(
                children: [
                  Icon(
                    items[index]['icon'],
                    color: Colors.white,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    items[index]['text'],
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
