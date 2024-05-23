import 'package:partner_app/data/notifications_services.dart';

class NotificationRepository {
  // final NotificationApi notificationApi;
  final NotificationsServices notificationsServices;

  NotificationRepository(this.notificationsServices);

  /// initializes NotificationsServices
  Future<void> initialize(
      {required void Function(Map<String, dynamic> payload)
          onMessageOpenedApp}) {
    return notificationsServices.initialize(
      onMessageOpenedApp: (payload) => onMessageOpenedApp(payload),
      onDeviceTokenChanged: (deviceToken) async {
        // await AppSharedPreferences.setDeviceToken(deviceToken);
        // pushDeviceToken();
      },
    );
  }

  // /// push current deviceToken to server for automatically pushing notifications
  // Future<void> pushDeviceToken() async {
  //   final deviceToken = await AppSharedPreferences.getDeviceToken();
  //   await notificationApi.pushDeviceToken(deviceToken);
  // }

  // /// delete current device token to avoid receiving notifications
  // Future<void> deleteDeviceToken() {
  //   return notificationApi.deleteDeviceToken();
  // }
}
