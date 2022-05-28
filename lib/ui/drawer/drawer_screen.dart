import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../constants/globals.dart';
import '../../model/user_model.dart';
import '../../services/auth_service.dart';

part 'drawer_vm.dart';

class DrawerScreen extends StatelessWidget {
  DrawerScreen({Key? key}) : super(key: key);

  /// Instantiate get storage.
  final GetStorage _getStorage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<_DrawerViewModel>(
      init: _DrawerViewModel(),
      builder: (model) => Drawer(
        child: SafeArea(
          child: Column(
            children: [
              DrawerHeader(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        model.user == null
                            ? 'Hello...'
                            : 'Hello, ${model.user!.username}',
                        style: context.textTheme.headline4,
                      ),
                    ),
                    // model.user == null
                    //     ? Center(child: CircularProgressIndicator(),)
                    //     : CircleAvatar(
                    //         radius: 40,
                    //         backgroundImage: NetworkImage(
                    //           model.user!.imgUrl,
                    //         ),
                    //       ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: Text(
                  'Home',
                  style: context.textTheme.headline4,
                ),
                onTap: () {
                  Get.offNamed(Globals.ROUTES_HOME);
                },
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: Text(
                  'Profile',
                  style: context.textTheme.headline4,
                ),
                onTap: () {
                  Get.offNamed(Globals.ROUTES_PROFILE);
                },
              ),
              Spacer(),
              ListTile(
                leading: const Icon(Icons.settings),
                title: Text(
                  'Settings',
                  style: context.textTheme.headline4,
                ),
                onTap: () {
                  Get.toNamed(Globals.ROUTES_SETTINGS);
                },
              ),
              Text(
                'Version ${_getStorage.read(Globals.APP_VERSION)}',
              )
            ],
          ),
        ),
      ),
    );
  }
}
