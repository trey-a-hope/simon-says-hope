import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:simon_says_hope/constants/globals.dart';
import 'package:simon_says_hope/enums/feelings.dart';
import 'package:simon_says_hope/model/feeling_model.dart';
import 'package:simon_says_hope/model/user_model.dart';
import 'package:simon_says_hope/repositories/feeling_repository.dart';
import 'package:simon_says_hope/services/fcm_service.dart';
import 'package:simon_says_hope/services/modal_service.dart';
import 'package:simon_says_hope/services/validation_service.dart';
import 'package:simon_says_hope/ui/widgets/basic_page_widget.dart';

part 'create_feeling_vm.dart';

class CreateFeelingScreen extends StatelessWidget {
  CreateFeelingScreen({Key? key}) : super(key: key);

  /// Key that holds the current state of the scaffold.
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  /// Modal service instance.
  final ModalService _modalService = Get.find();

  /// Validation service instance.
  final ValidationService _validationService = Get.find();

  /// Form key state.
  final List<GlobalKey<FormState>> _formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>()
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<_CreateFeelingViewModel>(
      init: _CreateFeelingViewModel(),
      builder: (model) {
        TextEditingController controller;
        GlobalKey<FormState> formKey;

        switch (model.feeling) {
          case Feelings.heart:
            controller = model.heartController;
            formKey = _formKeys[0];
            break;
          case Feelings.mind:
            controller = model.mindController;
            formKey = _formKeys[1];
            break;
          case Feelings.soul:
            controller = model.soulController;
            formKey = _formKeys[2];
            break;
        }

        return BasicPageWidget(
          scaffoldKey: _scaffoldKey,
          title: 'Create Feeling',
          floatingActionButton: model.feeling == Feelings.soul
              ? FloatingActionButton.extended(
                  onPressed: () async {
                    /// Prompt user before submitting.
                    final bool? confirm = await _modalService.showConfirmation(
                        context: context,
                        title: 'Submit Feeling For The Day',
                        message: 'Are you sure?');

                    if (confirm == null || !confirm) return;

                    model.submit();
                  },
                  backgroundColor: Colors.green,
                  label: Text('Done'),
                  icon: Icon(Icons.check),
                )
              : null,
          leftIconButton: IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {
              Get.back();
            },
          ),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'How Does Your ${model.feeling.title} Feel?',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    textCapitalization: TextCapitalization.sentences,
                    cursorColor: Theme.of(context).textTheme.headline4!.color,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: controller,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    validator: _validationService.minChars,
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).textTheme.headline3!.color,
                    ),
                    maxLines: 5,
                    maxLength: 200,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(
                          color: Theme.of(context).textTheme.headline6!.color),
                      counterStyle: TextStyle(
                          color: Theme.of(context).textTheme.headline6!.color),
                      hintText: 'Enter your answer here...',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (model.feeling != Feelings.heart) ...[
                      ElevatedButton.icon(
                        onPressed: () => model.decrementStep(),
                        icon: Icon(Icons.navigate_before),
                        label: Text('Previous'),
                      )
                    ],
                    if (model.feeling != Feelings.soul) ...[
                      ElevatedButton.icon(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            model.incrementStep();
                          }
                        },
                        icon: Icon(Icons.navigate_next),
                        label: Text('Next'),
                      )
                    ],
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
