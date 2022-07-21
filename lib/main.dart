import 'package:flutter/material.dart';
import 'package:netflix/pages/coming_soon/coming_soon.dart';
import 'package:netflix/root_app.dart';

main() async {
  await fetchdata();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: RootApp(),
  ));
}
