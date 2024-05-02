import 'package:partner_app/components/back_ground.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SettingPartnerPage extends StatefulWidget {
  const SettingPartnerPage({super.key});

  @override
  State<SettingPartnerPage> createState() => _SettingPartnerPageState();
}

class _SettingPartnerPageState extends State<SettingPartnerPage> {
  List<int> listCalendar = [];

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
                  Container(
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
                  const Text(
                    'Cài đặt',
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
              SizedBox(
                height: 16,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Thông báo',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF4151b1),
                              ),
                            ),
                            const Text(
                              'Nhận thông báo công việc',
                              style: TextStyle(),
                            ),
                            const Text(
                              'Lịch rảnh',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF4151b1),
                              ),
                            ),
                            buildPickTime(context,
                                date: "T2", value: [3, 4, 5]),
                            buildPickTime(context,
                                date: "T3", value: [6, 7, 8]),
                            buildPickTime(context,
                                date: "T4", value: [9, 10, 11]),
                            buildPickTime(context,
                                date: "T5", value: [12, 13, 14]),
                            buildPickTime(context,
                                date: "T6", value: [15, 16, 17]),
                            buildPickTime(context,
                                date: "T7", value: [18, 19, 20]),
                            buildPickTime(context,
                                date: "CN", value: [0, 1, 2]),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                                'Bạn chỉ được cập nhật 1 lầm (nếu muốn thay đổi hãy liên hệ với Công ty)'),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 60,
                                  height: 24,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF4151b1),
                                      borderRadius: BorderRadius.circular(16)),
                                ),
                                const Text('Thời gian  rãnh')
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 60,
                                  height: 24,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(16)),
                                ),
                                const Text('Thời gian bận ')
                              ],
                            ),
                            SizedBox(
                              height: 24,
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
        ),
      )),
    );
  }

  Widget buildPickTime(BuildContext context,
      {required String date, required List<int> value}) {
    List<int> listDefault = [];
    for (var element in value) {
      print(element);
      print(listCalendar.indexOf(element));
      if (listCalendar.contains(element)) {
        listDefault.add(element);
      }
    }
    print(listDefault);
    return IntrinsicHeight(
      child: Row(
        children: [
          SizedBox(
              width: 25,
              child: Text(
                date,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4151b1),
                ),
              )),
          VerticalDivider(
            width: 1,
            color: Colors.grey.shade300,
          ),
          Expanded(
            child: CustomCheckBoxGroup(
              elevation: 0,
              absoluteZeroSpacing: false,
              enableShape: true,
              selectedBorderColor: Colors.transparent,
              unSelectedBorderColor: Colors.transparent,
              unSelectedColor: Colors.grey.shade300,
              shapeRadius: 12,
              radius: 20,
              selectedColor: const Color(0xFF4151b1),
              autoWidth: true,
              buttonLables: const [
                'Sáng',
                'Chiều',
                'Tối',
              ],
              defaultSelected: listDefault,
              buttonValuesList: value,
              buttonTextStyle: const ButtonTextStyle(
                  selectedColor: Colors.white,
                  unSelectedColor: Colors.black,
                  textStyle: TextStyle(fontSize: 16)),
              checkBoxButtonValues: (values) {
                List<int> listCheck = [];
                listCheck.addAll(listCalendar);
                if (listCalendar.isEmpty) {
                  listCalendar.addAll(values);
                } else {
                  for (var item in value) {
                    if (!values.contains(item)) {
                      listCalendar.remove(item);
                    }
                  }
                  for (var item in values) {
                    if (!listCalendar.contains(item)) {
                      listCalendar.add(item);
                    }
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
