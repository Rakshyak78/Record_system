import 'package:flutter/cupertino.dart';
import 'package:khata_app/modal/khata.dart';

class KhataDatas extends ChangeNotifier{

  List<Khata> _khataDatas=[];

void addKhata(Khata khata){

      _khataDatas.add(Khata(
        lenderName: khata.lenderName,
        itemName: khata.itemName,
        lenderMoney: khata.lenderMoney,
        remark: khata.remark,
        date: khata.date,

      ));

      notifyListeners();
}

 List<Khata> getKhataList(){
  return _khataDatas;
}

void updateKhata( Khata khata){
  _khataDatas.add(Khata(

    lenderName: khata.lenderName,
    itemName: khata.itemName,
    lenderMoney: khata.lenderMoney,
    remark: khata.remark,
    date: khata.date,
  ));

  notifyListeners();


}

void removeKhata(){

  notifyListeners();

}

}