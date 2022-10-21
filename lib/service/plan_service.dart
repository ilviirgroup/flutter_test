import 'package:untitled1/models/task.dart';
import 'package:untitled1/repositories/in_memory_cache.dart';
import 'package:untitled1/repositories/repo.dart';

import '../models/plan.dart';

class PlanService{
  Repo _repo = InMemoryCache();

  Plan createPlan(String name){
    final model = _repo.create();
    final plan = Plan.fromModel(model)..name = name;
    savePlan(plan);
    return plan;
  }
  void savePlan(Plan plan){
    _repo.update(plan.toModel());
  }
  void delete(Plan plan){
    _repo.delete(plan.toModel());
  }
  List<Plan> getAllPlans(){
    return _repo.getAll().map((e) => Plan.fromModel(e)).toList();
  }

  void addTask(Plan plan, String description){
    final id = plan.tasks.last.id;
    final task = Task(id: id,description: description);
    plan.tasks.add(task);
    savePlan(plan);

  }
  void deleteTask(Plan plan, Task task){
    plan.tasks.remove(task);
    savePlan(plan);
  }

}