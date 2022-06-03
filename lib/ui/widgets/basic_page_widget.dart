import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:simon_says_hope/ui/widgets/custom_icon_box_widget.dart';

class BasicPageWidget extends StatelessWidget {
  final Widget child;
  final String title;
  final FloatingActionButton? floatingActionButton;
  final Widget? drawer;
  final IconButton? leftIconButton;
  final IconButton? rightIconButton;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const BasicPageWidget({
    Key? key,
    required this.child,
    required this.title,
    this.floatingActionButton,
    this.drawer,
    this.leftIconButton,
    this.rightIconButton,
    this.scaffoldKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      floatingActionButton: floatingActionButton,
      drawer: drawer,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: SafeArea(
            child: Column(
              children: [
                //App Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      leftIconButton == null
                          ? Container(
                              width: 50,
                            )
                          : CustomIconBoxWidget(
                              iconButton: leftIconButton!,
                            ),
                      Text(
                        title,
                        style: context.textTheme.headline1,
                      ),
                      rightIconButton == null
                          ? Container(
                              width: 50,
                            )
                          : CustomIconBoxWidget(
                              iconButton: rightIconButton!,
                            ),
                    ],
                  ),
                ),
                const Divider(),
                Expanded(child: child),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
