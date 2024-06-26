import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:partner_app/components/back_ground.dart';
import 'package:partner_app/cubit/withdrawals/withdrawal_page.dart';
import 'package:partner_app/cubit/withdrawals/withdrawals_state.dart';
import 'package:intl/intl.dart';

class WithdrawalsPage extends StatefulWidget {
  const WithdrawalsPage({super.key});

  @override
  State<WithdrawalsPage> createState() => _WithdrawalsPageState();
}

class _WithdrawalsPageState extends State<WithdrawalsPage> {
  late WithDrawalCubit withDrawalCubit;
  static const _locale = 'en';
  String _formatNumber(String s) =>
      NumberFormat.decimalPattern(_locale).format(int.parse(s));
  String get _currency =>
      NumberFormat.compactSimpleCurrency(locale: _locale).currencySymbol;
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
      body: BackGround(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: SafeArea(
              child: Padding(
            // width: MediaQuery.sizeOf(context).width,
            // height: MediaQuery.sizeOf(context).height,
            // margin: const EdgeInsets.only(top: 16),
            // padding: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      'Yêu cầu rút tiền',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          // color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12)),
                    )
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Expanded(
                  child: BlocConsumer<WithDrawalCubit, WithDrawalState>(
                    bloc: withDrawalCubit,
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is WithDrawalLoaded) {
                        if (withDrawalCubit.bankAccountModel != null) {
                          return Column(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(16)),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Số tài khoản',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        TextField(
                                          controller: withDrawalCubit.stk,
                                          style: TextStyle(
                                              color: Colors.grey.shade500),
                                          cursorColor: Colors.grey.shade500,
                                          autofocus: false,
                                          readOnly: true,
                                          decoration: InputDecoration(
                                            fillColor: Colors.grey.shade500,
                                            prefixIconColor:
                                                Colors.grey.shade500,
                                            suffixIconColor:
                                                Colors.grey.shade500,
                                            hoverColor: Colors.grey.shade500,
                                            iconColor: Colors.grey.shade500,
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                borderSide: BorderSide(
                                                    color:
                                                        Colors.grey.shade500)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                borderSide: BorderSide(
                                                    color:
                                                        Colors.grey.shade500)),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                borderSide: BorderSide(
                                                    color:
                                                        Colors.grey.shade500)),
                                            focusColor: Colors.grey.shade500,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 24,
                                        ),
                                        const Text(
                                          'Tên ngân hàng',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        TextField(
                                          controller: withDrawalCubit.nameBank,
                                          style: TextStyle(
                                              color: Colors.grey.shade500),
                                          cursorColor: Colors.grey.shade500,
                                          autofocus: false,
                                          readOnly: true,
                                          decoration: InputDecoration(
                                            fillColor: Colors.grey.shade500,
                                            prefixIconColor:
                                                Colors.grey.shade500,
                                            suffixIconColor:
                                                Colors.grey.shade500,
                                            hoverColor: Colors.grey.shade500,
                                            iconColor: Colors.grey.shade500,
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                borderSide: BorderSide(
                                                    color:
                                                        Colors.grey.shade500)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                borderSide: BorderSide(
                                                    color:
                                                        Colors.grey.shade500)),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                borderSide: BorderSide(
                                                    color:
                                                        Colors.grey.shade500)),
                                            focusColor: Colors.grey.shade500,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 24,
                                        ),
                                        const Text(
                                          'Tên chủ thẻ',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        TextField(
                                          controller: withDrawalCubit.name,
                                          style: TextStyle(
                                              color: Colors.grey.shade500),
                                          cursorColor: Colors.grey.shade500,
                                          autofocus: false,
                                          readOnly: true,
                                          decoration: InputDecoration(
                                            fillColor: Colors.grey.shade500,
                                            prefixIconColor:
                                                Colors.grey.shade500,
                                            suffixIconColor:
                                                Colors.grey.shade500,
                                            hoverColor: Colors.grey.shade500,
                                            iconColor: Colors.grey.shade500,
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                borderSide: BorderSide(
                                                    color:
                                                        Colors.grey.shade500)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                borderSide: BorderSide(
                                                    color:
                                                        Colors.grey.shade500)),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                borderSide: BorderSide(
                                                    color:
                                                        Colors.grey.shade500)),
                                            focusColor: Colors.grey.shade500,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        const Text(
                                          'Số tiền',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        TextField(
                                          controller: withDrawalCubit.money,
                                          style: const TextStyle(
                                              color: Colors.black),
                                          cursorColor: Colors.grey.shade500,
                                          autofocus: false,
                                          keyboardType: TextInputType.number,
                                          onChanged: (value) {
                                            value = _formatNumber(
                                                value.replaceAll(',', ''));
                                            withDrawalCubit.money.value =
                                                TextEditingValue(
                                              text: value,
                                              selection:
                                                  TextSelection.collapsed(
                                                      offset: value.length),
                                            );
                                          },
                                          decoration: InputDecoration(
                                            fillColor: Colors.grey.shade500,
                                            prefixIconColor:
                                                Colors.grey.shade500,
                                            suffixIconColor:
                                                Colors.grey.shade500,
                                            hoverColor: Colors.grey.shade500,
                                            iconColor: Colors.grey.shade500,
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                borderSide: BorderSide(
                                                    color:
                                                        Colors.grey.shade500)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                borderSide: BorderSide(
                                                    color:
                                                        Colors.grey.shade500)),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                borderSide: BorderSide(
                                                    color:
                                                        Colors.grey.shade500)),
                                            focusColor: Colors.grey.shade500,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        Text(
                                          state.error!,
                                          style: const TextStyle(
                                              color: Colors.red),
                                        ),
                                        SizedBox(
                                          height: 60,
                                          width:
                                              MediaQuery.sizeOf(context).width,
                                          child: ElevatedButton(
                                              onPressed: () {
                                                withDrawalCubit
                                                    .orderWithDrawal(context);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                surfaceTintColor:
                                                    Colors.transparent,
                                                elevation: 0,
                                                // splashFactory: NoSplash.splashFactory,
                                                backgroundColor:
                                                    Colors.redAccent,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                              child: const Text(
                                                'Gửi yêu cầu',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                        return Center(
                          child: Text(
                              "Bạn cần thêm thông tin tài khoản ở mục Tài Khoản"),
                        );
                      }
                      return Center(
                        child: LoadingAnimationWidget.prograssiveDots(
                          color: const Color(0xfff6852c),
                          size: 40,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
