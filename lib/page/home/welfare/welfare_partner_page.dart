import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner_app/cubit/home/home_page/home_page_cubit.dart';

class WelfarePartnerPage extends StatefulWidget {
  const WelfarePartnerPage({super.key});

  @override
  State<WelfarePartnerPage> createState() => _WelfarePartnerPageState();
}

class _WelfarePartnerPageState extends State<WelfarePartnerPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<HomePageCubit>(context).init();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          children: [
            const Text(
              'Phúc lợi',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: 8,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 8.0,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) => GestureDetector(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(bottom: 4),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          const BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2,
                              offset: Offset(0.0, 0))
                        ],
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.clean_hands_outlined,
                          color: Colors.orange,
                          size: 60,
                        ),
                        Text(
                          'taskReward',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          // maxLines: 2,

                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'Nhận "vô vàn quà tặng" khi tích bPoint đổi quà cùng taskReward.',
                          style: TextStyle(fontSize: 14),
                          maxLines: 3,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
