import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/domain/repo/plan_repo.dart';

import 'plan_bloc.dart';
import 'plan_event.dart';
import 'plan_state.dart';

class PlanPageView extends StatelessWidget {
   PlanPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          PlanBloc(PlanRepoImp())..add(LoadPlansEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }
TextEditingController textEditingController = TextEditingController();
  Widget _buildPage(BuildContext context) {
    

    return BlocBuilder<PlanBloc, PlanState>(builder: (context, state) {
      if (state is LoadPlans) {
        return Column(
          children: [
            TextField(
              controller: textEditingController,
              onEditingComplete: () {
                context
                    .read<PlanBloc>()
                    .add(AddNewPlanEvent(textEditingController.text));
                textEditingController.clear();
                
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: state.plans.length,
                itemBuilder: (BuildContext context, int index) {
                  return Dismissible(
                    key: ValueKey(state.plans[index]),
                    onDismissed: (_){
                      context
                    .read<PlanBloc>()
                    .add(RemovePlanEvent(state.plans[index].reference!));

                    },
                    child: ListTile(
                      title: Text(state.plans[index].name),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      } else {
        return const CircularProgressIndicator();
      }
    });
  }
}

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({super.key});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
              onEditingComplete: () {
                print(textEditingController.text);
                context
                    .read<PlanBloc>()
                    .add(AddNewPlanEvent(textEditingController.text));
                textEditingController.clear();
                
              },
            );
  }
}