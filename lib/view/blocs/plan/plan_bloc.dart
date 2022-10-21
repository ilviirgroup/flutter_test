import 'package:bloc/bloc.dart';
import 'package:untitled1/domain/repo/plan_repo.dart';

import 'plan_event.dart';
import 'plan_state.dart';

class PlanBloc extends Bloc<PlanEvent, PlanState> {
  PlanRepoImp planRepoImp;
  PlanBloc(this.planRepoImp) : super(InitPlans()) {
    on<LoadPlansEvent>(_loadPlans);
    on<AddNewPlanEvent>(_addNewPlan);
    on<RemovePlanEvent>(_removePlan);
  }

  _loadPlans(LoadPlansEvent event, Emitter<PlanState> emitter) async {
    emitter(LoadPlans(await planRepoImp.getPlans()));
  }

  _addNewPlan(AddNewPlanEvent event, Emitter<PlanState> emitter) async {
    planRepoImp.addNewPlan(event.name);
    emitter(LoadPlans(await planRepoImp.getPlans()));
  }

  _removePlan(RemovePlanEvent event, Emitter<PlanState> emitter) {
    planRepoImp.deletePlan(event.reference);
  }
}
