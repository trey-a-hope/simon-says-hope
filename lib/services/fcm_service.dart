import 'dart:async';
import 'dart:convert' show json;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:simon_says_hope/constants/globals.dart';

class FCMService extends GetxService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final String _endpoint = 'https://fcm.googleapis.com/fcm/send';
  final String _contentType = 'application/json';
  final String _authorization = 'key=${Globals.CLOUD_MESSAGING_SERVER_KEY}';

  Future<http.Response> _sendNotification(
    String to,
    String title,
    String body, [
    NotificationData? notificationData,
  ]) async {
    try {
      String message = '';
      String userID = '';
      String type = '';

      if (notificationData != null) {
        message = notificationData.message;
        userID = notificationData.userID;
        type = notificationData.type;
      }

      final dynamic data = json.encode(
        {
          'to': to,
          'priority': 'high',
          'notification': {
            'title': title,
            'body': body,
          },
          'data': {
            'message': message,
            'userID': userID,
            'type': type,
          },
          'content_available': true
        },
      );
      http.Response response = await http.post(
        Uri.parse(_endpoint),
        body: data,
        headers: {
          'Content-Type': _contentType,
          'Authorization': _authorization
        },
      );

      return response;
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<void> unsubscribeFromTopic({required String topic}) {
    return _firebaseMessaging.subscribeToTopic(topic);
  }

  Future<void> subscribeToTopic({required String topic}) {
    return _firebaseMessaging.subscribeToTopic(topic);
  }

  Future<void> sendNotificationToUser({
    required String fcmToken,
    required String title,
    required String body,
    NotificationData? notificationData,
  }) {
    return _sendNotification(fcmToken, title, body, notificationData);
  }

  Future<void> sendNotificationToGroup(
      {required String group, required String title, required String body}) {
    return _sendNotification('/topics/' + group, title, body);
  }
}

//Simple class to hold the message for a notification and the user ID from the sender.
class NotificationData {
  final String message;
  final String userID;
  final String type;

  NotificationData({
    required this.message,
    required this.userID,
    required this.type,
  });
}
