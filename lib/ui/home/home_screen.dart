import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_says_hope/constants/globals.dart';
import 'package:simon_says_hope/model/feeling_model.dart';
import 'package:simon_says_hope/model/user_model.dart';
import 'package:simon_says_hope/repositories/feeling_repository.dart';
import 'package:simon_says_hope/repositories/user_repository.dart';
import 'package:simon_says_hope/ui/drawer/drawer_screen.dart';
import 'package:simon_says_hope/ui/widgets/feeling_list_tile_widget.dart';

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
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () => model.load(),
            ),
          ],
        ),
        drawer: DrawerScreen(),
        body: model.feelings == null
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: model.feelings!.length,
                itemBuilder: (context, index) => FeelingListTileWidget(
                  feeling: model.feelings![index],
                  user: model.users!.firstWhere(
                    (u) => u.uid == model.feelings![index].uid,
                  ),
                ),
              ),
      ),
    );
  }
}
