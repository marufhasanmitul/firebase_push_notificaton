import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_push_notification/details_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Match List"),
      ),
      body: StreamBuilder(
        stream:FirebaseFirestore.instance.collection('football').snapshots() ,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(snapshot.hasError){
            return Center(
              child:Text('Error:${snapshot.error}') ,
            );
          }

          final documents = snapshot.data!.docs;


          return ListView.builder(

              itemCount: documents.length,

              itemBuilder:(context,index){
                final doc=documents[index];
                final matchName=doc['match_name'];

                return  TextButton(
                  onPressed: (){
                    if(doc!=null){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsScreen(data: doc)));
                    }

                  },
                  child:  Card(
                    child: ListTile(
                      title: Text("$matchName"),
                      trailing: const Icon(Icons.arrow_forward),
                    ),
                  ),
                );
              }

          );

        },

      ),

    );
  }
}
