import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

part 'create_feeling_vm.dart';

class CreateFeelingScreen extends StatelessWidget {
  CreateFeelingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateFeelingViewModel>(
      init: CreateFeelingViewModel(),
      builder: (model) => Scaffold(
          floatingActionButton:
              FloatingActionButton(onPressed: () => {}),
          appBar: AppBar(
            title: Text('Create Feeling'),
          ),
          body: Column(
            children: [
              Text('Hello'),
            ],
          )),
    );
  }
}
