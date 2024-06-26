import 'package:flutter/material.dart';
import 'package:partner_app/data/model/clean_task_model.dart';
import 'package:partner_app/data/model/task_booking_model.dart';
import 'package:partner_app/page/edit_profile/edit_profile_page.dart';
import 'package:partner_app/page/finance/banking_info/banking_info_page.dart';
import 'package:partner_app/page/finance/deposit/deposit_page.dart';
import 'package:partner_app/page/finance/finance_partner_page.dart';
import 'package:partner_app/page/home/home_page/detail_home_page/clean_detail.dart';
import 'package:partner_app/page/home/home_page/detail_home_page/task_detail_page.dart';
import 'package:partner_app/page/home/home_partner.dart';
import 'package:partner_app/page/income_history/income_history_partner_page.dart';
import 'package:partner_app/page/payment/cancel_payment_deposit_page.dart';
import 'package:partner_app/page/payment/cancel_payment_page.dart';
import 'package:partner_app/page/payment/payment_page.dart';
import 'package:partner_app/page/payment/payment_success_deposit_page.dart';
import 'package:partner_app/page/payment/payment_success_page.dart';
import 'package:partner_app/page/reset_pass/change_password/change_password.dart';
import 'package:partner_app/page/reset_pass/reset_password_page.dart';
import 'package:partner_app/page/reset_pass/verify_otp/verify_otp_page.dart';
import 'package:partner_app/page/setting/setting_new_parner_page.dart';
import 'package:partner_app/page/setting/setting_partner_page.dart';
import 'package:partner_app/page/sign_in/partner_sign_in_page.dart';
import 'package:partner_app/page/sign_up/partner_sign_up_page.dart';
import 'package:partner_app/page/splash/splash_page.dart';
import 'package:partner_app/page/support/support_partner_page.dart';
import 'package:partner_app/page/task_detail/clean_detail/clean_detail.dart';
import 'package:partner_app/page/task_detail/task_booking_detail/task_detail_page.dart';
import 'package:partner_app/page/week_report/week_report_partner_page.dart';
import 'package:partner_app/page/finance/withdrawals/withdrawals_page.dart';

class RouteGenerate {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case (AppRouteUser.splash):
        return MaterialPageRoute(builder: (context) => const Splash());

