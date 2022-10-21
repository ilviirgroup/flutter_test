import 'package:untitled1/models/task.dart';
import '../repositories/repo.dart';

class Plan{
  final int id;
  String name = '';
  List<Task> tasks = [];

  Plan({required this.id});

  Plan.fromModel(Model model)
      :id = model.id,
      name = model.data['name'] ??'new name',
      tasks = model.data['tasks'] ?? <Task>[];


  Model toModel()=> Model(id: id,data: {'name':name,'tasks':tasks});

  int get completeCount => tasks.where((element) => element.complete).length;

  String get completenessMessage => '$completeCount out of ${tasks.length} tasks';



}