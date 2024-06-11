import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner_app/cubit/home/home_page/home_page_cubit.dart';
import 'package:partner_app/cubit/task_detail/task_detail_cubit.dart';
import 'package:partner_app/route/app_route.dart';

class PaymentSuccessPage extends StatefulWidget {
  const PaymentSuccessPage({super.key});

  @override
  State<PaymentSuccessPage> createState() => _PaymentSuccessPageState();
}

class _PaymentSuccessPageState extends State<PaymentSuccessPage> {
  late HomePageCubit homePageCubit;
  late TaskBookingDetailCubit taskBookingDetailCubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homePageCubit = BlocProvider.of<HomePageCubit>(context);
    taskBookingDetailCubit = BlocProvider.of<TaskBookingDetailCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_outline,
              size: 100,
              color: Colors.green,
            ),
            const Text(
              'Thanh toán thành công!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 30,
              width: MediaQuery.sizeOf(context).width * 0.7,
              child: ElevatedButton(
                  onPressed: () {
                    // homePageCubit.socket.emit('partner_done_task', {
                    //   "userId": taskBookingDetailCubit.taskBookingModel!.userId,
                    //   "note": "Taker donetask",
                    //   "data": {
                    //     "type": "taskBooking",
                    //     "_id": taskBookingDetailCubit.taskBookingModel!.id
                    //   }
                    // });
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRouteUser.homePartner,
                      (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    surfaceTintColor: Colors.transparent,
                    elevation: 0,
                    // splashFactory: NoSplash.splashFactory,
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'Quay lại trang chủ',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
            ),
          ],
        ),
      )),
    );
  }
}