      ///////////// PARTNER
      case (AppRouteUser.homePartner):
        return MaterialPageRoute(builder: ((context) => HomePartner()));
      case (AppRouteUser.signInPartner):
        return MaterialPageRoute(
            builder: ((context) => const PartnerSignInPage()));
      case (AppRouteUser.signUpPartner):
        return MaterialPageRoute(
            builder: ((context) => const PartnerSignUpPage()));
      case (AppRouteUser.cleanDetail):
        {
          return MaterialPageRoute(
              builder: (context) => CleanDetailPage(id: args as String));
        }
      case (AppRouteUser.taskBookingDetail):
        {
          print(args);
          // TaskBookingModel taskBookingModel = args as TaskBookingModel;
          String taskId = args as String;
          return MaterialPageRoute(
              builder: (context) => TaskBookingDetailPage(
                    taskId: taskId,
                  ));
        }
      case (AppRouteUser.cleanHistoryDetail):
        return MaterialPageRoute(
            builder: ((context) =>
                CleanDetailHistoryPage(cleanModel: args as CleanModel)));
      case (AppRouteUser.taskBookingHistoryDetail):
        return MaterialPageRoute(
            builder: ((context) => TaskBookingDetailHistoryPage(
                taskBookingModel: args as TaskBookingModel)));
      case (AppRouteUser.finance):
        return MaterialPageRoute(
            builder: ((context) => const FinancePartnerPage()));
      case (AppRouteUser.incomeHistory):
        return MaterialPageRoute(
            builder: ((context) => const IncomeHistoryPartnerPage()));
      // case (AppRouteUser.service):
      //   return MaterialPageRoute(
      //       builder: ((context) => const service()));
      case (AppRouteUser.setting):
        return MaterialPageRoute(
            builder: ((context) => const SettingPartnerPage()));
      case (AppRouteUser.settingNew):
        return MaterialPageRoute(
            builder: ((context) => const SettingNewPartnerPage()));
      case (AppRouteUser.support):
        return MaterialPageRoute(
            builder: ((context) => const SupportPartnerPage()));
      case (AppRouteUser.weekReport):
        return MaterialPageRoute(
            builder: ((context) => const WeekReportPartnerPage()));
      case (AppRouteUser.editProfile):
        return MaterialPageRoute(
            builder: ((context) => const EditProfilePage()));
      case (AppRouteUser.paymentPage):
        return MaterialPageRoute(builder: ((context) => const PaymentPage()));
      case (AppRouteUser.paymentSuccessPage):
        return MaterialPageRoute(
            builder: ((context) => const PaymentSuccessPage()));
      case (AppRouteUser.paymentCancelPage):
        return MaterialPageRoute(
            builder: ((context) => const CancelPaymentPage()));
      case (AppRouteUser.withdrawalsPage):
        return MaterialPageRoute(
            builder: ((context) => const WithdrawalsPage()));
      case (AppRouteUser.bankingInfoPage):
        return MaterialPageRoute(
            builder: ((context) => const BankingInfoPage()));
      case (AppRouteUser.depositPage):
        return MaterialPageRoute(builder: ((context) => const DepositPage()));
      case (AppRouteUser.depositSuccess):
        return MaterialPageRoute(
            builder: ((context) => const PaymentSuccessDepositPage()));
      case (AppRouteUser.depositCancel):
        return MaterialPageRoute(
            builder: ((context) => const CancelPaymentDepositPage()));
      case (AppRouteUser.resetPasswordPage):
        return MaterialPageRoute(
            builder: ((context) => const ResetPasswordPage()));
      case (AppRouteUser.veryfiOtpPage):
        {
          String verify = args as String;
          return MaterialPageRoute(
              builder: ((context) => VerifyOtpPage(
                    verificationId: verify,
                  )));
        }

      case (AppRouteUser.changePasswordPage):
        return MaterialPageRoute(
            builder: ((context) => const ChangePasswordPage()));
      default:
        return errorRoute();
    }
  }

  static Route<dynamic> errorRoute() {
    return MaterialPageRoute(
        builder: (context) => Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(context,
                          AppRouteUser.splash, (Route<dynamic> route) => false);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Quay lại trang chủ"),
                    )),
              ),
            ));
  }
}

class AppRouteUser {
  static const String splash = "/splash";

  // PARTNER
  static const String homePartner = "/home_partner";
  static const String signInPartner = "/sign_in_partner";
  static const String signUpPartner = "/sign_up_partner";
  static const String editProfile = "/edit_profile";
  static const String cleanDetail = "/clean_detail";
  static const String taskBookingDetail = "/task_booking_detail";
  //
  static const String finance = "/finance_page";
  static const String incomeHistory = "/income_history";
  static const String service = "/service";

  static const String setting = "/setting";
  static const String settingNew = "/setting_new";
  static const String support = "/support";
  static const String weekReport = "/week_report";

  //payment
  static const String paymentPage = "/payment";
  static const String paymentSuccessPage = "/payment_success";
  static const String paymentCancelPage = "/payment_cancel";
  static const String depositCancel = "/deposit_cancel";
  static const String depositSuccess = "/deposit_success";
  //profile
  static const String withdrawalsPage = "/withdrawals_page";
  static const String depositPage = "/deposit_page";
  static const String bankingInfoPage = "/banking_info_page";

  //history
  static const String taskBookingHistoryDetail = "/task_booking_history_detail";
  static const String cleanHistoryDetail = "/clean_history_detail";
  static const String permanentHistoryDetail = "/permanent_history_detail";

  //reset password
  static const String resetPasswordPage = "/reset_password";
  static const String veryfiOtpPage = "/veryfi_otp";
  static const String changePasswordPage = "/change_password";
}
