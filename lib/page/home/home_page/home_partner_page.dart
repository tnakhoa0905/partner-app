import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner_app/cubit/home/home_page/home_page_cubit.dart';
import 'package:partner_app/cubit/home/home_page/home_page_state.dart';
import 'package:partner_app/page/home/home_page/widget/clean_item.dart';
import 'package:partner_app/page/home/home_page/widget/task_booking_item.dart';

class HomePartnerPage extends StatefulWidget {
  const HomePartnerPage({super.key});

  @override
  State<HomePartnerPage> createState() => _HomePartnerPageState();
}

class _HomePartnerPageState extends State<HomePartnerPage>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  List<String> listActivity = ['Đã đặt', 'Xác nhận', 'Đã giao'];
  late HomePageCubit homePageCubit;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    BlocProvider.of<HomePageCubit>(context).init();
    homePageCubit = BlocProvider.of<HomePageCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Text(
            'Trang chủ',
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Container(
            margin: const EdgeInsets.only(left: 16, right: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                16.0,
              ),
              color: Colors.white,
            ),
            child: TabBar(
                controller: _tabController,
                // indicatorColor: const Color(0xfff6852c),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    16.0,
                  ),
                  color: const Color(0xFF4151b1),
                ),
                indicatorColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                dividerHeight: 0,
                labelColor: Colors.white,
                padding: const EdgeInsets.all(4),
                tabs: const <Widget>[
                  Tab(
                    child: Text(
                      'Việc được giao',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Việc đã xong',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ]),
          ),
          Expanded(
              child: TabBarView(
            controller: _tabController,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 12),
                child: BlocConsumer<HomePageCubit, HomePageState>(
                  bloc: homePageCubit,
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is HomePageLoaded) {
                      return Container(
                          padding: const EdgeInsets.only(
                            left: 16.0,
                            right: 16,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                BlocConsumer<HomePageCubit, HomePageState>(
                                    bloc: homePageCubit,
                                    builder: (context, state) {
                                      return const SizedBox();
                                    },
                                    listener: (context, state) {}),
                                for (var item in homePageCubit.listClean)
                                  CleanItem(item: item),
                                for (int i = 0;
                                    i < homePageCubit.listTaskBooking.length;
                                    i++)
                                  TaskBookingItem(
                                      item: homePageCubit.listTaskBooking[i],
                                      index: i,
                                      lenght:
                                          homePageCubit.listTaskBooking.length)
                              ],
                            ),
                          ));
                    }
                    return const SizedBox();
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 12),
                child: BlocConsumer<HomePageCubit, HomePageState>(
                  bloc: homePageCubit,
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is HomePageLoaded) {
                      return Container(
                          padding: const EdgeInsets.only(
                            left: 16.0,
                            right: 16,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                BlocConsumer<HomePageCubit, HomePageState>(
                                    bloc: homePageCubit,
                                    builder: (context, state) {
                                      return const SizedBox();
                                    },
                                    listener: (context, state) {}),
                                for (var item in homePageCubit.listCleanDone)
                                  CleanItem(item: item),
                                for (int i = 0;
                                    i <
                                        homePageCubit
                                            .listTaskBookingDone.length;
                                    i++)
                                  TaskBookingItem(
                                      item:
                                          homePageCubit.listTaskBookingDone[i],
                                      index: i,
                                      lenght:
                                          homePageCubit.listTaskBooking.length)
                              ],
                            ),
                          ));
                    }
                    return const SizedBox();
                  },
                ),
              ),
              //     Padding(
              //       padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
              //       child: Column(
              //         children: [
              //           Container(
              //             width: MediaQuery.sizeOf(context).width,
              //             padding: const EdgeInsets.all(16),
              //             decoration: BoxDecoration(
              //                 boxShadow: const [
              //                   BoxShadow(
              //                       color: Colors.grey,
              //                       blurRadius: 2,
              //                       offset: Offset(0, 2))
              //                 ],
              //                 color: Colors.white,
              //                 borderRadius: BorderRadius.circular(16)),
              //             child: Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 const Text(
              //                   "Thông báo công việc",
              //                   style: TextStyle(fontSize: 16),
              //                 ),
              //                 Divider(
              //                   color: Colors.grey.shade300,
              //                 ),
              //                 const Text(
              //                   "Hiện không có công việc nào",
              //                   style: TextStyle(fontSize: 16),
              //                 )
              //               ],
              //             ),
              //           ),
              //         ],
              //       ),
              //     )
            ],
          ))
        ],
      ),
    );
  }
}
