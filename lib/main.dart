import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:partner_app/constant/constant.dart';
import 'package:partner_app/cubit/clean_detail/clean_detail_state.dart';
import 'package:partner_app/cubit/edit_profile/edit_profile_cubit.dart';
import 'package:partner_app/cubit/home/home_page/home_page_cubit.dart';
import 'package:partner_app/cubit/profile/profile_cubit.dart';
import 'package:partner_app/cubit/setting/setting_cubit.dart';
import 'package:partner_app/cubit/sign_in/sign_in_cubit.dart';
import 'package:partner_app/cubit/splash/splash_cubit.dart';
import 'package:partner_app/cubit/task_detail/task_detail_cubit.dart';
import 'package:partner_app/data/fcm_api.dart';
import 'package:partner_app/data/hive_service.dart';
import 'package:partner_app/firebase_options.dart';
import 'package:partner_app/route/app_route.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint('background remoteMessage ----> ${message.notification?.toMap()}');
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description:
      'This channel is used for important notifications.', // description
  importance: Importance.max,
);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(PersonAdapter());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true, // Required to display a heads up notification
    badge: true,
    sound: true,
  );

  FirebaseApi().init();
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  initializeDateFormatting().then((_) => runApp(const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashCubit>(create: (context) => SplashCubit()),
        BlocProvider<SignInPartnerCubit>(
            create: (context) => SignInPartnerCubit()),
        BlocProvider<HomePageCubit>(create: (context) => HomePageCubit()),
        BlocProvider<SettingPageCubit>(create: (context) => SettingPageCubit()),
        BlocProvider<ProfilePageCubit>(create: (context) => ProfilePageCubit()),
        BlocProvider<TaskBookingDetailCubit>(
            create: (context) => TaskBookingDetailCubit()),
        BlocProvider<EditProfileCubit>(create: (context) => EditProfileCubit()),
        BlocProvider<CleanDetailCubit>(create: (context) => CleanDetailCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeApp.lightMode,
        initialRoute: AppRouteUser.splash,
        onGenerateRoute: RouteGenerate.generateRoute,
      ),
    );
  }
}
