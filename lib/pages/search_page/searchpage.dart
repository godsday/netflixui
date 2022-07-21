import 'package:flutter/material.dart';
import 'package:netflix/pages/coming_soon/coming_soon.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({ Key? key }) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    // TODO: implement initState
    fetchdata();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar:appBar() ,
      body: appBody(),
    );
  }
  AppBar appBar(){

    return AppBar(
      actions:const [
        Padding(
          padding:  EdgeInsets.only(right:18.0),
          child: Icon(Icons.search),
        )
      ],
      centerTitle: true,
      
      backgroundColor: Colors.black,
      
      flexibleSpace:  SafeArea(
        child:  Padding(
          padding:  const EdgeInsets.all(8.0),
          child: TextField(
            autofocus: false,
            style: const TextStyle(fontSize: 22.0, color: Color(0xFFbdc6cf)),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey,
              hintText: 'Search',
              contentPadding:
                   const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          )
        )
            

          ),
        );
    
    

   
  }
   Widget appBody(){
    return  SafeArea(child:SingleChildScrollView(
      child: Column(
    children: List.generate(comingsoon.length, (index){
    return Padding(
      padding: const EdgeInsets.only(bottom:10.0),
      child: Container(
      height: 100,
     
      child: Padding(
        padding: const EdgeInsets.only(left:8.0,right:10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 150,
              height: 100,
             
              
              child: Image.network("https://image.tmdb.org/t/p/w500${comingsoon[index].posterPath!}",fit: BoxFit.cover,
                frameBuilder: (BuildContext context, Widget child, _,
                            bool loading) {
                          return child;
                        },
                        loadingBuilder: (context, child, loading) {
                          return loading == null
                              ? child
                              : const Center(
                                  child: CircularProgressIndicator());
                        },),
              ),
            
            SizedBox(
              width: 150,
              child: Text(comingsoon[index].title!,maxLines: 2,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)),
            const Icon(Icons.play_circle_fill_outlined,size: 39,color: Colors.white,)
          ],
        ),
      ),
      ),
    );
    }),
      ),
    )
    
    
    ); 
    }

}