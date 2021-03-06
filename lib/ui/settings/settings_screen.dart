import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:simon_says_hope/ui/drawer/drawer_screen.dart';
import 'package:simon_says_hope/ui/widgets/basic_page_widget.dart';
import '../../services/auth_service.dart';
import '../../services/modal_service.dart';

part 'settings_vm.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);

  /// Key that holds the current state of the scaffold.
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  /// Instantiate modal service.
  final ModalService _modalService = Get.find();

  /// Instantiate auth service.
  final AuthService _authService = Get.find();

  /// Get storage instance.
  final GetStorage _getStorage = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<_SettingsViewModel>(
      init: _SettingsViewModel(),
      builder: (model) => BasicPageWidget(
        scaffoldKey: _scaffoldKey,
        title: 'Settings',
        drawer: DrawerScreen(),
        leftIconButton: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                'Logout',
                style: Theme.of(context).textTheme.headline4,
              ),
              trailing: Icon(
                Icons.logout,
                color: Theme.of(context).iconTheme.color,
              ),
              onTap: () async {
                /// Ask user if they're sure about log out.
                bool? confirm = await _modalService.showConfirmation(
                  context: context,
                  title: 'Logout',
                  message: 'Are you sure?',
                );
                if (confirm == null || confirm) {
                  // Clear user identifier for crashlytics.
                  await FirebaseCrashlytics.instance.setUserIdentifier('');

                  // Sign user out of auth.
                  await _authService.signOut();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
