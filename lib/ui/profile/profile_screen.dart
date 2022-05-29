import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:simon_says_hope/constants/globals.dart';
import 'package:simon_says_hope/model/user_model.dart';
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
          onPressed: () => Get.toNamed(
            Globals.ROUTES_EDIT_PROFILE,
            arguments: {
              'uid': model.user!.uid,
            },
          ),
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
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        model.user!.imgUrl ?? Globals.DUMMY_PROFILE_PHOTO_URL,
                    imageBuilder: (context, imageProvider) => GFAvatar(
                      radius: 40,
                      backgroundImage: imageProvider,
                    ),
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),

                  Text(
                    model.user!.username,
                    style: TextStyle(
                      fontSize: 21,
                      color: Colors.black,
                    ),
                  ),
                  // Text('Color'),
                  // CircleAvatar(backgroundColor: Colors.red),
                ],
              ),
      ),
    );
  }
}
