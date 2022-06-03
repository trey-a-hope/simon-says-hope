import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:intl/intl.dart';
import 'package:simon_says_hope/model/feeling_model.dart';
import 'package:simon_says_hope/model/user_model.dart';
import 'package:simon_says_hope/ui/widgets/full_width_button_widget.dart';

import '../../constants/globals.dart';

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
      leading: SizedBox(
        width: 50,
        child: CachedNetworkImage(
          imageUrl: user.imgUrl ?? Globals.DUMMY_PROFILE_PHOTO_URL,
          imageBuilder: (context, imageProvider) => GFAvatar(
            backgroundImage: imageProvider,
          ),
          placeholder: (context, url) => Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
      title: Text(
        '${user.username}\ ${DateFormat('@ h:mm a').format(feeling.created)}',
      ),
      trailing: Icon(Icons.chevron_right),
      onTap: () => Get.bottomSheet(
        BottomSheet(
          onClosing: () => {},
          builder: (_) => Padding(
            padding: EdgeInsets.fromLTRB(30, 60, 30, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(user.username, style: _headerTextStyle),
                    Text(
                      ' ${DateFormat('EEE, MMM d, yyyy @ h:mm a').format(feeling.created)}',
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
                Spacer(),
                FullWidthButtonWidget(
                  text: 'I UNDERSTAND',
                  buttonColor: Colors.red,
                  onPressed: () => Get.back(),
                ),
              ],
            ),
          ),
        ),
        isScrollControlled: true,
        isDismissible: false,
      ),
    );
  }
}
