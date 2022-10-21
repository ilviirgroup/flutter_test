import 'package:untitled1/service/plan_service.dart';

import '../models/plan.dart';
import '../models/task.dart';

class PlanController{
  final service = PlanService();

  List<Plan> get plans =>List.unmodifiable(service.getAllPlans());

  void addNewPlan(String name){
    if (name.isEmpty){
      return;
    }
    name = _checkForDuplicates(plans.map((e) => e.name),name);
    service.createPlan(name);
  }
  void savePlan(Plan plan){
    service.savePlan(plan);
  }
  void deletePlan(Plan plan){
    service.delete(plan);
  }
  void createTask(Plan plan,[String? description]){
    if(description == null || description.isEmpty){
      description = 'New Task';
    }
    description = _checkForDuplicates(plan.tasks.map((e) => e.description), description);
    service.addTask(plan, description);
  }
  void deleteTask(Plan plan,Task task){
    service.deleteTask(plan, task);
  }
  String _checkForDuplicates(Iterable<String> items,String text){
    final duplicateCount = items.where((element) => element.contains(text)).length;
    if(duplicateCount> 0){
      text +='${duplicateCount + 1}';
    }
    return text;
  }
}