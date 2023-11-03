
import 'package:assaignment_module11/pages/secondpage.dart';
import 'package:flutter/material.dart';

import '../services/services.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Gallery App'),
      ),
      body: FutureBuilder(
          future: ServiceScreen().getDataApi(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data.length,
                  itemBuilder: (context,index){
             return ListTile(
               onTap: (){
                 Navigator.push(context,
                     MaterialPageRoute(builder: (context)=>
                         DetailsScreen(id: snapshot.data[index]['id'],)));
               },
              leading: Image.network(snapshot.data[index]['url'].toString()),
               title: Text(snapshot.data[index]['title'].toString()),
             );
              });
            }
             return CircularProgressIndicator();
          })
    );
  }
}
