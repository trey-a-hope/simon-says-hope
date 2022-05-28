import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_says_hope/model/user_model.dart';
import 'package:simon_says_hope/repositories/user_repository.dart';
import 'package:simon_says_hope/services/auth_service.dart';
import 'package:simon_says_hope/ui/drawer/drawer_screen.dart';
import 'package:simon_says_hope/ui/widgets/basic_page_widget.dart';

part 'profile_vm.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  /// Key that holds the current state of the scaffold.
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<_ProfileViewModel>(
      init: _ProfileViewModel(),
      builder: (model) => BasicPageWidget(
        scaffoldKey: _scaffoldKey,
        title: 'Profile',
        drawer: DrawerScreen(),
        rightIconButton: IconButton(
          icon: Icon(Icons.edit),
          onPressed: () => null,
        ),
        leftIconButton: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        child: model.user == null
            ? Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Username'),
                  Text(
                    model.user!.username,
                    style: TextStyle(
                      fontSize: 21,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
