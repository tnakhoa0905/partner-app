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

  static String getWeekDay(int weekDay) {
    switch (weekDay) {
      case 1:
        return "Thứ Hai";
      case 2:
        return "Thứ Ba";
      case 3:
        return "Thứ Tư";
      case 4:
        return "Thứ Năm";
      case 5:
        return "Thứ Sáu";
      case 6:
        return "Thứ Bảy";
      default:
        return "Chủ Nhật";
    }
    // return "Thứ 2";
  }
}

class ThemeApp {
  static ThemeData lightMode = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
    fontFamily: GoogleFonts.roboto().fontFamily,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
    ),
    useMaterial3: true,
  );
}

class UrlApiAppUser {
  // static const String host = "https://apitasks.pdteam.net/";
  static const String host = "https://apifordev.pdteam.net/";
  // static const String host = "http://192.168.1.27:3011/";
  static const signIn = "${host}users/login";
  static const signUp = "${host}users/partner_signup";
  static const getUser = "${host}users/get_user_profile";
  static const updateProfile = "${host}users/update_profile";
  static const logOut = "${host}users/logout";
  static const updateLocation = "${host}users/update_profile";
  //
  static const getTaskById = "${host}taskbookings/get_taskbooking_by_id";
  static const getWaitingJob = "${host}users/partner_waiting_task";
  static const getDoneJob = "${host}users/partner_done_task";

  static const updateFreeTime = "${host}users/partner_update_freetime";
  static const createPayment = "${host}payments/create_payment_link";
  static const getCleanById = "${host}cleanbookings/get_cleanbooking_by_id";
  static const ratingTaskBooking = "${host}ratings/create_taskbooking_rating";
  static const getRatingTaskBooking =
      "${host}ratings/get_task_booking_by_id_and_user_id";
  //
  static const getRatingClean =
      "${host}ratings/get_clean_booking_by_id_and_user_id";
  static const completedTask = "${host}users/partner_completed_taskbooking";
  static const cancelTask = "${host}users/partner_cancel_task";
  static const completedClean = "${host}users/partner_completed_cleanbooking";
  static const cancelClean = "${host}users/partner_cancel_clean";
  static const getAllWithdrawalas =
      "${host}withdrawals/get_withdrawal_by_userid";
}
