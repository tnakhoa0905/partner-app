import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner_app/constant/constant.dart';
import 'package:partner_app/cubit/setting/setting_cubit.dart';
import 'package:partner_app/route/app_route.dart';

class ProfilePartnerPage extends StatefulWidget {
  const ProfilePartnerPage({super.key});

  @override
  State<ProfilePartnerPage> createState() => _ProfilePartnerPageState();
}

class _ProfilePartnerPageState extends State<ProfilePartnerPage> {
  late SettingPageCubit settingPageCubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<SettingPageCubit>(context).init(context);
    settingPageCubit = BlocProvider.of<SettingPageCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          children: [
            const Text(
              'Tài khoản',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Thông tin',
                                style: TextStyle(
                                    color: Color(0xFF4151b1),
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              SizedBox(
                                width: 50,
                                height: 30,
                                child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.all(0),
                                      backgroundColor: const Color(0xFFf57171),
                                    ),
                                    child: const Icon(
                                      Icons.navigate_next,
                                      color: Colors.white,
                                      size: 30,
                                    )),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage(
                                    "${UrlApiAppUser.host}${settingPageCubit.usermodel!.user!.avatar!}"),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    settingPageCubit.usermodel!.user!.fullName!,
                                    style: const TextStyle(
                                        color: Color(0xFFf57171),
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    settingPageCubit
                                        .usermodel!.user!.phoneNumber!,
                                  )
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Text('Dịch vụ: tổng vệ sinh')
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Tài chính',
                                style: TextStyle(
                                    color: Color(0xFF4151b1),
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              SizedBox(
                                width: 50,
                                height: 30,
                                child: ElevatedButton(
                                    onPressed: () => Navigator.pushNamed(
                                        context, AppRouteUser.finance),
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.all(0),
                                      backgroundColor: const Color(0xFFf57171),
                                    ),
                                    child: const Icon(
                                      Icons.navigate_next,
                                      color: Colors.white,
                                      size: 30,
                                    )),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Tài khoản chính',
                                    style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border:
                                              Border.all(color: Colors.grey)),
                                      child: Text(
                                        "${AppConstant.oCcy.format(settingPageCubit.usermodel!.user!.balance!)} VND",
                                      ))
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Row(
                            children: [
                              Text(
                                'Tài khoản khuyến mãi',
                                style: TextStyle(
                                  color: Color(0xFF000000),
                                  fontSize: 18,
                                ),
                              ),
                              Spacer(),
                              Text(
                                '0đ',
                                style: TextStyle(
                                  color: Color(0xFF000000),
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Báo cáo tuần',
                                style: TextStyle(
                                    color: Color(0xFF4151b1),
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              SizedBox(
                                width: 50,
                                height: 30,
                                child: ElevatedButton(
                                    onPressed: () => Navigator.pushNamed(
                                        context, AppRouteUser.weekReport),
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.all(0),
                                      backgroundColor: const Color(0xFFf57171),
                                    ),
                                    child: const Icon(
                                      Icons.navigate_next,
                                      color: Colors.white,
                                      size: 30,
                                    )),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Row(
                            children: [
                              Text(
                                'Thu nhập trong tuần này',
                                style: TextStyle(),
                              ),
                              Spacer(),
                              Text('0đ')
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Row(
                            children: [
                              Text(
                                'Công việc đã hoàn thành',
                                style: TextStyle(),
                              ),
                              Spacer(),
                              Text('0')
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Lịch sử thu nhập',
                                style: TextStyle(
                                    color: Color(0xFF4151b1),
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              SizedBox(
                                width: 50,
                                height: 30,
                                child: ElevatedButton(
                                    onPressed: () => Navigator.pushNamed(
                                        context, AppRouteUser.incomeHistory),
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.all(0),
                                      backgroundColor: const Color(0xFFf57171),
                                    ),
                                    child: const Icon(
                                      Icons.navigate_next,
                                      color: Colors.white,
                                      size: 30,
                                    )),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Row(
                            children: [
                              Text(
                                'Thu nhập tháng này',
                              ),
                              Spacer(),
                              Text('0đ')
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Cài đặt',
                                style: TextStyle(
                                    color: Color(0xFF4151b1),
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              SizedBox(
                                width: 50,
                                height: 30,
                                child: ElevatedButton(
                                    onPressed: () => Navigator.pushNamed(
                                        context, AppRouteUser.setting),
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.all(0),
                                      backgroundColor: const Color(0xFFf57171),
                                    ),
                                    child: const Icon(
                                      Icons.navigate_next,
                                      color: Colors.white,
                                      size: 30,
                                    )),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Row(
                            children: [
                              Text(
                                'Nhận thông báo công việc',
                              ),
                              Spacer(),
                              Text('Mở')
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Bộ dụng cụ và hoá chất',
                                style: TextStyle(
                                    color: Color(0xFF4151b1),
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              SizedBox(
                                width: 50,
                                height: 30,
                                child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.all(0),
                                      backgroundColor: const Color(0xFFf57171),
                                    ),
                                    child: const Icon(
                                      Icons.navigate_next,
                                      color: Colors.white,
                                      size: 30,
                                    )),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Row(
                            children: [
                              Text(
                                'Bộ dụng cụ và hoá chất',
                              ),
                              Spacer(),
                              Text('')
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Hỗ trợ',
                                style: TextStyle(
                                    color: Color(0xFF4151b1),
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              SizedBox(
                                width: 50,
                                height: 30,
                                child: ElevatedButton(
                                    onPressed: () => Navigator.pushNamed(
                                        context, AppRouteUser.support),
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.all(0),
                                      backgroundColor: const Color(0xFFf57171),
                                    ),
                                    child: const Icon(
                                      Icons.navigate_next,
                                      color: Colors.white,
                                      size: 30,
                                    )),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Row(
                            children: [
                              Text(
                                'Hỗ trợ nhân sự và thời gian làm việc',
                              ),
                              Spacer(),
                              Text('')
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
