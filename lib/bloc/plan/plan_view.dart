import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/models/plan.dart';
import 'package:untitled1/models/plan.dart';

import '../../controllers/plan_controller.dart';
import 'plan_bloc.dart';
import 'plan_event.dart';
import 'plan_state.dart';

class PlanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => PlanBloc(PlanController())..add(PlanLoadEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    TextEditingController textEditingController =TextEditingController();
    //final bloc = BlocProvider.of<PlanBloc>(context);


    return BlocBuilder<PlanBloc, PlanState>(


      builder: (context, state) {

        if (state is PlanLoad){

          return Column(
            children: [
              TextField(
                controller: textEditingController,
                onEditingComplete:(){
                  context.read<PlanBloc>().add(PlanAddEvent(textEditingController.text));
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
                          context.read<PlanBloc>().add(PlanRemoveEvent(state.plans[index]));
                        },
                        child: ListTile(
                          title: Text(state.plans[index].name),
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) =>Container()));
                          },
                        ),
                      );

                    }),
              ),
            ],
          );
        }
        else{
          return CircularProgressIndicator();
        }


      },
    );
  }
}

