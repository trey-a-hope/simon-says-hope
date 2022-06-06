import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:simon_says_hope/constants/globals.dart';
import 'package:simon_says_hope/enums/calendar_marker_status.dart';
import 'package:simon_says_hope/model/feeling_model.dart';
import 'package:simon_says_hope/model/user_model.dart';
import 'package:simon_says_hope/repositories/feeling_repository.dart';
import 'package:simon_says_hope/repositories/settings_repository.dart';
import 'package:simon_says_hope/repositories/user_repository.dart';
import 'package:simon_says_hope/services/auth_service.dart';
import 'package:simon_says_hope/ui/drawer/drawer_screen.dart';
import 'package:simon_says_hope/ui/widgets/basic_page_widget.dart';
import 'package:simon_says_hope/ui/widgets/feeling_list_tile_widget.dart';
import 'package:table_calendar/table_calendar.dart';

part 'home_vm.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  /// Key that holds the current state of the scaffold.
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<_HomeViewModel>(
      init: _HomeViewModel(),
      builder: (model) => BasicPageWidget(
        scaffoldKey: _scaffoldKey,
        title: 'Home',
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //TODO: Validate that the user has not submitted a feeling for today.
            Get.toNamed(
              Globals.ROUTES_CREATE_FEELING,
              arguments: {
                'partnerUser': model.users!.firstWhere(
                  (u) => u.uid != model.currentUser.uid,
                ),
                'currentUser': model.currentUser,
              },
            );
          },
          child: Icon(Icons.add),
        ),
        drawer: DrawerScreen(),
        rightIconButton: IconButton(
          icon: Icon(Icons.refresh),
          onPressed: () => model.load(),
        ),
        leftIconButton: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        child: model.feelings == null
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: <Widget>[
                  TableCalendar(
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: model.focusedDay,
                    selectedDayPredicate: (day) =>
                        isSameDay(day, model.selectedDay),
                    onDaySelected: model.onDaySelected,
                    calendarFormat: model.calendarFormat,
                    onFormatChanged: model.onFormatChanged,
                    eventLoader: model.eventLoader,
                    calendarBuilders: CalendarBuilders(
                      markerBuilder: model.markerBuilder,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                        'Feelings for ${DateFormat('EEE, MMM d').format(model.selectedDay)}'),
                  ),
                  Expanded(
                    child: model.selectedFeelings.isEmpty
                        ? Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.sentiment_dissatisfied,
                                  color: Colors.grey,
                                  size: 150,
                                ),
                                Text('No feelings for this day...'),
                              ],
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: model.selectedFeelings.length,
                            itemBuilder: (context, index) =>
                                FeelingListTileWidget(
                              feeling: model.selectedFeelings[index],
                              user: model.users.firstWhere(
                                (u) =>
                                    u.uid == model.selectedFeelings[index].uid,
                              ),
                            ),
                          ),
                  )
                ],
              ),
      ),
    );
  }
}
