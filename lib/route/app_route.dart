import 'package:flutter/material.dart';
import 'package:partner_app/page/home/home_partner.dart';
import 'package:partner_app/page/sign_in/partner_sign_in_page.dart';
import 'package:partner_app/page/sign_up/partner_sign_up_page.dart';
import 'package:partner_app/page/splash/splash_page.dart';

class RouteGenerate {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case (AppRouteUser.splash):
        return MaterialPageRoute(builder: (context) => const Splash());

      ///////////// PARTNER
      case (AppRouteUser.homePartner):
        return MaterialPageRoute(builder: ((context) => const HomePartner()));
      case (AppRouteUser.signInPartner):
        return MaterialPageRoute(
            builder: ((context) => const PartnerSignInPage()));
      case (AppRouteUser.signUpPartner):
        return MaterialPageRoute(
            builder: ((context) => const PartnerSignUpPage()));
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
  static const String homePartner = "home_partner";
  static const String signInPartner = "sign_in_partner";
  static const String signUpPartner = "sign_up_partner";
  //
}
