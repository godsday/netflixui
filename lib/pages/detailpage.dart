import 'package:flutter/material.dart';

class detailPage extends StatelessWidget {
  var detailitem;
  detailPage({Key? key, this.detailitem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
        var height= MediaQuery.of(context).size.height;

    // print(detailitem);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
       // alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
         
          Container(
            width: width,
            height: 460,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://image.tmdb.org/t/p/w500${detailitem['backdrop_path']}"),
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            height: 450,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                  Colors.black.withOpacity(0.85),
                  Colors.black.withOpacity(0)
                ],
                    end: Alignment.topCenter,
                    begin: Alignment.bottomCenter)),
          ),
          // SizedBox(
      
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: [
      
          //     ],
          //   ),
          // ),
         
            Positioned(
              bottom: -320,
              child: Container(
                height: 370,
                width: 393,
                decoration: const BoxDecoration(
                  boxShadow:[ BoxShadow(
                    color: Color.fromARGB(186, 238, 235, 235),
                    blurRadius: 2,
                    spreadRadius:1.2,

                    
                  ),],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                        child:Padding(
                          padding: const EdgeInsets.only(top:30.0,left: 17,right: 17),
                          child: Column(
                            children: [
                              Text(
              detailitem["title"],
              style: const TextStyle(
                  fontSize: 35,
                  //color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
                  SizedBox(height: 20,),
      
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Text(detailitem['vote_average'].toString(),
                      style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 14))
                ],
              ),
              Text(
                'Release Date : ${detailitem["release_date"]}',
                style: const TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Text(
                detailitem["overview"],
                //maxLines: 7,
               // overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.black, fontSize: 17),
              ),
                            ],
                          ),
                        ) ,
              )
              ),
               Positioned(
              bottom: -320,
              child: Container(
                height: 370,
                width: 393,
                decoration:  BoxDecoration(
                 gradient: LinearGradient(
                    colors: [
                  Colors.black.withOpacity(0.65),
                  Colors.black.withOpacity(0)
                ],
                    end: Alignment.topCenter,
                    begin: Alignment.bottomCenter),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),)),
        
        
      
          Positioned(
            bottom: 10,
            right: 15,
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.red.shade700,
                borderRadius: BorderRadius.circular(70),
              ),
               child: Icon(Icons.play_arrow,size: 37,color: Colors.white,),
            ),
          ),
       
        ],
      ),
    );
  }
}
