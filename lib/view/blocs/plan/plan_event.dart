import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled1/bloc/plan/plan_event.dart';

abstract class PlanEvent {}

class InitEvent extends PlanEvent {}

class LoadPlansEvent extends PlanEvent {}

class AddNewPlanEvent extends PlanEvent {
  String name;
  AddNewPlanEvent(this.name);
}

class AddNewTaskEvent extends PlanEvent {
  String name;
  AddNewTaskEvent(this.name);
}

class RemovePlanEvent extends PlanEvent {
  DocumentReference reference;
  RemovePlanEvent(this.reference);
}
