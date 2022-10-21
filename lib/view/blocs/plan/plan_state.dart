import 'package:untitled1/bloc/plan/plan_state.dart';

import '../../../domain/models/plan.dart';

abstract class PlanState {
  const PlanState();
}

class InitPlans extends PlanState{}

class LoadPlans extends PlanState{
  List<Plan> plans;
  LoadPlans(this.plans);
}


