import 'package:flutter/material.dart';

class DownloadPage extends StatelessWidget {
  const DownloadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: getappbar(),
      body: SafeArea(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // const SizedBox(
          //   height: 20,
          // ),
          Container(
            width: width,
            height: 60,
            color: const Color.fromARGB(255, 53, 57, 58),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              
              children: const[
                const Icon(
                  Icons.circle_notifications_outlined,
                  size: 35,
                  color: Colors.white,
                ),
                const Text("Smart Downloads", style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
                const Text("ON", style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold)),
                const SizedBox(width: 130,)

              ],
            ),
          ),
          SizedBox(
            height: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
 Icon(Icons.download_for_offline_sharp,size: 250,color: Color.fromARGB(255, 88, 103, 115),),
            Text("Never be without Netflix",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
            // SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                
                "Downloads shows and movie so you'll never be without somethings to watch   even when you're offline"
                ,textAlign: TextAlign.center
                ,style: TextStyle(color: Colors.white,fontSize: 17,)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                //onSurface: Colors.black,
                primary: Colors.white,
                onPrimary:Colors.black,
                fixedSize: Size(300, 50)

              ),
              
              onPressed: (){}, child: Text("See what You Can Download "))
 
              ],
            ),
          )
                ],
      )),
    );
  }
}

AppBar getappbar() {
  return AppBar(
    backgroundColor: Colors.black,
    elevation: 0,
    title: const Text(
      "Downloads",
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
