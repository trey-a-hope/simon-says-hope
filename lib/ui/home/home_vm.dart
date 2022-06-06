part of 'home_screen.dart';

class _HomeViewModel extends GetxController {
  /// Feelings Repository.
  final FeelingRepository _feelingRepository = Get.find();

  /// Users Repository.
  final UserRepository _userRepository = Get.find();

  /// Auth Service.
  final AuthService _authService = Get.find();

  /// Settings repository.
  final SettingsRepository _settingsRepository = Get.find();

  /// List of feelings.
  List<FeelingModel>? _feelings;
  List<FeelingModel>? get feelings => _feelings;

  /// The events, or feelings mapped to a date.
  Map<DateTime, List<FeelingModel>> _events = {};

  /// The events for the currently selected date.
  List<FeelingModel> _selectedFeelings = [];
  List<FeelingModel> get selectedFeelings => _selectedFeelings;

  /// List of users, Simone and Trey.
  List<UserModel> _users = [];
  List<UserModel> get users => _users;

  /// Current user of the app.
  late UserModel _currentUser;
  UserModel get currentUser => _currentUser;

  /// Selected day.
  DateTime _selectedDay = DateTime.now();
  DateTime get selectedDay => _selectedDay;

  /// Focused day.
  DateTime _focusedDay = DateTime.now();
  DateTime get focusedDay => _focusedDay;

  /// Calendar format.
  late CalendarFormat _calendarFormat;
  CalendarFormat get calendarFormat => _calendarFormat;

  /// Calendar marker status, (complete/incomplete),
  CalendarMarkerStatus _calendarMarkerStatus = CalendarMarkerStatus.incomplete;

  @override
  void onInit() async {
    load();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  /// Load the page.
  void load() async {
    try {
      // Fetch current user of the app.
      _currentUser = await _authService.getCurrentUser();

      // Fetch calendar format settings for the app.
      String? calendarFormat =
          await _settingsRepository.get(key: 'calendarFormat');
      switch (calendarFormat) {
        case 'twoWeeks':
          _calendarFormat = CalendarFormat.twoWeeks;
          break;
        case 'week':
          _calendarFormat = CalendarFormat.week;
          break;
        case 'month':
        case null:
        default:
          _calendarFormat = CalendarFormat.month;
          break;
      }

      // Fetch the two users of the app.
      _users = await _userRepository.retrieveUsers();

      // Fetch feelings.
      await retrieveFeelings();

      // Get the events for the selected day.
      _selectedFeelings = eventLoader(_selectedDay);
    } catch (e) {
      print(e);
    }
  }

  Future<void> retrieveFeelings() async {
    try {
      // Clear the event map.
      _events.clear();

      // Fetch all feelings.
      _feelings = await _feelingRepository.retrieveFeelings();

      // Map feelings to events by their post date.
      _feelings!.forEach(
        (FeelingModel feeling) {
          DateTime dayKey = DateTime(
            feeling.created.year,
            feeling.created.month,
            feeling.created.day,
          );

          if (_events.containsKey(dayKey)) {
            // if (!_events[dayKey]!.contains(feeling)) {
            _events[dayKey]!.add(feeling);
            // }
          } else {
            _events[dayKey] = [feeling];
          }
        },
      );

      update();
    } catch (error) {
      print(error);
    }
  }

  // Action called when the user selects a day on the calendar.
  void onDaySelected(
    DateTime onDaySelectedSelectedDay,
    DateTime onDaySelectedFocusDay,
  ) {
    _selectedDay = onDaySelectedSelectedDay;
    _focusedDay = onDaySelectedFocusDay;

    // Get the events for the selected day.
    _selectedFeelings = eventLoader(_selectedDay);

    update();
  }

  // Action called when the user changes the format of the calendar.
  void onFormatChanged(CalendarFormat onFormatChangedCalendarFormat) {
    _calendarFormat = onFormatChangedCalendarFormat;

    // Update calendar format to user settings.
    _settingsRepository
        .put(key: 'calendarFormat', value: onFormatChangedCalendarFormat.name)
        .then(
          (value) => update(),
        );
  }

  // Return the events for a given day.
  List<FeelingModel> eventLoader(DateTime day) {
    DateTime dayKey = DateTime(day.year, day.month, day.day);

    return _events[dayKey] ?? [];
  }

  // The widget displayed for the marker.
  Widget markerBuilder(
      BuildContext buildContext, DateTime day, List<Object?> events) {
    if (events.isEmpty) {
      return SizedBox.shrink();
    }

    Color? markerColor;

    switch (events.length) {
      case 1:
        _calendarMarkerStatus = CalendarMarkerStatus.incomplete;
        markerColor = Colors.red;
        break;
      case 2:
      default:
        _calendarMarkerStatus = CalendarMarkerStatus.complete;
        markerColor = Colors.green;
        break;
    }

    return Center(
      child: Stack(
        children: [
          Container(height: 50, width: 50),
          Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
              backgroundColor: markerColor,
              child: Text(
                '${events.length}/2',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),
              radius: 10,
            ),
          )
        ],
      ),
    );
  }
}
