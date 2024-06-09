import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:partner_app/constant/constant.dart';
import 'package:partner_app/cubit/home/history_detail/task_booking/task_booking_history_cubit.dart';
import 'package:partner_app/cubit/home/history_detail/task_booking/task_booking_history_detail.dart';
import 'package:partner_app/cubit/home/home_page/home_page_cubit.dart';
import 'package:partner_app/data/model/task_booking_model.dart';

class TaskBookingDetailHistoryPage extends StatefulWidget {
  const TaskBookingDetailHistoryPage(
      {super.key, required this.taskBookingModel});
  final TaskBookingModel taskBookingModel;

  @override
  State<TaskBookingDetailHistoryPage> createState() =>
      _TaskBookingDetailHistoryPageState();
}

class _TaskBookingDetailHistoryPageState
    extends State<TaskBookingDetailHistoryPage> {
  late TaskBookingHistoryCubit taskBookingHistoryCubit;
  late HomePageCubit homeCubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<TaskBookingHistoryCubit>(context)
        .init(context, widget.taskBookingModel);
    print(widget.taskBookingModel.id);
    taskBookingHistoryCubit = BlocProvider.of<TaskBookingHistoryCubit>(context);
    homeCubit = BlocProvider.of<HomePageCubit>(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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
                      if (widget.taskBookingModel.taskerId != null)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Nhân viên:',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage(
                                        '${UrlApiAppUser.host}${widget.taskBookingModel.taskerId!.avatar}')),
                                const SizedBox(
                                  width: 16,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget
                                          .taskBookingModel.taskerId!.fullName!,
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
                            const SizedBox(
                              height: 16,
                            ),
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
                                          '${widget.taskBookingModel.taskId!.address}'),
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
                                    child: Text(widget.taskBookingModel.taskId!
                                                .note ==
                                            ''
                                        ? 'Không có ghi chú nào'
                                        : '${widget.taskBookingModel.taskId!.note}'))
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
                                  '${(widget.taskBookingModel.taskId!.estimateTime! / 60).round()} giờ, ${(widget.taskBookingModel.time! / 60).round()}:00 đến ${(widget.taskBookingModel.time! / 60).round() + (widget.taskBookingModel.taskId!.estimateTime! / 60).round()}:00',
                                ))
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.calendar_month,
                                  color: Color(0xfff6852c),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                    child: Text(
                                        ' ${DateFormat('dd-MM-yyyy').format(widget.taskBookingModel.date!)}')),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.person_outline,
                                  color: Color(0xfff6852c),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                    child: Text(
                                        '${homeCubit.usermodel!.phoneNumber!} | ${homeCubit.usermodel!.fullName!}'))
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
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey)),
                          Text(
                              '${(widget.taskBookingModel.taskId!.estimateTime! / 60).round()} giờ, ${(widget.taskBookingModel.time! / 60).round()}:00 đến ${(widget.taskBookingModel.time! / 60).round() + (widget.taskBookingModel.taskId!.estimateTime! / 60).round()}:00',
                              style: const TextStyle(color: Colors.grey)),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      BlocConsumer<TaskBookingHistoryCubit,
                          TaskBookingHistoryState>(
                        bloc: taskBookingHistoryCubit,
                        listener: (context, state) {},
                        builder: (context, state) {
                          if (state is TaskBookingHistoryLoaded) {
                            if (taskBookingHistoryCubit.rating != null) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Đánh giá',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey)),
                                  RatingBarIndicator(
                                    rating: taskBookingHistoryCubit
                                        .rating!.taskBookingRating!
                                        .toDouble(),
                                    itemBuilder: (context, index) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    itemCount: 5,
                                    itemSize: 24.0,
                                    direction: Axis.horizontal,
                                  ),
                                ],
                              );
                            }
                          }
                          return const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Đánh giá',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey)),
                              Text('Bạn chưa có đánh giá',
                                  style: TextStyle(
                                      fontSize: 14,
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.grey)),
                            ],
                          );
                        },
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
                              '${AppConstant.oCcy.format(widget.taskBookingModel.price!)} VND',
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
              ],
            )),
      ),
    );
  }

  // show the dialog
}
