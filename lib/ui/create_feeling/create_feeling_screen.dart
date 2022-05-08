import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_says_hope/constants/globals.dart';

part 'create_feeling_vm.dart';

class CreateFeelingScreen extends StatelessWidget {
  CreateFeelingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<_CreateFeelingViewModel>(
      init: _CreateFeelingViewModel(),
      builder: (model) {
        String title = '';
        TextEditingController? controller;

        switch (model.currentStep) {
          case 1:
            title = 'Heart';
            controller = model.heartController;
            break;
          case 2:
            title = 'Mind';
            controller = model.mindController;
            break;
          case 3:
            title = 'Soul';
            controller = model.soulController;
            break;
        }

        return Scaffold(
          appBar: AppBar(
            title: Text('Create Feeling'),
          ),
          floatingActionButton: model.currentStep == 3
              ? FloatingActionButton.extended(
                  onPressed: () => model.submit(),
                  label: Text('Done'),
                  icon: Icon(Icons.check),
                )
              : null,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'How Does Your $title Feel?',
                style: Theme.of(context).textTheme.headline4,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  textCapitalization: TextCapitalization.sentences,
                  cursorColor: Theme.of(context).textTheme.headline4!.color,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: controller!,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  // validator: _validationService.isEmpty,
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).textTheme.headline3!.color,
                  ),
                  maxLines: 5,
                  maxLength: 200,
                  decoration: InputDecoration(
                    errorStyle: TextStyle(
                        color: Theme.of(context).textTheme.headline6!.color),
                    counterStyle: TextStyle(
                        color: Theme.of(context).textTheme.headline6!.color),
                    hintText: 'Enter your answer here...',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (model.currentStep > 1) ...[
                    ElevatedButton.icon(
                      onPressed: () => model.decrementStep(),
                      icon: Icon(Icons.navigate_before),
                      label: Text('Previous'),
                    )
                  ],
                  if (model.currentStep < 3) ...[
                    ElevatedButton.icon(
                      onPressed: () => model.incrementStep(),
                      icon: Icon(Icons.navigate_next),
                      label: Text('Next'),
                    )
                  ],
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
