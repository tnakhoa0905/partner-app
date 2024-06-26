import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:partner_app/constant/constant.dart';
import 'package:partner_app/cubit/home/home_page/home_page_cubit.dart';
import 'package:partner_app/cubit/task_detail/task_detail_cubit.dart';
import 'package:partner_app/cubit/task_detail/task_detail_state.dart';
// import 'package:partner_app/route/app_route.dart';

class TaskBookingDetailPage extends StatefulWidget {
  const TaskBookingDetailPage({super.key, required this.taskId, this.type});
  final String taskId;
  final String? type;

  @override
  State<TaskBookingDetailPage> createState() => _TaskBookingDetailPageState();
}

class _TaskBookingDetailPageState extends State<TaskBookingDetailPage> {
  late HomePageCubit homePageCubit;
  late TaskBookingDetailCubit taskBookingDetailCubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // BlocProvider.of<CleanDetailCubit>(context).init(widget.item);
    homePageCubit = BlocProvider.of<HomePageCubit>(context);
    // homePageCubit = BlocProvider.of<HomePageCubit>(context).createPaymentLink();
    BlocProvider.of<TaskBookingDetailCubit>(context).init(widget.taskId);
    taskBookingDetailCubit = BlocProvider.of<TaskBookingDetailCubit>(context);
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
            child: BlocConsumer<TaskBookingDetailCubit, TaskBookingDetailState>(
                bloc: taskBookingDetailCubit,
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is TaskBookingDetailLoaded) {
                    if (taskBookingDetailCubit.taskBookingModel == null) {
                      return SizedBox();
                    }
                    return Column(
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
                                    backgroundImage: AssetImage(
                                        "assets/icons/logo_company.jpeg"),
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
                              if (taskBookingDetailCubit
                                      .taskBookingModel!.taskerId !=
                                  null)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Nhân viên:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                            radius: 30,
                                            backgroundImage: NetworkImage(
                                                '${UrlApiAppUser.host}${taskBookingDetailCubit.taskBookingModel!.taskerId!.avatar}')),
                                        const SizedBox(
                                          width: 16,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              taskBookingDetailCubit
                                                  .taskBookingModel!
                                                  .taskerId!
                                                  .fullName!,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: Color(0xFF4151b1),
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
                                                      fontWeight:
                                                          FontWeight.bold),
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
                                                padding:
                                                    const EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xFF4151b1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
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
                                                  color: Color(0xFF4151b1),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xFF4151b1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                                child: const Icon(
                                                  Icons
                                                      .messenger_outline_rounded,
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
                                                  color: Color(0xFF4151b1),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xFF4151b1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                                child: const Icon(
                                                  Icons
                                                      .perm_contact_calendar_rounded,
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
                                                  color: Color(0xFF4151b1),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Icon(
                                          Icons.place_outlined,
                                          color: Color(0xFF4151b1),
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
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                  '${taskBookingDetailCubit.taskBookingModel!.taskId!.address}'),
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
                                          color: Color(0xFF4151b1),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Expanded(
                                            child: Text(taskBookingDetailCubit
                                                        .taskBookingModel!
                                                        .taskId!
                                                        .note ==
                                                    ''
                                                ? 'Không có ghi chú nào'
                                                : '${taskBookingDetailCubit.taskBookingModel!.taskId!.note}'))
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.check_circle_outline,
                                          color: Color(0xFF4151b1),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Expanded(
                                            child: Text(
                                          '${(taskBookingDetailCubit.taskBookingModel!.taskId!.estimateTime! / 60).round()} giờ, ${(taskBookingDetailCubit.taskBookingModel!.time! / 60).round()}:00 đến ${(taskBookingDetailCubit.taskBookingModel!.time! / 60).round() + (taskBookingDetailCubit.taskBookingModel!.taskId!.estimateTime! / 60).round()}:00',
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
                                          color: Color(0xFF4151b1),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Expanded(
                                            child: Text(
                                                '(+84) 0966626550 | Khoa Truong'))
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
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Thời lượng',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey)),
                                  Text(
                                      '${(taskBookingDetailCubit.taskBookingModel!.taskId!.estimateTime! / 60).round()} giờ, ${(taskBookingDetailCubit.taskBookingModel!.time! / 60).round()}:00 đến ${(taskBookingDetailCubit.taskBookingModel!.time! / 60).round() + (taskBookingDetailCubit.taskBookingModel!.taskId!.estimateTime! / 60).round()}:00',
                                      style:
                                          const TextStyle(color: Colors.grey)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text("Phương thức thanh toán",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
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
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Tổng cộng',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text(
                                      '${AppConstant.oCcy.format(taskBookingDetailCubit.taskBookingModel!.price!)} VND',
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
                        // if (taskBookingDetailCubit
                        //         .taskBookingModel!.date!.day ==
                        // DateTime.now().day)
                        ElevatedButton(
                            onPressed: () {
                              homePageCubit.completeTaskBooking(
                                  context: context,
                                  taskId: taskBookingDetailCubit
                                      .taskBookingModel!.id!,
                                  taskBookingModel:
                                      taskBookingDetailCubit.taskBookingModel!);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              overlayColor: Colors.grey,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'Hoàn thành',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                        const SizedBox(
                          height: 8,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              showModalBottomSheet<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom),
                                    child: Container(
                                      padding: const EdgeInsets.all(16),
                                      height: 300,
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(16),
                                              topRight: Radius.circular(16))),
                                      child: Center(
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            mainAxisSize: MainAxisSize.max,
                                            children: <Widget>[
                                              const Text(
                                                'Bạn muốn hủy công việc này?',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const Row(
                                                children: [
                                                  Text(
                                                    'Lí do:',
                                                  ),
                                                ],
                                              ),
                                              TextField(
                                                controller:
                                                    taskBookingDetailCubit
                                                        .cancelReasonContoller,
                                                textInputAction:
                                                    TextInputAction.done,
                                                decoration: InputDecoration(
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .grey.shade300)),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors.grey
                                                                  .shade300)),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors.grey
                                                                  .shade300)),
                                                  hintText:
                                                      'Nhập lí do tại đây',
                                                ),
                                                maxLines: 4,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          backgroundColor:
                                                              Colors.grey
                                                                  .shade200,
                                                          // overlayColor: Colors.grey,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                        child: const Center(
                                                          child: Text(
                                                            'Hủy',
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .green,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        )),
                                                  ),
                                                  const SizedBox(
                                                    width: 20,
                                                  ),
                                                  Expanded(
                                                    child: ElevatedButton(
                                                        onPressed: () {
                                                          homePageCubit.cancelTaskBooking(
                                                              context: context,
                                                              taskId: taskBookingDetailCubit
                                                                  .taskBookingModel!
                                                                  .id!,
                                                              taskBookingModel:
                                                                  taskBookingDetailCubit
                                                                      .taskBookingModel!,
                                                              cancelReason:
                                                                  taskBookingDetailCubit
                                                                      .cancelReasonContoller
                                                                      .text);
                                                        },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          backgroundColor:
                                                              Colors.green,
                                                          // overlayColor: Colors.grey,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                        child: const Center(
                                                          child: Text(
                                                            'Đồng ý',
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        )),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey.shade200,
                              overlayColor: Colors.grey,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'Huỷ đơn',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                        // if (taskBookingDetailCubit
                        //         .taskBookingModel!.date!.day ==
                        //     DateTime.now().day)
                        ElevatedButton(
                            onPressed: () {
                              homePageCubit.createPaymentLink(
                                  taskBookingDetailCubit.taskBookingModel!);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey.shade200,
                              overlayColor: Colors.grey,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'Thanh toán onl',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                            ))
                      ],
                    );
                  }
                  return Center(
                    child: LoadingAnimationWidget.prograssiveDots(
                      color: const Color(0xFF4151b1),
                      size: 40,
                    ),
                  );
                })),
      ),
    );
  }
}
