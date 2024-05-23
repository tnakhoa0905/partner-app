import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner_app/cubit/home/home_page/home_page_cubit.dart';
import 'package:partner_app/data/notifications_services.dart';
import 'package:partner_app/page/home/home_page/home_partner_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:partner_app/page/home/message/message_partner_page.dart';
import 'package:partner_app/page/home/profile/profile_partner_page.dart';
import 'package:partner_app/page/home/welfare/welfare_partner_page.dart';
import 'package:partner_app/route/app_route.dart';

class HomePartner extends StatefulWidget {
  const HomePartner({super.key});

  @override
  State<HomePartner> createState() => _HomePartnerPageState();
}

class _HomePartnerPageState extends State<HomePartner> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  List<Widget> pages = [
    const HomePartnerPage(),
    const MessagePartnerPage(),
    const WelfarePartnerPage(),
    const ProfilePartnerPage()
  ];

  int indexPage = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NotificationsServices().initialize(
        onDeviceTokenChanged: (text) {},
        onMessageOpenedApp: ((payload) {
          try {
            print("dcmsaia");
            print("dcmsaia${payload}");
            BlocProvider.of<HomePageCubit>(context).init();
            // Navigator.pop(context);
            Navigator.pushNamed(context, AppRouteUser.taskBookingDetail,
                arguments: payload['_id']);
          } catch (e) {
            Navigator.pushNamed(context, AppRouteUser.homePartner,
                arguments: payload['_id']);
            throw Exception(e);
          }
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: navigatorKey,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          const Color(0xFF4151b1),
                          Colors.grey.shade300,
                        ],
                        begin: const FractionalOffset(1, 0.0),
                        end: const FractionalOffset(1.0, 1.0),
                        stops: const [0.0, 5.0],
                        tileMode: TileMode.clamp),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.grey.shade300,
                ),
              )
            ],
          ),
          pages[indexPage],
        ],
      ),
      extendBody: true,
      bottomNavigationBar: buildBottomNavigationBar(context),
    );
  }

  Widget buildBottomNavigationBar(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey, blurRadius: 10.0, offset: Offset(0.0, 2))
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Container(
                    padding: const EdgeInsets.only(
                      top: 8,
                    ),
                    child: const Icon(Icons.home_outlined)),
                label: 'Trang chủ'),
            BottomNavigationBarItem(
                icon: Container(
                    padding: const EdgeInsets.only(
                      top: 8,
                    ),
                    child: const Icon(Icons.messenger_outline_rounded)),
                label: 'Hộp thư'),
            BottomNavigationBarItem(
                icon: Container(
                    padding: const EdgeInsets.only(
                      top: 8,
                    ),
                    child: const Icon(Icons.clean_hands_outlined)),
                label: 'Phúc lợi'),
            BottomNavigationBarItem(
                icon: Container(
                    padding: const EdgeInsets.only(
                      top: 8,
                    ),
                    child: const Icon(Icons.person_2_outlined)),
                label: 'Tài khoản')
          ],
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xff4251b2),
          unselectedItemColor: const Color(0xff848A94),
          selectedFontSize: 14.0,
          unselectedFontSize: 14.0,
          backgroundColor: Colors.white,
          // elevation: 10,
          // showSelectedLabels: false,
          // showUnselectedLabels: false,
          selectedLabelStyle: const TextStyle(color: Color(0xff4251b2)),
          unselectedLabelStyle: const TextStyle(color: Color(0xff848A94)),
          onTap: (index) {
            setState(() {
              indexPage = index;
            });
          },
          currentIndex: indexPage,
        ),
      ),
    );
  }
}
