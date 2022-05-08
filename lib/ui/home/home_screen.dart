import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:simon_says_hope/constants/globals.dart';
import 'package:simon_says_hope/model/feeling_model.dart';
import 'package:simon_says_hope/repositories/feeling_repository.dart';
import 'package:simon_says_hope/ui/drawer/drawer_screen.dart';
import 'package:table_calendar/table_calendar.dart';

part 'home_vm.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<_HomeViewModel>(
      init: _HomeViewModel(),
      builder: (model) => Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              //TODO: Validate that the user has not submitted a feeling for today.
              Get.toNamed(Globals.ROUTES_CREATE_FEELING);
            },
            child: Icon(Icons.add),
          ),
          appBar: AppBar(
            title: Text('Home'),
          ),
          drawer: DrawerScreen(),
          body: Column(
            children: [
              TableCalendar(
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: DateTime.now(),
              ),
            ],
          )),
    );
  }
}
