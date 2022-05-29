import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:simon_says_hope/model/user_model.dart';
import 'package:simon_says_hope/repositories/user_repository.dart';
import 'package:simon_says_hope/services/modal_service.dart';
import 'package:simon_says_hope/services/storage_service.dart';
import 'package:simon_says_hope/services/validation_service.dart';
import 'package:simon_says_hope/ui/widgets/basic_page_widget.dart';
import 'dart:io';
import 'package:image_cropper/image_cropper.dart';

import '../../constants/globals.dart';

part 'edit_profile_vm.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);

  /// Text editing controller for user's username.
  final TextEditingController _usernameController = TextEditingController();

  /// Key that holds the form's state.
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  /// Validation service instance.
  final ValidationService _validationService = Get.find();

  /// Modal service instance.
  final ModalService _modalService = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<_EditProfileViewModel>(
      init: _EditProfileViewModel(),
      builder: (model) {
        // Set usernameController to user name text.
        if (model.user != null) {
          _usernameController.text = model.user!.username;
        }

        return model.user == null
            ? Scaffold(body: Center(child: CircularProgressIndicator()))
            : BasicPageWidget(
                leftIconButton: IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: () {
                    Get.back();
                  },
                ),
                rightIconButton: IconButton(
                  icon: const Icon(Icons.check),
                  onPressed: () async {
                    /// Validate form.
                    final bool formValid = _formKey.currentState!.validate();

                    /// Return if invalid.
                    if (!formValid) return;

                    /// Ask user if they want to submit critique.
                    final bool? confirm = await _modalService.showConfirmation(
                      context: context,
                      title: 'Save Profile',
                      message: 'Are you sure?',
                    );

                    /// Return if not true.
                    if (confirm == null || !confirm) return;

                    /// Proceed to save critique.
                    bool success = await model.save(
                      username: _usernameController.text,
                    );

                    /// Show success or error message based on response.
                    if (success) {
                      Get.snackbar(
                        'Success',
                        'Your profile was updated.',
                        icon: Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.green,
                        colorText: Colors.white,
                      );
                    } else {
                      Get.snackbar(
                        'Error',
                        'There was an issue saving your profile.',
                        icon: Icon(
                          Icons.cancel,
                          color: Colors.white,
                        ),
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                    }
                  },
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Stack(
                        children: <Widget>[
                          CachedNetworkImage(
                            imageUrl: model.user!.imgUrl ??
                                Globals.DUMMY_PROFILE_PHOTO_URL,
                            imageBuilder: (context, imageProvider) => GFAvatar(
                              radius: 40,
                              backgroundImage: imageProvider,
                            ),
                            placeholder: (context, url) => Center(
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                          Positioned(
                            bottom: 1,
                            right: 1,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.red,
                              child: Center(
                                child: IconButton(
                                  icon: Icon(
                                    MdiIcons.camera,
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    Get.defaultDialog(
                                      title: 'Update Photo',
                                      middleText:
                                          'Take a photo with camera or choose one from gallery?',
                                      titleStyle:
                                          TextStyle(color: Colors.black),
                                      middleTextStyle:
                                          TextStyle(color: Colors.black),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Get.back();
                                            model.updateImage(
                                                imageSource:
                                                    ImageSource.camera);
                                          },
                                          child: Text('Camera'),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            Get.back();

                                            model.updateImage(
                                                imageSource:
                                                    ImageSource.gallery);
                                          },
                                          child: Text('Gallery'),
                                        )
                                      ],
                                      barrierDismissible: true,
                                      radius: 10,
                                      // ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(40),
                        child: TextFormField(
                          style: context.textTheme.headline5!,
                          cursorColor: context.textTheme.headline5!.color,
                          controller: _usernameController,
                          keyboardType: TextInputType.text,
                          validator: _validationService.isEmpty,
                          textInputAction: TextInputAction.done,
                          maxLines: 1,
                          decoration: InputDecoration(
                            errorStyle: TextStyle(
                              color: context.textTheme.headline5!.color,
                            ),
                            hintText: 'Username',
                            hintStyle: context.textTheme.headline5!,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                title: 'Edit Profile',
              );
      },
    );
  }
}
