import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:netflix/popular_json/popular_json.dart';

class ComingSoon extends StatefulWidget {
  const ComingSoon({Key? key}) : super(key: key);

  @override
  State<ComingSoon> createState() => _ComingSoonState();
}

class _ComingSoonState extends State<ComingSoon> {
  @override
  void initState() {
    fetchdata();
  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: getappbar(),
      body: getBody(),
    );
  }

  AppBar getappbar() {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      title: const Text(
        "Coming Soon",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.collections_bookmark,
            color: Colors.white,
            size: 28,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Image.asset(
            "assets/profile.jpg",
            width: 26,
            height: 26,
            fit: BoxFit.cover,
          ),
          onPressed: () {},
        )
      ],
    );
  }

  Widget getBody() {
  //  var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.notifications_none_outlined,
                      size: 28,
                      color: Colors.white.withOpacity(0.9),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Notifications",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white.withOpacity(0.9)),
                    )
                  ],
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                )
              ],
            ),
          ),
          Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(comingsoon.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: 250,
                      // width:size.width,
                      child: Image.network(
                        "https://image.tmdb.org/t/p/w500${comingsoon[index].backdropPath!}",
                        fit: BoxFit.cover,
                        frameBuilder: (BuildContext context, Widget child, _,
                            bool loading) {
                          return child;
                        },
                        loadingBuilder: (context, child, loading) {
                          return loading == null
                              ? child
                              : const Center(
                                  child: CircularProgressIndicator());
                        },
                      )),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10, bottom: 10, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 250,
                          child: Text(
                            comingsoon[index].title!,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(color: Colors.white, fontSize: 25,fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          children: [
                            Column(
                              children: const [
                                Icon(
                                  Icons.notifications_none_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("remind me",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12))
                              ],
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.info_outline,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("info",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12))
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //  Text(comingsoon[index].genreIds.toString(),style: TextStyle(color: Colors.white),),
                              Text(
                                'Release date : ${comingsoon[index].releaseDate}'
                                    .toString(),
                                style: const TextStyle(color: Colors.white),
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 18,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    comingsoon[index].voteAverage.toString(),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            comingsoon[index].overview!,
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 15),
                            maxLines: 6,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }))
        ],
      ),
    );
  }
}

List<PopularJson> comingsoon = [];
Future fetchdata() async {
  final fetchres = await http.get(Uri.parse(
      "https://api.themoviedb.org/3/movie/upcoming?api_key=59f86f34207c99d7690d1deb932529fe"));
  if (fetchres.statusCode == 200) {
    final fetcheddata = jsonDecode(fetchres.body);
    // print(fetcheddata);
    Iterable map = fetcheddata["results"];
    comingsoon = map.map((movie) => PopularJson.fromJson(movie)).toList();
  } else if (fetchres.statusCode == 404) {
    const CircularProgressIndicator(
      color: Colors.amber,
    );
  } else {
    throw Exception('Failed to load movies');
  }
}
