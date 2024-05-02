import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AppConstant {
  static final oCcy = NumberFormat("#,##0", "vi_VN");
  static dynamic convertDateTime(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  static int totalPriceTaskBooking(
    int hour,
    int combo,
  ) {
    int money = 0;

    if (hour < 7 && hour > 18) {
      switch (hour) {
        case 5:
          money = 835000;
        case 6:
          money = 895000;
        case 7:
          money = 83000;
        case 18:
          money = 84500;
        case 19:
          money = 90000;
        case 20:
          money = 90000;
        case 21:
          money = 90000;

        default:
          money = 1;
      }
    } else {
      money = 77000;
    }

    return money * combo;
  }

  static int totalPriceTaskPermanent(
    int hour,
    int combo,
    int sumListJob,
  ) {
    int money = 0;

    if (combo == 2) {
      switch (combo) {
        case 1:
          money = 77000;
        case 2:
          money = 77250;
        case 3:
          money = 77333;
        case 4:
          money = 77375;
        case 5:
          money = 77300;
        case 6:
          money = 79417;
        default:
          money = 1;
      }
    }
    if (combo == 3) {
      switch (combo) {
        case 1:
          money = 64000;
        case 2:
          money = 64244;
        case 3:
          money = 64325;
        case 4:
          money = 64244;
        case 5:
          money = 64292;
        case 6:
          money = 66355;
        default:
          money = 1;
      }
    }
    if (combo == 4) {
      switch (combo) {
        case 1:
          money = 61000;
        case 2:
          money = 61245;
        case 3:
          money = 61163;
        case 4:
          money = 60090;
        case 5:
          money = 63746;
        case 6:
          money = 63370;
        default:
          money = 1;
      }
    }
    return money * combo * sumListJob;
  }
}

class ThemeApp {
  static ThemeData lightMode = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
    fontFamily: GoogleFonts.truculenta().fontFamily,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
    ),
    useMaterial3: true,
  );
}

class UrlApiAppUser {
  // static const String host = "https://apitasks.pdteam.net/";
  static const String host = "http://192.168.1.27:3011/";
  static const signIn = "${host}users/login";
  static const signUp = "${host}users/signup_with_phone";
  //
  static const getWaitingJob = "${host}users/partner_waiting_task";
  static const getDoneJob = "${host}users/get_done_job";
}
