import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:simon_says_hope/model/feeling_model.dart';
import 'package:simon_says_hope/model/user_model.dart';

class FeelingListTileWidget extends StatelessWidget {
  FeelingListTileWidget({
    Key? key,
    required this.feeling,
    required this.user,
  }) : super(key: key);

  /// Feeling
  final FeelingModel feeling;

  /// User
  final UserModel user;

  /// Text style for bottom sheet answer.
  final TextStyle _textStyle = TextStyle(fontSize: 18, color: Colors.black);
  final TextStyle _headerTextStyle = TextStyle(fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        '${user.username}\'s feeling for ${DateFormat('MMM dd, yyyy').format(feeling.created)}',
      ),
      trailing: Icon(Icons.chevron_right),
      onTap: () => Get.bottomSheet(
        BottomSheet(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 10,
          onClosing: () => {},
          builder: (_) => Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(user.username, style: _headerTextStyle),
                    Text(
                      ' ${DateFormat('EEE, MMM d, yyyy').format(feeling.created)}',
                      style: _headerTextStyle,
                    ),
                  ],
                ),
                Divider(),
                Text('How does your heart feel?'),
                Text(
                  '\"${feeling.heart}\"',
                  style: _textStyle,
                ),
                const SizedBox(height: 10),
                Text('How does your mind feel?'),
                Text(
                  '\"${feeling.mind}\"',
                  style: _textStyle,
                ),
                const SizedBox(height: 10),
                Text('How does your soul feel?'),
                Text(
                  '\"${feeling.soul}\"',
                  style: _textStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
