import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example/add_page.dart';
import 'package:flutter_example/edit_screen.dart';
import 'database_services.dart';

class ShowDataPage extends StatelessWidget {
  const ShowDataPage({ Key? key }) : super(key: key);

  navigation(BuildContext context, Widget next) {
    Navigator.push(context, MaterialPageRoute(builder: (_)=>next));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        navigation(context, AddPage());
      },child: Icon(Icons.add),),

      body: StreamBuilder(
        stream: firebaseFirestore.collection('notes').snapshots(),        
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
          if (snapshot.hasData) {
            return ListView.builder(itemCount: snapshot.data!.docs.length,
          itemBuilder: (BuildContext context, int index){
            final res = snapshot.data!.docs[index];
            return Dismissible(
              key: UniqueKey(),
        //   background: Icon(Icons.delete),
          background: Container(color: Colors.red,),
              onDismissed: (v) {
                DataBaseServices.delete(res.id);
              },
              child: Card(child: ExpansionTile(title: Text("${res["title"]}"),
            //  trailing: IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                      children: [
              Text("${res["detail"]}"),
                      ], 
                      leading: IconButton(onPressed: () {
                        navigation(context, EditDataPage(
                          id: res.id,
                          title: res["title"],
                          detail: res["detail"],
                        
                        ));
                        
                      }, icon: Icon(Icons.edit)),
              ),
              ),
            ); 
          },);
          } else {
            return Center(child: CircularProgressIndicator(color: Colors.deepPurple,),);
          }
          
        })
    );
  }
}