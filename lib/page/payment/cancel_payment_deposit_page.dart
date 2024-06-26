import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CancelPaymentDepositPage extends StatefulWidget {
  const CancelPaymentDepositPage({super.key});

  @override
  State<CancelPaymentDepositPage> createState() => _CancelPaymentPageState();
}

class _CancelPaymentPageState extends State<CancelPaymentDepositPage> {
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
              color: Colors.redAccent,
            ),
            const Text(
              'Huỷ thành công!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
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
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    surfaceTintColor: Colors.transparent,
                    elevation: 0,
                    // splashFactory: NoSplash.splashFactory,
                    backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'Quay lại',
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
