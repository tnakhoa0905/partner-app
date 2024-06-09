import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner_app/cubit/home/home_page/home_page_cubit.dart';
import 'package:partner_app/cubit/home/home_page/home_page_state.dart';
import 'package:partner_app/data/model/clean_task_model.dart';
import 'package:partner_app/page/home/home_page/hisroty/clean_history_item.dart';
import 'package:partner_app/page/home/home_page/hisroty/task_booking_item.dart';
import 'package:partner_app/page/home/home_page/widget/clean_item.dart';
import 'package:partner_app/page/home/home_page/widget/task_booking_item.dart';
// import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

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

  // void _onRefresh() async {
  //   // monitor network fetch
  //   await Future.delayed(const Duration(milliseconds: 1000));
  //   print("...");
  //   BlocProvider.of<HomePageCubit>(context).getList();

  //   // if failed,use refreshFailed()
  //   _refreshController.refreshCompleted();
  // }

  // void _onLoading() async {
  //   // monitor network fetch
  //   await Future.delayed(const Duration(milliseconds: 1000));
  //   // if failed,use loadFailed(),if no data return,use LoadNodata()

  //   if (mounted) setState(() {});
  //   _refreshController.loadComplete();
  // }

  // void _onRefreshDone() async {
  //   // monitor network fetch
  //   await Future.delayed(const Duration(milliseconds: 1000));
  //   print("...");
  //   BlocProvider.of<HomePageCubit>(context).getList();

  //   // if failed,use refreshFailed()
  //   _refreshControllerDone.refreshCompleted();
  // }

  // void _onLoadingDone() async {
  //   // monitor network fetch
  //   await Future.delayed(const Duration(milliseconds: 1000));
  //   // if failed,use loadFailed(),if no data return,use LoadNodata()

  //   if (mounted) setState(() {});
  //   _refreshControllerDone.loadComplete();
  // }

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
                      if (homePageCubit.usermodel!.level! > 1) {
                        return RefreshIndicator(
                            child: Container(
                                padding: const EdgeInsets.only(
                                  left: 16.0,
                                  right: 16,
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      BlocConsumer<HomePageCubit,
                                              HomePageState>(
                                          bloc: homePageCubit,
                                          builder: (context, state) {
                                            return const SizedBox();
                                          },
                                          listener: (context, state) {}),
                                      for (var item in homePageCubit
                                          .combinedList.reversed)
                                        item is CleanModel
                                            ? CleanItem(item: item)
                                            : TaskBookingItem(
                                                item: item,
                                              )
                                    ],
                                  ),
                                )),
                            onRefresh: () async {
                              return Future.delayed(Duration(seconds: 2), () {
                                homePageCubit.init();
                              });
                            });
                        // return SmartRefresher(
                        //   enablePullDown: true,
                        //   enablePullUp: false,
                        //   header: CustomHeader(
                        //       height: 30,
                        //       builder: (context, mode) {
                        //         Widget body;
                        //         if (mode == RefreshStatus.idle) {
                        //           body = const Text("Làm mới");
                        //         } else if (mode == RefreshStatus.refreshing) {
                        //           body = const CupertinoActivityIndicator();
                        //         } else if (mode == RefreshStatus.failed) {
                        //           body = const Text("Load Failed!Click retry!");
                        //         } else if (mode == RefreshStatus.completed) {
                        //           body = const SizedBox(
                        //             height: 0,
                        //           );
                        //           // body = Text("Làm mới thành công");
                        //         } else {
                        //           body = const Text("Thả để làm mới");
                        //         }
                        //         return SizedBox(
                        //           // height: 55.0,
                        //           child: Center(child: body),
                        //         );
                        //       }),
                        //   controller: _refreshController,
                        //   onRefresh: _onRefresh,
                        //   child: Container(
                        //       padding: const EdgeInsets.only(
                        //         left: 16.0,
                        //         right: 16,
                        //       ),
                        //       child: SingleChildScrollView(
                        //         child: Column(
                        //           children: [
                        //             BlocConsumer<HomePageCubit, HomePageState>(
                        //                 bloc: homePageCubit,
                        //                 builder: (context, state) {
                        //                   return const SizedBox();
                        //                 },
                        //                 listener: (context, state) {}),
                        //             for (var item in homePageCubit.listClean)
                        //               CleanItem(item: item),
                        //             for (int i = 0;
                        //                 i <
                        //                     homePageCubit
                        //                         .listTaskBooking.length;
                        //                 i++)
                        //               TaskBookingItem(
                        //                   item:
                        //                       homePageCubit.listTaskBooking[i],
                        //                   index: i,
                        //                   lenght: homePageCubit
                        //                       .listTaskBooking.length)
                        //           ],
                        //         ),
                        //       )),
                        // );
                      }
                      return Center(
                        child: Text(homePageCubit.usermodel!.level == 0
                            ? "Bạn đã bị khoá tài khoản"
                            : "Đang chờ xét duyệt"),
                      );
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
                      if (homePageCubit.usermodel!.level! > 1) {
                        return RefreshIndicator(
                            child: Container(
                                padding: const EdgeInsets.only(
                                  left: 16.0,
                                  right: 16,
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      BlocConsumer<HomePageCubit,
                                              HomePageState>(
                                          bloc: homePageCubit,
                                          builder: (context, state) {
                                            return const SizedBox();
                                          },
                                          listener: (context, state) {}),
                                      for (var item in homePageCubit
                                          .combinedListDone.reversed)
                                        item is CleanModel
                                            ? CleanHistoryItem(item: item)
                                            : TaskBookingHistoryItem(
                                                item: item,
                                              )
                                    ],
                                  ),
                                )),
                            onRefresh: () async {
                              return Future.delayed(Duration(seconds: 2), () {
                                homePageCubit.init();
                              });
                            });
                        // return SmartRefresher(
                        //   enablePullDown: true,
                        //   enablePullUp: false,
                        //   header: CustomHeader(
                        //       height: 30,
                        //       builder: (context, mode) {
                        //         Widget body;
                        //         if (mode == RefreshStatus.idle) {
                        //           body = const Text("Làm mới");
                        //         } else if (mode == RefreshStatus.refreshing) {
                        //           body = const CupertinoActivityIndicator();
                        //         } else if (mode == RefreshStatus.failed) {
                        //           body = const Text("Load Failed!Click retry!");
                        //         } else if (mode == RefreshStatus.completed) {
                        //           body = const SizedBox(
                        //             height: 0,
                        //           );
                        //           // body = Text("Làm mới thành công");
                        //         } else {
                        //           body = const Text("Thả để làm mới");
                        //         }
                        //         return SizedBox(
                        //           // height: 55.0,
                        //           child: Center(child: body),
                        //         );
                        //       }),
                        //   controller: _refreshControllerDone,
                        //   onRefresh: _onRefreshDone,
                        //   child: Container(
                        //       padding: const EdgeInsets.only(
                        //         left: 16.0,
                        //         right: 16,
                        //       ),
                        //       child: SingleChildScrollView(
                        //         child: Column(
                        //           children: [
                        //             BlocConsumer<HomePageCubit, HomePageState>(
                        //                 bloc: homePageCubit,
                        //                 builder: (context, state) {
                        //                   return const SizedBox();
                        //                 },
                        //                 listener: (context, state) {}),
                        //             for (var item
                        //                 in homePageCubit.listCleanDone)
                        //               CleanItem(item: item),
                        //             for (int i = 0;
                        //                 i <
                        //                     homePageCubit
                        //                         .listTaskBookingDone.length;
                        //                 i++)
                        //               TaskBookingItem(
                        //                   item: homePageCubit
                        //                       .listTaskBookingDone[i],
                        //                   index: i,
                        //                   lenght: homePageCubit
                        //                       .listTaskBooking.length)
                        //           ],
                        //         ),
                        //       )),
                        // );
                      }
                      return Center(
                        child: Text(homePageCubit.usermodel!.level == 0
                            ? "Bạn đã bị khoá tài khoản"
                            : "Đang chờ xét duyệt"),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
