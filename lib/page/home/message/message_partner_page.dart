import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner_app/cubit/home/home_page/home_page_cubit.dart';

class MessagePartnerPage extends StatefulWidget {
  const MessagePartnerPage({super.key});

  @override
  State<MessagePartnerPage> createState() => _MessagePartnerPageState();
}

class _MessagePartnerPageState extends State<MessagePartnerPage>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  List<String> listActivity = ['Đã đặt', 'Xác nhận', 'Đã giao'];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    BlocProvider.of<HomePageCubit>(context).getUser();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Text(
            'Hộp thư',
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
                      'CHAT',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Tab(
                    child: const Text(
                      'THÔNG BÁO',
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
              const Text('Hiện tại không có tin nhắn nào'),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
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
                            "Thông báo công việc",
                            style: TextStyle(fontSize: 16),
                          ),
                          Divider(
                            color: Colors.grey.shade300,
                          ),
                          const Text(
                            "Hiện không có công việc nào",
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    // Expanded(
                    //     child: ListView.builder(
                    //         itemCount: 100,
                    //         shrinkWrap: true,
                    //         itemBuilder: (context, index) => Text('$index'))),
                    // const SizedBox(
                    //   height: 16,
                    // ),
                  ],
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
