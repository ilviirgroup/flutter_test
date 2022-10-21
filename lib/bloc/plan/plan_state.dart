import '../../models/plan.dart';

abstract class PlanState{
  const PlanState();
}

class PlanInit extends PlanState{}

class PlanLoad extends PlanState{
  final List<Plan> plans;
  const PlanLoad(this.plans);
}

