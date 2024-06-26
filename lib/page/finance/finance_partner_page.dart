import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner_app/constant/constant.dart';
import 'package:partner_app/cubit/home/home_page/home_page_cubit.dart';
import 'package:partner_app/cubit/home/home_page/home_page_state.dart';
import 'package:partner_app/cubit/withdrawals/withdrawal_page.dart';
import 'package:partner_app/cubit/withdrawals/withdrawals_state.dart';
import 'package:partner_app/data/model/withdrawals_model.dart';
import 'package:partner_app/route/app_route.dart';

class FinancePartnerPage extends StatefulWidget {
  const FinancePartnerPage({super.key});

  @override
  State<FinancePartnerPage> createState() => _FinancePartnerPage();
}

class _FinancePartnerPage extends State<FinancePartnerPage>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  List<String> listActivity = ['Đã đặt', 'Xác nhận', 'Đã giao'];
  late HomePageCubit homePageCubit;
  late WithDrawalCubit withDrawalCubit;

  @override
  void initState() {
    super.initState();
    homePageCubit = BlocProvider.of<HomePageCubit>(context);
    withDrawalCubit = BlocProvider.of<WithDrawalCubit>(context);
    BlocProvider.of<WithDrawalCubit>(context).initWithdraw();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          const Color(0xFF4151b1),
                          Colors.grey.shade300,
                        ],
                        begin: const FractionalOffset(1, 0.0),
                        end: const FractionalOffset(1.0, 1.0),
                        stops: const [0.0, 5.0],
                        tileMode: TileMode.decal),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.grey.shade300,
                ),
              )
            ],
          ),
          SafeArea(
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
                        'Tài chính',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12)),
                        child: const Icon(
                          Icons.settings,
                          color: Colors.white,
                          size: 24,
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width - 32,
                          // height: 300,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              shape: BoxShape.circle),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                'Tài khoản chính',
                                style: TextStyle(
                                    // color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                              BlocConsumer<HomePageCubit, HomePageState>(
                                listener: (context, state) {},
                                builder: (context, state) {
                                  if (state is HomePageLoaded) {
                                    return Text(
                                      "${AppConstant.oCcy.format(homePageCubit.usermodel!.balance!)} đ",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    );
                                  }
                                  return const Text(
                                    '0d',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  );
                                },
                                bloc: homePageCubit,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 16.0, right: 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        height: 40,
                                        child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.pushNamed(context,
                                                  AppRouteUser.depositPage);
                                            },
                                            style: ElevatedButton.styleFrom(
                                                padding:
                                                    const EdgeInsets.all(0),
                                                backgroundColor:
                                                    const Color(0xFF4151b1),
                                                foregroundColor: Colors.white),
                                            child: const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [Text('Nạp tiền')],
                                            )),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 24,
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        height: 40,
                                        child: ElevatedButton(
                                            onPressed: () =>
                                                Navigator.pushNamed(
                                                    context,
                                                    AppRouteUser
                                                        .withdrawalsPage),
                                            style: ElevatedButton.styleFrom(
                                                padding:
                                                    const EdgeInsets.all(0),
                                                backgroundColor:
                                                    const Color(0xFFf57171),
                                                foregroundColor: Colors.white),
                                            child: const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [Text('Rút tiền')],
                                            )),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const Text(
                                'Tài khoản khuyến mãi: 0đ',
                                style: TextStyle(
                                    color: Color(0xFF4151b1),
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 16, right: 16),
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
                                          'GIAO DỊCH',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Tab(
                                        child: Text(
                                          'YÊU CẦU',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: TabBarView(
                          controller: _tabController,
                          children: [
                            BlocConsumer<WithDrawalCubit, WithDrawalState>(
                              bloc: withDrawalCubit,
                              listener: (context, state) {},
                              builder: (context, state) {
                                if (state is WithDrawalLoaded) {
                                  return RefreshIndicator(
                                      child: Container(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          padding: const EdgeInsets.only(
                                            left: 16.0,
                                            right: 16,
                                          ),
                                          child: Column(
                                            children: [
                                              Expanded(
                                                child: ListView.builder(
                                                    shrinkWrap: true,
                                                    physics:
                                                        const AlwaysScrollableScrollPhysics(),
                                                    itemCount: withDrawalCubit
                                                        .listWithdrawDone
                                                        .length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      WithdrawalsModel item =
                                                          withDrawalCubit
                                                                  .listWithdrawDone[
                                                              index];
                                                      return Container(
                                                        margin: const EdgeInsets
                                                            .only(bottom: 8),
                                                        padding:
                                                            const EdgeInsets
                                                                .all(12),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border.all(
                                                              color: Colors.grey
                                                                  .shade500),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(16),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: const Color(
                                                                      0xFF7090B0)
                                                                  .withOpacity(
                                                                      0.2),
                                                              blurRadius: 20.0,
                                                              offset:
                                                                  const Offset(
                                                                      0, 10.0),
                                                            )
                                                          ],
                                                        ),
                                                        child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                item.status == 1
                                                                    ? "Đã thanh toán"
                                                                    : "Từ chối",
                                                              ),
                                                              Text(
                                                                  "${AppConstant.oCcy.format(item.amount)} VND"),
                                                            ]),
                                                      );
                                                    }),
                                              ),
                                            ],
                                          )),
                                      onRefresh: () async {
                                        return Future.delayed(
                                            const Duration(seconds: 2), () {
                                          withDrawalCubit.initWithdraw();
                                        });
                                      });
                                }
                                return const Text(
                                  'Bạn chưa có giao dịch nào',
                                  textAlign: TextAlign.center,
                                );
                              },
                            ),
                            BlocConsumer<WithDrawalCubit, WithDrawalState>(
                              bloc: withDrawalCubit,
                              listener: (context, state) {},
                              builder: (context, state) {
                                if (state is WithDrawalLoaded) {
                                  return RefreshIndicator(
                                      child: Container(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          padding: const EdgeInsets.only(
                                            left: 16.0,
                                            right: 16,
                                          ),
                                          child: Column(
                                            children: [
                                              Expanded(
                                                child: ListView.builder(
                                                    shrinkWrap: true,
                                                    physics:
                                                        const AlwaysScrollableScrollPhysics(),
                                                    itemCount: withDrawalCubit
                                                        .listWithdraw.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      WithdrawalsModel item =
                                                          withDrawalCubit
                                                                  .listWithdraw[
                                                              index];
                                                      return Container(
                                                        margin: const EdgeInsets
                                                            .only(bottom: 8),
                                                        padding:
                                                            const EdgeInsets
                                                                .all(12),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border.all(
                                                              color: Colors.grey
                                                                  .shade500),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(16),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: const Color(
                                                                      0xFF7090B0)
                                                                  .withOpacity(
                                                                      0.2),
                                                              blurRadius: 20.0,
                                                              offset:
                                                                  const Offset(
                                                                      0, 10.0),
                                                            )
                                                          ],
                                                        ),
                                                        child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              const Text(
                                                                  "Chờ xét duyệt"),
                                                              Text(
                                                                  "${AppConstant.oCcy.format(item.amount)} VND"),
                                                            ]),
                                                      );
                                                    }),
                                              ),
                                            ],
                                          )),
                                      onRefresh: () async {
                                        return Future.delayed(
                                            const Duration(seconds: 2), () {
                                          withDrawalCubit.initWithdraw();
                                        });
                                      });
                                }
                                return const Text(
                                  'Bạn không có yêu cầu',
                                  textAlign: TextAlign.center,
                                );
                              },
                            ),
                          ],
                        ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
