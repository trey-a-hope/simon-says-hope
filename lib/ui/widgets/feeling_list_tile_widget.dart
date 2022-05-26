import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simon_says_hope/model/feeling_model.dart';
import 'package:simon_says_hope/model/user_model.dart';

class FeelingListTileWidget extends StatelessWidget {
  const FeelingListTileWidget({
    Key? key,
    required this.feeling,
    required this.user,
  }) : super(key: key);

  /// Feeling
  final FeelingModel feeling;

  /// User
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        '${user.username}\'s feeling for ${DateFormat('MMM dd, yyyy').format(feeling.created)}',
      ),
    );
  }
}
