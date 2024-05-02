import 'package:partner_app/components/back_ground.dart';
import 'package:flutter/material.dart';

class PartnerSignUpPage extends StatefulWidget {
  const PartnerSignUpPage({super.key});

  @override
  State<PartnerSignUpPage> createState() => _PartnerSignUpPage();
}

class _PartnerSignUpPage extends State<PartnerSignUpPage> {
  TextEditingController fullNameController = TextEditingController(text: '');
  TextEditingController phoneNumberController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGround(
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(16),
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
                    'Đăng ký',
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
                height: 16,
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      'Rất vui được gặp bạn',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Tạo ngay tài khoản để trải nghiệm dịch vụ',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      'Họ và tên',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextField(
                      controller: fullNameController,
                      style: TextStyle(color: Colors.black),
                      cursorColor: Colors.grey.shade300,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade300,
                        prefixIconColor: Colors.grey.shade300,
                        suffixIconColor: Colors.grey.shade300,
                        hoverColor: Colors.grey.shade300,
                        iconColor: Colors.grey.shade300,
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey.shade300)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey.shade300)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey.shade300)),
                        focusColor: Colors.grey.shade300,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      'Số điện thoại',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextField(
                      controller: phoneNumberController,
                      style: const TextStyle(color: Colors.black),
                      cursorColor: Colors.grey.shade300,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade300,
                        prefixIconColor: Colors.grey.shade300,
                        suffixIconColor: Colors.grey.shade300,
                        hoverColor: Colors.grey.shade300,
                        iconColor: Colors.grey.shade300,
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey.shade300)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey.shade300)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey.shade300)),
                        focusColor: Colors.grey.shade300,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      'Email',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextField(
                      controller: emailController,
                      style: TextStyle(color: Colors.black),
                      cursorColor: Colors.grey.shade300,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade300,
                        prefixIconColor: Colors.grey.shade300,
                        suffixIconColor: Colors.grey.shade300,
                        hoverColor: Colors.grey.shade300,
                        iconColor: Colors.grey.shade300,
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey.shade300)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey.shade300)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey.shade300)),
                        focusColor: Colors.grey.shade300,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      height: 60,
                      width: MediaQuery.sizeOf(context).width,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xfff6852c),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: const Text(
                            'Đăng ký',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
