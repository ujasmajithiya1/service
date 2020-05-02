import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import './auth.dart';
import 'package:final_app/model/food_item.dart';

class DatabaseService {
  
  final String uid;
  
  //final FoodItem serviceList = FoodItem(id: );
  DatabaseService({this.uid, });

  final CollectionReference serviceCollection = Firestore.instance.collection('service');
 // DocumentReference documentReference = Firestore.instance.collection('service').document();


  Future updateUserData(int id, String title, double price) async {
     List<FoodItem> serviceList ;
    return await serviceCollection.document(uid).setData({
      'service list': serviceList,
    });

  }

  
  

}