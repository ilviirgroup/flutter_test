import 'package:bloc/bloc.dart';
import 'package:untitled1/controllers/plan_controller.dart';

import '../../models/plan.dart';
import 'plan_event.dart';
import 'plan_state.dart';

class PlanBloc extends Bloc<PlanEvent, PlanState> {
 final PlanController controller;
 PlanBloc(this.controller):super(PlanLoad(controller.plans)){
   on<PlanLoadEvent>(_fetchPlans);
   on<PlanAddEvent>(_planAdded);
   on<PlanRemoveEvent>(_planRevoved);
   on<TaskAdded>(_taskAdded);
 }
 _fetchPlans(PlanLoadEvent event,Emitter<PlanState> emitter){
   emitter(PlanLoad(controller.plans));
 }
 _planAdded(PlanAddEvent event,Emitter<PlanState> emitter){
   controller.addNewPlan(event.name);
   emitter(PlanLoad(controller.plans));
 }
 _planRevoved(PlanRemoveEvent event,Emitter<PlanState> emitter){
   controller.deletePlan(event.plan);
   emitter(PlanLoad(controller.plans));
 }
 _taskAdded(TaskAdded event,Emitter<PlanState>emitter){
   controller.createTask(event.plan);
 }
}
