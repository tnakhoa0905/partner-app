import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;

final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> _handleBackgroundMessage(RemoteMessage remoteMessage) async {
  debugPrint(
      'background remoteMessage ----> ${remoteMessage.notification?.toMap()}');
}

class NotificationsServices {
  /// initialize notification services
  Future<void> initialize({
    required void Function(String? deviceToken) onDeviceTokenChanged,
    required void Function(Map<String, dynamic> payload) onMessageOpenedApp,
    required void Function(Map<String, dynamic> payload) onMessage,
  }) async {
    var settings = await FirebaseMessaging.instance.requestPermission();
    debugPrint('User granted permission: ${settings.authorizationStatus}');

    /// get deviceToken
    String? deviceToken = await FirebaseMessaging.instance.getToken();
    onDeviceTokenChanged(deviceToken);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    const androidNotificationChannel = AndroidNotificationChannel(
      'partnerId',
      'PartnerApp',
      importance: Importance.max,
    );

    if (Platform.isAndroid) {
      await _initFlutterLocalNotificationsPlugin(
        androidNotificationChannel,
        onMessageOpenedApp,
      );
    }

    /// listen pushToken refreshed
    FirebaseMessaging.instance.onTokenRefresh.listen((newDeviceToken) {
      onDeviceTokenChanged(newDeviceToken);
    });

    /// listen notification message (foreground)
    FirebaseMessaging.onMessage.listen((remoteMessage) {
      if (remoteMessage.notification != null &&
          remoteMessage.notification?.android != null) {
        onMessage(remoteMessage.data ?? {});
        _showAndroidNotification(remoteMessage, androidNotificationChannel);
      }
    });

    /// listen background notification
    FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);

    final remoteMessage = await FirebaseMessaging.instance.getInitialMessage();

    if (remoteMessage != null) {
      onMessageOpenedApp(remoteMessage.data ?? {});
    }

    /// listen message opened app (when a user presses a notification message)
    FirebaseMessaging.onMessageOpenedApp.listen(
      (remoteMessage) => onMessageOpenedApp(remoteMessage.data ?? {}),
    );
  }

  Future<void> _showAndroidNotification(
      RemoteMessage remoteMessage, AndroidNotificationChannel channel) async {
    Map<String, dynamic> payload = remoteMessage.data ?? {};

    BigPictureStyleInformation? bigPictureStyleInformation;
    if (payload['android']?['imageUrl'] != null) {
      final http.Response response =
          await http.get(Uri.parse(payload['android']!['imageUrl']));
      bigPictureStyleInformation = BigPictureStyleInformation(
          ByteArrayAndroidBitmap.fromBase64String(
              base64Encode(response.bodyBytes)));
    }

    await flutterLocalNotificationsPlugin.show(
      remoteMessage.notification.hashCode,
      remoteMessage.notification!.title,
      remoteMessage.notification!.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          icon: '@mipmap/ic_launcher',
          importance: Importance.max,
          color: Colors.blue,
          priority: Priority.high,
          // styleInformation: bigPictureStyleInformation,
        ),
      ),
      payload: jsonEncode(payload),
    );
  }

  Future<void> _initFlutterLocalNotificationsPlugin(
      AndroidNotificationChannel androidNotificationChannel,
      void Function(Map<String, dynamic> payload) onMessageOpenedApp) async {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidNotificationChannel);
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) =>
          onMessageOpenedApp(jsonDecode(details.payload ?? '{}')),
    );
  }
}
