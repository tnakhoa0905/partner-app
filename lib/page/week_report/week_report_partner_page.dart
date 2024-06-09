import 'package:partner_app/components/back_ground.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class WeekReportPartnerPage extends StatefulWidget {
  const WeekReportPartnerPage({super.key});

  @override
  State<WeekReportPartnerPage> createState() => _WeekReportPartnerPageState();
}

class _WeekReportPartnerPageState extends State<WeekReportPartnerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGround(
          child: SafeArea(
              child: Padding(
        padding: const EdgeInsets.all(16),
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
                  'Bao cao tuan',
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 2,
                                offset: Offset(0, 2))
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        children: [
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
                                    '11/03/2024 - 17/03/2024',
                                    style: TextStyle(),
                                  ),
                                  Icon(Icons.arrow_drop_down_rounded)
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Divider(
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    const Text('Công việc hoàn thành'),
                                    Container(
                                      width: MediaQuery.sizeOf(context).width,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: const Color(0xFF4151b1)
                                              .withOpacity(0.4),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: const Center(
                                        child: Text(
                                          '0',
                                          style: TextStyle(
                                              color: Color(0xFF4151b1),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    const Text('Thu nhập tuần này'),
                                    Container(
                                      width: MediaQuery.sizeOf(context).width,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color:
                                              Colors.redAccent.withOpacity(0.4),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: const Center(
                                        child: Text(
                                          '0',
                                          style: TextStyle(
                                              color: Colors.redAccent,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Divider(
                            endIndent: 64,
                            indent: 64,
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text('0/5'),
                                    Divider(
                                      indent: 90,
                                      color: Colors.grey.shade300,
                                    ),
                                    RatingBarIndicator(
                                      rating: 2.75,
                                      itemBuilder: (context, index) =>
                                          const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      itemCount: 5,
                                      itemSize: 24.0,
                                      direction: Axis.horizontal,
                                    ),
                                    const Text('0 Đánh giá'),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                flex: 6,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Expanded(
                                            flex: 1,
                                            child: Text(
                                              '1',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        const Expanded(
                                          flex: 1,
                                          child: Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 7,
                                          child: LinearPercentIndicator(
                                            animation: true,
                                            lineHeight: 10.0,
                                            animationDuration: 2500,
                                            percent: 0.8,
                                            progressColor: Colors.amber,
                                            barRadius:
                                                const Radius.circular(12),
                                            trailing: const Text('0%'),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Expanded(
                                            flex: 1,
                                            child: Text(
                                              '2',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        const Expanded(
                                          flex: 1,
                                          child: Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 7,
                                          child: LinearPercentIndicator(
                                            animation: true,
                                            lineHeight: 10.0,
                                            animationDuration: 2500,
                                            percent: 0.8,
                                            progressColor: Colors.amber,
                                            barRadius:
                                                const Radius.circular(12),
                                            trailing: const Text('0%'),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Expanded(
                                            flex: 1,
                                            child: Text(
                                              '3',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        const Expanded(
                                          flex: 1,
                                          child: Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 7,
                                          child: LinearPercentIndicator(
                                            animation: true,
                                            lineHeight: 10.0,
                                            animationDuration: 2500,
                                            percent: 0.8,
                                            progressColor: Colors.amber,
                                            barRadius:
                                                const Radius.circular(12),
                                            trailing: const Text('0%'),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Expanded(
                                            flex: 1,
                                            child: Text(
                                              '4',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        const Expanded(
                                          flex: 1,
                                          child: Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 7,
                                          child: LinearPercentIndicator(
                                            animation: true,
                                            lineHeight: 10.0,
                                            animationDuration: 2500,
                                            percent: 0.8,
                                            progressColor: Colors.amber,
                                            barRadius:
                                                const Radius.circular(12),
                                            trailing: const Text('0%'),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Expanded(
                                            flex: 1,
                                            child: Text(
                                              '5',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        const Expanded(
                                          flex: 1,
                                          child: Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 7,
                                          child: LinearPercentIndicator(
                                            animation: true,
                                            lineHeight: 10.0,
                                            animationDuration: 2500,
                                            percent: 0.8,
                                            progressColor: Colors.amber,
                                            barRadius:
                                                const Radius.circular(12),
                                            trailing: const Text('0%'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          color: Colors.grey.shade300)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text('Tốt'),
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '5',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                          width: 60,
                                          child: Divider(
                                            color: Colors.grey.shade300,
                                          )),
                                      const Text('0'),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          color: Colors.grey.shade300)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text('Tốt'),
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '5',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                          width: 60,
                                          child: Divider(
                                            color: Colors.grey.shade300,
                                          )),
                                      const Text('0'),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ))),
    );
  }
}
