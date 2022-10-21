import '../../models/plan.dart';

abstract class PlanEvent {
  const PlanEvent();
}

class InitEvent extends PlanEvent {}

class PlanLoadEvent extends PlanEvent{}
class PlanAddEvent extends PlanEvent{
  String name;
   PlanAddEvent(this.name);
}
class PlanRemoveEvent extends PlanEvent{
  final Plan plan;
  const PlanRemoveEvent(this.plan);
}

class TaskAdded extends PlanEvent{
  final Plan plan;
  const TaskAdded(this.plan);

}