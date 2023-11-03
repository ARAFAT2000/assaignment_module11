

import 'package:flutter/material.dart';


import '../services/services.dart';

class DetailsScreen extends StatelessWidget {

int id;
  DetailsScreen({super.key,required this.id});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Details'),
      ),
      body: FutureBuilder(
          future: ServiceScreen().showDetails(id),
          builder: (context,snapshot){
            if(snapshot.hasData){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.network(snapshot.data['url'].toString()),
                  ),
                  Text(snapshot.data['title'].toString()),
                  Text(snapshot.data['id'].toString()),
                ],
              );
                // title: Image.network(snapshot.data['url'].toString()),
                // subtitle: Text(snapshot.data['title'].toString()),

            }else{
              return CircularProgressIndicator();
            }
          })
    );
  }
}
