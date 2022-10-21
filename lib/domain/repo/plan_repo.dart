import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled1/domain/models/plan.dart';
import 'package:untitled1/domain/service/firebase_service.dart';

class PlanRepoImp implements PlanRepo {
  FirebaseService firebaseService = FirebaseService();

  @override
  Future<List<Plan>> getPlans() async {
    return await firebaseService.getPlans();
  }

  @override
  Future<void> addNewPlan(String name) async {
    final plan = Plan(name: name);
    await firebaseService.addNewPlan(plan);
  }

  @override
  Future<void> deletePlan(DocumentReference<Object?> reference) async{
    await firebaseService.removePlan(reference);
  }
}

abstract class PlanRepo {
  Future<List<Plan>> getPlans();
  Future<void> addNewPlan(String name);
  Future<void> deletePlan(DocumentReference reference);
}
