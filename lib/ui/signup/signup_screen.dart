import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_says_hope/constants/globals.dart';
import 'package:simon_says_hope/extensions/hex_color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:simon_says_hope/repositories/user_repository.dart';

import '../../model/user_model.dart';
import '../../services/validation_service.dart';

part 'signup_vm.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  /// Validation service.
  final ValidationService _validationService = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<_SignupViewModel>(
      init: _SignupViewModel(),
      builder: (model) => Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                HexColor('0E8DF5'),
                HexColor('17CB89'),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              model.error == null
                  ? Column(
                      children: [
                        Text(
                          'Signup',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextFormField(
                            cursorColor: Colors.white,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: model.usernameController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            validator: _validationService.isEmpty,
                            style: TextStyle(fontSize: 16, color: Colors.white),
                            decoration: InputDecoration(
                              errorStyle: TextStyle(color: Colors.white),
                              counterStyle: TextStyle(color: Colors.white),
                              hintText: 'Username',
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextFormField(
                            cursorColor: Colors.white,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: model.emailController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            validator: _validationService.email,
                            style: TextStyle(fontSize: 16, color: Colors.white),
                            decoration: InputDecoration(
                              errorStyle: TextStyle(color: Colors.white),
                              counterStyle: TextStyle(color: Colors.white),
                              hintText: 'Email',
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextFormField(
                            cursorColor: Colors.white,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: model.passwordController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            validator: _validationService.password,
                            style: TextStyle(fontSize: 16, color: Colors.white),
                            decoration: InputDecoration(
                              errorStyle: TextStyle(color: Colors.white),
                              counterStyle: TextStyle(color: Colors.white),
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        model.isLoading
                            ? Center(child: CircularProgressIndicator())
                            : Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.2),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton.icon(
                                      onPressed: () => Get.back(),
                                      icon: Icon(Icons.navigate_before),
                                      label: Text('Back'),
                                    ),
                                    ElevatedButton.icon(
                                      onPressed: () => model.signup(),
                                      icon: Icon(Icons.person),
                                      label: Text('Signup'),
                                    ),
                                  ],
                                ),
                              )
                      ],
                    )
                  : Column(
                      children: [
                        Text(
                          model.error!,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                        ElevatedButton.icon(
                          onPressed: () => model.tryAgain(),
                          icon: Icon(Icons.login),
                          label: Text('Try Again'),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
