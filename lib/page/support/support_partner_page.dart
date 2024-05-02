import 'package:partner_app/components/back_ground.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SupportPartnerPage extends StatefulWidget {
  const SupportPartnerPage({super.key});

  @override
  State<SupportPartnerPage> createState() => _SupportPartnerPageState();
}

class _SupportPartnerPageState extends State<SupportPartnerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGround(
          child: SafeArea(
              child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
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
                  'Hỗ trợ',
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
                      height: 24,
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
                          const Icon(
                            Icons.contact_support_outlined,
                            size: 100,
                            color: Colors.blue,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Text(
                            "Hỗ trợ công việc hằng ngày",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4151b1),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Row(
                            children: [
                              Text(
                                'Thứ 2 - Thứ 7',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Giờ hành chính'),
                                  Text('8:30 - 12:00'),
                                  Text('13:30 - 18:00')
                                ],
                              )),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Ngoài giờ'),
                                  Text('6:30 - 8:30'),
                                  Text('12:00 - 13:30'),
                                  Text('18:00 - 22:30')
                                ],
                              ))
                            ],
                          ),
                          const Row(
                            children: [
                              Text("Chủ nhật",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                          const Row(
                            children: [
                              Text("08:00 - 18:00"),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                            height: 50,
                            width: MediaQuery.sizeOf(context).width,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.redAccent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                child: const Text(
                                  'Gọi tổng đài',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                )),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(bottom: 16),
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
                          const Icon(
                            Icons.contact_support_outlined,
                            size: 100,
                            color: Colors.blue,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Text(
                            "Hỗ trợ vấn đề về nhân sự (mở, khoá tài khoản, xin tạm nghỉ,...)",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4151b1),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Row(
                            children: [
                              Text(
                                'Thứ 2 - Thứ 7',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Giờ hành chính'),
                                  Text('8:30 - 12:00'),
                                  Text('13:30 - 18:00')
                                ],
                              )),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Ngoài giờ'),
                                  Text('6:30 - 8:30'),
                                  Text('12:00 - 13:30'),
                                  Text('18:00 - 22:30')
                                ],
                              ))
                            ],
                          ),
                          const Row(
                            children: [
                              Text("Chủ nhật",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                          const Row(
                            children: [
                              Text("08:00 - 18:00"),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                            height: 50,
                            width: MediaQuery.sizeOf(context).width,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.redAccent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                child: const Text(
                                  'Gọi tổng đài',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                )),
                          ),
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
