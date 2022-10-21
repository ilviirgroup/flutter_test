

import 'package:cloud_firestore/cloud_firestore.dart';

class Plan{
    final String name;
    final List tasks =[];
    DocumentReference? reference;
    Plan({required this.name});

    factory Plan.fromJson(Map<String,dynamic>json) =>Plan(name: json['name']);
    Map<String,dynamic> toJson() =><String,dynamic>{
      'name':name,
      'tasks':tasks
    };
    factory Plan.fromSnapshot(DocumentSnapshot snapshot){
      final plan = Plan.fromJson(snapshot.data() as Map<String,dynamic>);
      plan.reference = snapshot.reference;
      return plan;

    }


}