import 'package:flutter/cupertino.dart';
import 'package:khata_app/modal/khata.dart';

class KhataDatas extends ChangeNotifier{

  List<Khata> _khataDatas=[];

void addKhata(Khata khata){

      _khataDatas.add(khata);
}

 List<Khata> getKhataList(){
  return _khataDatas;

}

}