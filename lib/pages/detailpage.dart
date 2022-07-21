import 'package:flutter/material.dart';

class detailPage extends StatelessWidget {
  var detailitem;
  detailPage({Key? key, this.detailitem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // print(detailitem);
    return Scaffold(
      body: Container(
          height: size.height,
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 460,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://image.tmdb.org/t/p/w500${detailitem['backdrop_path']}"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    height: 500,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                          Colors.black.withOpacity(0.85),
                          Colors.black.withOpacity(0)
                        ],
                            end: Alignment.topCenter,
                            begin: Alignment.bottomCenter)),
                  ),
                  SizedBox(
                    height: 489,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(
                            detailitem["title"],
                            style: const TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Container(
                height: size.height - 500,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 16),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 17,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                // Text(detailitem['vote_average'].toString(),
                                //     style: const TextStyle(
                                //         color: Colors.white,
                                //         fontWeight: FontWeight.w400,
                                //         fontSize: 14))
                              ],
                            ),
                            Text(
                              'Release Date : ${detailitem["release_date"]}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          detailitem["overview"],
                          maxLines: 7,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 15),
                        ),
                      ]),
                ),
              )
            ],
          )),
    );
  }
}
