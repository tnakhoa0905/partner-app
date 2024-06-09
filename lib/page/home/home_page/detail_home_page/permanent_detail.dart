import 'package:flutter/material.dart';
import 'package:partner_app/constant/constant.dart';
import 'package:partner_app/data/model/permanent_model.dart';

class PermanentDetailHistoryPage extends StatefulWidget {
  const PermanentDetailHistoryPage({
    super.key,
    required this.permanentModel,
  });
  final PermanentModel permanentModel;
  @override
  State<PermanentDetailHistoryPage> createState() =>
      _PermanentDetailHistoryPageState();
}

class _PermanentDetailHistoryPageState
    extends State<PermanentDetailHistoryPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              offset: const Offset(0, 2.0),
              blurRadius: 4.0,
            )
          ]),
          child: AppBar(
            foregroundColor: Colors.black,
            title: const Text('Chi tiết công việc',
                style: TextStyle(fontWeight: FontWeight.bold)),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
            backgroundColor: Colors.white,
            scrolledUnderElevation: 0.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Công ty:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage:
                                AssetImage("assets/icons/logo_company.jpeg"),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text('Công ty A')
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      if (widget.permanentModel.taskerId != null)
                        const Text(
                          'Nhân viên:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      const SizedBox(
                        height: 8,
                      ),
                      if (widget.permanentModel.taskerId != null)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                    widget.permanentModel.taskerId!.avatar!)),
                            const SizedBox(
                              width: 16,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.permanentModel.taskerId!.fullName!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                const Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Color(0xfff6852c),
                                    ),
                                    Text('4.8')
                                  ],
                                ),
                                const Row(
                                  children: [
                                    Text(
                                      "Xem thêm",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Icon(
                                      Icons.navigate_next,
                                      color: Colors.green,
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      if (widget.permanentModel.taskerId != null)
                        const SizedBox(
                          height: 16,
                        ),
                      if (widget.permanentModel.taskerId != null)
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: const Color(0xfff6852c),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: const Icon(
                                      Icons.phone_in_talk_outlined,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text(
                                    'Gọi',
                                    style: TextStyle(
                                      color: Color(0xfff6852c),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: const Color(0xfff6852c),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: const Icon(
                                      Icons.messenger_outline_rounded,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text(
                                    'Nhắn tin',
                                    style: TextStyle(
                                      color: Color(0xfff6852c),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: const Color(0xfff6852c),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: const Icon(
                                      Icons.perm_contact_calendar_rounded,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text(
                                    'Xác minh',
                                    style: TextStyle(
                                      color: Color(0xfff6852c),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.place_outlined,
                                  color: Color(0xfff6852c),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        '85 An Dương Vương',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                          '${widget.permanentModel.taskId!.address}'),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.message_rounded,
                                  color: Color(0xfff6852c),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                    child: Text(
                                        widget.permanentModel.taskId!.note == ''
                                            ? 'Không có ghi chú nào'
                                            : widget
                                                .permanentModel.taskId!.note!))
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.check_circle_outline,
                                  color: Color(0xfff6852c),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                    child: Text(
                                  '${(widget.permanentModel.taskId!.estimateTime! / 60).round()} giờ, ${(widget.permanentModel.time! / 60).round()}:00 đến ${(widget.permanentModel.time! / 60).round() + (widget.permanentModel.taskId!.estimateTime! / 60).round()}:00',
                                ))
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Row(
                              children: [
                                Icon(
                                  Icons.person_outline,
                                  color: Color(0xfff6852c),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                    child:
                                        Text('(+84) 0966626550 | Khoa Truong'))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Chi tiết công việc',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Thời lượng',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey)),
                          Text(
                              '${(widget.permanentModel.taskId!.estimateTime! / 60).round()} giờ, ${(widget.permanentModel.time! / 60).round()}:00 đến ${(widget.permanentModel.time! / 60).round() + (widget.permanentModel.taskId!.estimateTime! / 60).round()}:00',
                              style: const TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text("Phương thức thanh toán",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Chi tiết thanh toán',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Tổng cộng',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                          Text(
                              '${AppConstant.oCcy.format(widget.permanentModel.price)} VND',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      overlayColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Hỗ trợ trực tuyến',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                const SizedBox(
                  height: 8,
                ),
              ],
            )),
      ),
    );
  }
}
