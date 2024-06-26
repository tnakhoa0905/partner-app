import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner_app/constant/constant.dart';
import 'package:partner_app/cubit/reset_password/reset_password_cubit.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  late ResetPasswordCubit resetPasswordCubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    resetPasswordCubit = BlocProvider.of<ResetPasswordCubit>(context);
    BlocProvider.of<ResetPasswordCubit>(context).init();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
            title: Row(
              children: [
                Text(
                  "Đổi mật khẩu",
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
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 24,
              ),
              const SizedBox(
                child: Text('Nhập số điện thoại để lấy lại mật khẩu.',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff868D95))),
              ),
              const SizedBox(
                height: 24,
              ),
              Column(
                children: [
                  TextField(
                    controller: resetPasswordCubit.phoneNumberController,
                    textInputAction: TextInputAction.done,
                    // obscureText: !_passwordVisible,
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
                  const SizedBox(height: 30),
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
                          resetPasswordCubit.veryfiPhone(context);
                        },
                        child: const Text(
                          "Nhận OTP",
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
