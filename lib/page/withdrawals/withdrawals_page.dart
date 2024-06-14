import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner_app/cubit/withdrawals/withdrawal_page.dart';
import 'package:partner_app/cubit/withdrawals/withdrawals_state.dart';

class WithdrawalsPage extends StatefulWidget {
  const WithdrawalsPage({super.key});

  @override
  State<WithdrawalsPage> createState() => _WithdrawalsPageState();
}

class _WithdrawalsPageState extends State<WithdrawalsPage> {
  late WithDrawalCubit withDrawalCubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<WithDrawalCubit>(context).init();
    withDrawalCubit = BlocProvider.of<WithDrawalCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              offset: const Offset(0, 2.0),
              blurRadius: 4.0,
            )
          ]),
          child: AppBar(
            title: const Text(
              'Yêu cầu rút tiền',
              style: TextStyle(),
            ),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                )),
            backgroundColor: Colors.white,
            scrolledUnderElevation: 0.0,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
            child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          margin: const EdgeInsets.only(top: 16),
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(color: Colors.white),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  'Số tiền',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: withDrawalCubit.money,
                  style: const TextStyle(color: Colors.black),
                  cursorColor: Colors.grey.shade300,
                  autofocus: false,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade300,
                    prefixIconColor: Colors.grey.shade300,
                    suffixIconColor: Colors.grey.shade300,
                    hoverColor: Colors.grey.shade300,
                    iconColor: Colors.grey.shade300,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(color: Colors.black)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(color: Colors.black)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(color: Colors.black)),
                    focusColor: Colors.grey.shade300,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Số tài khoản',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: withDrawalCubit.stk,
                  style: const TextStyle(color: Colors.black),
                  cursorColor: Colors.grey.shade300,
                  autofocus: false,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade300,
                    prefixIconColor: Colors.grey.shade300,
                    suffixIconColor: Colors.grey.shade300,
                    hoverColor: Colors.grey.shade300,
                    iconColor: Colors.grey.shade300,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(color: Colors.black)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(color: Colors.black)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(color: Colors.black)),
                    focusColor: Colors.grey.shade300,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  'Tên ngân hàng',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: withDrawalCubit.nameBank,
                  style: const TextStyle(color: Colors.black),
                  cursorColor: Colors.grey.shade300,
                  autofocus: false,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade300,
                    prefixIconColor: Colors.grey.shade300,
                    suffixIconColor: Colors.grey.shade300,
                    hoverColor: Colors.grey.shade300,
                    iconColor: Colors.grey.shade300,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(color: Colors.black)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(color: Colors.black)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(color: Colors.black)),
                    focusColor: Colors.grey.shade300,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  'Tên chủ thẻ',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: withDrawalCubit.name,
                  style: const TextStyle(color: Colors.black),
                  cursorColor: Colors.grey.shade300,
                  autofocus: false,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade300,
                    prefixIconColor: Colors.grey.shade300,
                    suffixIconColor: Colors.grey.shade300,
                    hoverColor: Colors.grey.shade300,
                    iconColor: Colors.grey.shade300,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(color: Colors.black)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(color: Colors.black)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(color: Colors.black)),
                    focusColor: Colors.grey.shade300,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                BlocConsumer<WithDrawalCubit, WithDrawalState>(
                    bloc: withDrawalCubit,
                    builder: (context, state) {
                      if (state is WithDrawalError) {
                        return const Text(
                          'Số dư tài khoản còn lại phải trên 1.000.000 để duy trì nhận đơn',
                          style: TextStyle(color: Colors.red),
                        );
                      }
                      return const SizedBox();
                    },
                    listener: (context, state) {}),
                SizedBox(
                  height: 60,
                  width: MediaQuery.sizeOf(context).width,
                  child: ElevatedButton(
                      onPressed: () {
                        withDrawalCubit.orderWithDrawal(context);
                      },
                      style: ElevatedButton.styleFrom(
                        surfaceTintColor: Colors.transparent,
                        elevation: 0,
                        // splashFactory: NoSplash.splashFactory,
                        backgroundColor: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text(
                        'Gửi yêu cầu',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
