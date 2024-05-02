import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FinancePartnerPage extends StatefulWidget {
  const FinancePartnerPage({super.key});

  @override
  State<FinancePartnerPage> createState() => _FinancePartnerPage();
}

class _FinancePartnerPage extends State<FinancePartnerPage>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  List<String> listActivity = ['Đã đặt', 'Xác nhận', 'Đã giao'];
  @override
  void initState() {
    super.initState();
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
                      'Tai chinh',
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
                        Icons.question_mark_rounded,
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
                              'Tai khoan chinh',
                              style: TextStyle(
                                  // color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              '0d',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 16.0, right: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 40,
                                      child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                              padding: const EdgeInsets.all(0),
                                              backgroundColor:
                                                  const Color(0xFF4151b1),
                                              foregroundColor: Colors.white),
                                          child: const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [Text('Nap tien')],
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
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                              padding: const EdgeInsets.all(0),
                                              backgroundColor:
                                                  const Color(0xFFf57171),
                                              foregroundColor: Colors.white),
                                          child: const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [Text('Rut tien')],
                                          )),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const Text(
                              'Tai khoan khuyen mai: 0d',
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
                        children: const [
                          Text(
                            'Bạn chưa có giao dịch nào',
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'Bạn không có yêu cầu',
                            textAlign: TextAlign.center,
                          )
                        ],
                      ))
                    ],
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
