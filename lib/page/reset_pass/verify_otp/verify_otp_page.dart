import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner_app/constant/constant.dart';
import 'package:partner_app/cubit/reset_password/reset_password_cubit.dart';

class VerifyOtpPage extends StatefulWidget {
  const VerifyOtpPage({super.key, required this.verificationId});
  final String verificationId;

  @override
  State<VerifyOtpPage> createState() => _VerigyPasswordPageState();
}

class _VerigyPasswordPageState extends State<VerifyOtpPage> {
  late ResetPasswordCubit resetPasswordCubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    resetPasswordCubit = BlocProvider.of<ResetPasswordCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500,
              offset: const Offset(0, 2.0),
              blurRadius: 4.0,
            )
          ]),
          child: AppBar(
            foregroundColor: Colors.black,
            title: const Row(
              children: [
                Text(
                  "Nhập mã xác minh",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 24),
                ),
              ],
            ),
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
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(
            left: 24,
            top: 16,
            right: 24,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              const SizedBox(
                child: Text('Nhập mã xác minh được gửi về điện thoại của bạn.',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff868D95))),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  TextField(
                    controller: resetPasswordCubit.verifyOtpController,
                    textInputAction: TextInputAction.done,
                    style: const TextStyle(color: Colors.black),
                    cursorColor: Colors.grey.shade500,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade500,
                      prefixIconColor: Colors.grey.shade500,
                      suffixIconColor: Colors.grey.shade500,
                      hoverColor: Colors.grey.shade500,
                      iconColor: Colors.grey.shade500,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade500)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade500)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade500)),
                      focusColor: Colors.grey.shade500,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 48,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          backgroundColor: ThemeApp.lightMode.primaryColor,
                          disabledBackgroundColor:
                              ThemeApp.lightMode.primaryColor,
                          disabledForegroundColor:
                              ThemeApp.lightMode.primaryColor,
                          shadowColor: ThemeApp.lightMode.primaryColor,
                          textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        onPressed: () {
                          resetPasswordCubit.verifyOtp(
                              verificationId: widget.verificationId,
                              smsCode:
                                  resetPasswordCubit.verifyOtpController.text,
                              context: context);
                        },
                        child: const Text(
                          'Xác nhận',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        )),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
