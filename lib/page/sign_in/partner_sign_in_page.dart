import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner_app/cubit/sign_in/sign_in_cubit.dart';
import 'package:partner_app/cubit/sign_in/sign_in_state.dart';
import 'package:partner_app/route/app_route.dart';

class PartnerSignInPage extends StatefulWidget {
  const PartnerSignInPage({super.key});

  @override
  State<PartnerSignInPage> createState() => _PartnerSignInPage();
}

class _PartnerSignInPage extends State<PartnerSignInPage> {
  late SignInPartnerCubit signInPartnerCubit;
  bool _passwordVisible = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    signInPartnerCubit = BlocProvider.of<SignInPartnerCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.login,
                      color: Colors.blue,
                      size: 128,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  'Số điện thoại',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: signInPartnerCubit.userName,
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
                  'Mật khẩu',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: signInPartnerCubit.passWord,
                  style: const TextStyle(color: Colors.black),
                  cursorColor: Colors.grey.shade300,
                  obscureText: !_passwordVisible,
                  autofocus: false,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey.shade300,
                      ),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
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
                BlocBuilder<SignInPartnerCubit, SignInPartnerState>(
                    bloc: signInPartnerCubit,
                    builder: (context, state) {
                      if (state is SignInPartnerError) {
                        return const Text(
                          'Thông tin đăng nhập không hợp lệ',
                          style: TextStyle(color: Colors.redAccent),
                        );
                      }
                      return const SizedBox();
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () async {
                          Navigator.pushNamed(
                              context, AppRouteUser.resetPasswordPage);
                        },
                        child: const Text(
                          'Quên mật khẩu?',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 60,
                  width: MediaQuery.sizeOf(context).width,
                  child: ElevatedButton(
                      onPressed: () => signInPartnerCubit.login(context),
                      style: ElevatedButton.styleFrom(
                        surfaceTintColor: Colors.transparent,
                        elevation: 0,
                        // splashFactory: NoSplash.splashFactory,
                        backgroundColor: const Color(0xFF4151b1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text(
                        'Đăng nhập',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Bạn chưa có tài khoản?',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, AppRouteUser.signUpPartner);
                        },
                        child: const Text(
                          'Đăng ký',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
