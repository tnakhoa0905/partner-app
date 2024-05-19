import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {
  final _firebase = FirebaseMessaging.instance;

  Future<void> init() async {
    await _firebase.requestPermission();
    final fcmToken = await _firebase.getToken();
    print(fcmToken);
    NotificationSettings settings = await _firebase.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    print('User granted permission: ${settings.authorizationStatus}');
  }

  Future<String> getToken() async {
    final fcmToken = await _firebase.getToken();
    return fcmToken!;
    // FirebaseMessaging.instance.subscribeToTopic('');
  }
}
