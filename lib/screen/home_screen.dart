import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:khata_app/modal/khata.dart';
import 'package:khata_app/modal/khata_datas.dart';
import 'package:khata_app/screen/edit_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Khata _khata= Khata();

  @override
  Widget build(BuildContext context) {
    return Consumer<KhataDatas>(

      builder: (context,data,child){

        return  Scaffold(
          appBar: AppBar(
            title: Center(child: Text('DATA RECORD'),),
          ),

          body: ListView.separated(

            // scrollDirection: Axis.horizontal,

            itemBuilder: (context,position){
              return Card(
                elevation: 15,

                child: Column(

                  children: [


                       Container(
                        height:MediaQuery.of(context).size.height/4,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.lightBlueAccent,

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [



                               SizedBox(
                                 height:20,
                                 child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:[
                                    Text(data.getKhataList()[position].lenderName,
                                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),

                                    IconButton(
                                      icon: Icon(Icons.edit),
                                      onPressed: (){

                                        Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => EditScreen(
                                              _khata),
                                        ));

                                      },
                                    ),
                                  ],
                              ),
                               ),

                         Divider(),

                            Text(data.getKhataList()[position].itemName,
                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            Divider(),

                            Text(data.getKhataList()[position].lenderMoney,
                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            Divider(),

                            Text(data.getKhataList()[position].remark,
                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            Divider(),

                            Text(data.getKhataList()[position].date,
                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

                          ],
                        ),


                      ),
                  ], ),


                );


            },
            separatorBuilder: (context,position){
              return Divider();
              },

            itemCount: data.getKhataList().length,

          ),

          floatingActionButton: FloatingActionButton(

            child: IconButton(
              icon: Icon(Icons.add,
              color: Colors.white,),
            ),
            onPressed: (){



              showModalBottomSheet(

                isScrollControlled: true,

                  context:context,
                  builder:(context){


                    return Container(
                      height: 600,


                      child: ListView(
                        children: [
                          Column(
                            children: [
                              TextField(
                                decoration: InputDecoration(
                                  hintText: "Name",
                                ),

                                onChanged: (value){
                                  _khata.lenderName=value;
                                },
                              ),

                              TextField(
                                onChanged: (value){
                                  _khata.itemName = value;
                                },

                                decoration: InputDecoration(
                                  hintText: "Item Name",

                                ),
                              ),

                              TextField(
                                onChanged: (value){
                                  _khata.lenderMoney = value;
                                },

                                decoration: InputDecoration(

                                  hintText: "Money",

                                ),
                              ),

                              TextField(
                                onChanged: (value){
                                  _khata.remark = value;
                                },
                                decoration: InputDecoration(

                                  hintText: "Remark",

                                ),
                              ),

                              TextField(
                                onChanged: (value){
                                  _khata.date = value;
                                },
                                decoration: InputDecoration(

                                  hintText: "Date",

                                ),
                              ),

                              SizedBox(
                                height: MediaQuery.of(context).viewInsets.bottom == 0 ? 10 : 300,
                              ),


                              RaisedButton(
                                onPressed: (){

                                  data.addKhata(_khata);
                                  Navigator.pop(context);
                                },
                                child: Text('SAVE'),
                              ),

                            ],
                          ),
                        ],

                      ),
                    );

                  }
              );
            },

          ),
        );

      },


    );
  }
}
