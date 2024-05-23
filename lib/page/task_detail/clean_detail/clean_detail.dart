import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner_app/constant/constant.dart';
import 'package:partner_app/cubit/home/home_page/home_page_cubit.dart';
import 'package:partner_app/data/model/clean_task_model.dart';
// import 'package:partner_app/route/app_route.dart';

class CleanDetailPage extends StatefulWidget {
  const CleanDetailPage({super.key, required this.item});
  final CleanModel item;
  @override
  State<CleanDetailPage> createState() => _CleanDetailPageDetailPageState();
}

class _CleanDetailPageDetailPageState extends State<CleanDetailPage> {
  late HomePageCubit homePageCubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // BlocProvider.of<CleanDetailCubit>(context).init(widget.item);
    homePageCubit = BlocProvider.of<HomePageCubit>(context);
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
                    if (widget.item.taskerIdArr!.isNotEmpty)
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
                                    "${UrlApiAppUser.host}${widget.item.taskerIdArr!.first.avatar}"),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.item.taskerIdArr!.first.fullName!,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      '85 An Dương Vương',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('${widget.item.cleanId!.address}'),
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
                                  child: Text(widget.item.cleanId!.note == ""
                                      ? '...'
                                      : "${widget.item.cleanId!.note}"))
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
                                '${(widget.item.cleanId!.estimateTime! / 60).round()} giờ, ${(widget.item.time! / 60).round()}:00 đến ${(widget.item.time! / 60).round() + (widget.item.cleanId!.estimateTime! / 60).round()}:00',
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
                                  child: Text('(+84) 0966626550 | Khoa Truong'))
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
                            '${(widget.item.cleanId!.estimateTime! / 60).round()} giờ, ${(widget.item.time! / 60).round()}:00 đến ${(widget.item.time! / 60).round() + (widget.item.cleanId!.estimateTime! / 60).round()}:00',
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
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
                            // ignore: unnecessary_string_interpolations
                            '${AppConstant.oCcy.format(widget.item.cleanId!.price)} VND',
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
              if (widget.item.date!.day == DateTime.now().day)
                ElevatedButton(
                    onPressed: () => homePageCubit.completeTask(
                        context: context, taskId: widget.item.id!),
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
                  onPressed: () => homePageCubit.cancelTask(
                      context: context,
                      taskId: widget.item.id!,
                      cleanModel: widget.item),
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
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
