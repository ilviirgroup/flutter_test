import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled1/domain/models/plan.dart';

class FirebaseService{
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  addNewPlan(Plan plan)async{
    await _firebaseFirestore.collection('plans').add(plan.toJson());
  }
  Future<List<Plan>> getPlans()async{
    QuerySnapshot<Map<String,dynamic>> snapshot = await _firebaseFirestore.collection('plans').get();
    return snapshot.docs.map((e) => Plan.fromSnapshot(e)).toList();
  }
  removePlan(DocumentReference  reference)async{
    await reference.delete();
  }
}