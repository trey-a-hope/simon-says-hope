import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

part 'home_vm.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (model) => Scaffold(
          floatingActionButton:
              FloatingActionButton(onPressed: () => model.createFeeling()),
          appBar: AppBar(
            title: Text('Home'),
          ),
          body: Column(
            children: [
              Text('Hello'),
            ],
          )),
    );
  }
}
