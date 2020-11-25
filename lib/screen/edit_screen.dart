import 'package:flutter/material.dart';
import 'package:khata_app/modal/khata.dart';
import 'package:khata_app/modal/khata_datas.dart';
import 'package:provider/provider.dart';

class EditScreen extends StatefulWidget {

   final Khata khata;

  EditScreen(this.khata);

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {

  Khata _khata = Khata();

  @override
  void initState() {

    _khata= widget.khata;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<KhataDatas>(

      builder: (context,data,child){

        return  Scaffold(
          appBar: AppBar(title: Center(child: Text('Edit Record'))),

          body: ListView(
            children: [
              Column(

                children: [

                  TextFormField(
                    initialValue: widget.khata.lenderName,

                    onChanged: (value){
                      _khata.lenderName=value;
                    },
                  ),

                  TextFormField(
                    initialValue: widget.khata.itemName,

                    onChanged: (value){
                      _khata.itemName=value;
                    },
                  ),

                  TextFormField(
                    initialValue: widget.khata.lenderMoney,

                    onChanged: (value){
                      _khata.lenderMoney=value;
                    },
                  ),

                  TextFormField(
                    initialValue: widget.khata.remark,

                    onChanged: (value){
                      _khata.remark=value;
                    },
                  ),

                  TextFormField(
                    initialValue: widget.khata.date,

                    onChanged: (value){
                      _khata.date=value;
                    },
                  ),

                  RaisedButton(
                    color: Colors.pink,
                    onPressed: (){

                      data.updateKhata( _khata);
                      Navigator.pop(context);
                    },

                    child: Text('UPDATE'),

                  ),


                ],
              ),
            ],
          ),
        );

      },


    );
  }
}
