import 'package:partner_app/components/back_ground.dart';
import 'package:flutter/material.dart';

class IncomeHistoryPartnerPage extends StatefulWidget {
  const IncomeHistoryPartnerPage({super.key});

  @override
  State<IncomeHistoryPartnerPage> createState() =>
      _IncomeHistoryPartnerPageState();
}

class _IncomeHistoryPartnerPageState extends State<IncomeHistoryPartnerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGround(
          child: SafeArea(
              child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12)),
                    child: const Icon(
                      Icons.navigate_before,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                const Text(
                  'Lịch sử thu nhập',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      // color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12)),
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              width: MediaQuery.sizeOf(context).width,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                    color: Colors.grey, blurRadius: 2, offset: Offset(0, 2))
              ], color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Thu nhập',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4151b1),
                    ),
                  ),
                  Row(
                    children: [
                      Text('Tổng thu nhập'),
                      Spacer(),
                      Text('*******'),
                      Icon(Icons.remove_red_eye_outlined)
                    ],
                  ),
                  Row(
                    children: [
                      Text('Thu nhập tháng này'),
                      Spacer(),
                      Text('0VND'),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              width: MediaQuery.sizeOf(context).width,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                    color: Colors.grey, blurRadius: 2, offset: Offset(0, 2))
              ], color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Lịch sử công việc',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4151b1),
                    ),
                  ),
                  Row(
                    children: [
                      const Text('Tháng'),
                      const Spacer(),
                      SizedBox(
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white,
                            surfaceTintColor: Colors.transparent,
                            elevation: 0,
                            splashFactory: NoSplash.splashFactory,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Tháng 3',
                                style: TextStyle(),
                              ),
                              Icon(
                                Icons.arrow_drop_down_rounded,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Row(
                    children: [
                      Text('Tổng thu nhập tháng 3'),
                      Spacer(),
                      Text('0VND'),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ))),
    );
  }
}
