import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khata_app/modal/khata.dart';
import 'package:khata_app/modal/khata_datas.dart';
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
            title: Center(child: Text('KHATA RECORD'),),
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
                      color: Colors.amber,

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:[
                              Text(data.getKhataList()[position].lenderName,
                                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: (){},
                              ),
                            ],
                          ),

                          Text(data.getKhataList()[position].itemName,
                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

                          Text(data.getKhataList()[position].lenderMoney,
                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

                          Text(data.getKhataList()[position].remark,
                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

                          Text(data.getKhataList()[position].date,
                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

                        ],
                      ),


                    ),
                  ],

                ),
              );

            },
            separatorBuilder: (context,position){
              return Divider();
              },

            itemCount: data.getKhataList().length,

          ),

          floatingActionButton: FloatingActionButton(
            onPressed: (){

              showModalBottomSheet(
                  context:context,
                  builder:(context){

                    return Column(
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
                            hintText: "Name",

                          ),
                        ),

                        TextField(
                          onChanged: (value){
                            _khata.lenderMoney = value;
                          },

                          decoration: InputDecoration(

                            hintText: "Name",

                          ),
                        ),

                        TextField(
                          onChanged: (value){
                            _khata.remark = value;
                          },
                          decoration: InputDecoration(

                            hintText: "Name",

                          ),
                        ),

                        TextField(
                          onChanged: (value){
                            _khata.date = value;
                          },
                          decoration: InputDecoration(

                            hintText: "Name",

                          ),
                        ),

                        RaisedButton(
                          onPressed: (){},
                          child: Text('SAVE'),
                        ),

                      ],
                    );

                  }
              );
            },
            child: IconButton(
              onPressed: (){},
              icon: Icon(Icons.add,
                color: Colors.white70,),
            ),
          ),
        );

      },


    );
  }
}
