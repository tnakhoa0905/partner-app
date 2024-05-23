import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner_app/constant/constant.dart';
import 'package:partner_app/cubit/edit_profile/edit_profile_cubit.dart';
import 'package:partner_app/cubit/edit_profile/edit_profile_state.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late EditProfileCubit editProfileCubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<EditProfileCubit>(context).init(context);
    editProfileCubit = BlocProvider.of<EditProfileCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              offset: const Offset(0, 2.0),
              blurRadius: 4.0,
            )
          ]),
          child: AppBar(
            foregroundColor: Colors.black,
            title: const Text('Cập nhật thông tin',
                style: TextStyle(fontWeight: FontWeight.bold)),
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
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundImage: NetworkImage(
                              "${UrlApiAppUser.host}${editProfileCubit.userModel!.avatar!}"),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                shape: BoxShape.circle),
                            child: const Icon(Icons.camera_alt),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  'Họ và tên',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: editProfileCubit.fullNameController,
                  textInputAction: TextInputAction.done,
                  style: const TextStyle(color: Colors.black),
                  cursorColor: Colors.grey.shade300,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade300,
                    prefixIconColor: Colors.grey.shade300,
                    suffixIconColor: Colors.grey.shade300,
                    hoverColor: Colors.grey.shade300,
                    iconColor: Colors.grey.shade300,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300)),
                    focusColor: Colors.grey.shade300,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  'Email',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: editProfileCubit.emailController,
                  textInputAction: TextInputAction.done,
                  style: const TextStyle(color: Colors.black),
                  cursorColor: Colors.grey.shade300,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade300,
                    prefixIconColor: Colors.grey.shade300,
                    suffixIconColor: Colors.grey.shade300,
                    hoverColor: Colors.grey.shade300,
                    iconColor: Colors.grey.shade300,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300)),
                    focusColor: Colors.grey.shade300,
                  ),
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
                  controller: editProfileCubit.phoneNumberController,
                  textInputAction: TextInputAction.done,
                  style: const TextStyle(color: Colors.black),
                  cursorColor: Colors.grey.shade300,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade300,
                    prefixIconColor: Colors.grey.shade300,
                    suffixIconColor: Colors.grey.shade300,
                    hoverColor: Colors.grey.shade300,
                    iconColor: Colors.grey.shade300,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300)),
                    focusColor: Colors.grey.shade300,
                  ),
                ),
                // const SizedBox(
                //   height: 24,
                // ),
                // const Text(
                //   'Mật khẩu',
                //   style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                // ),
                // const SizedBox(
                //   height: 8,
                // ),
                // TextField(
                //   controller: editProfileCubit.passwordController,
                //   textInputAction: TextInputAction.done,
                //   style: const TextStyle(color: Colors.black),
                //   cursorColor: Colors.grey.shade300,
                //   decoration: InputDecoration(
                //     fillColor: Colors.grey.shade300,
                //     prefixIconColor: Colors.grey.shade300,
                //     suffixIconColor: Colors.grey.shade300,
                //     hoverColor: Colors.grey.shade300,
                //     iconColor: Colors.grey.shade300,
                //     border: OutlineInputBorder(
                //         borderSide: BorderSide(color: Colors.grey.shade300)),
                //     focusedBorder: OutlineInputBorder(
                //         borderSide: BorderSide(color: Colors.grey.shade300)),
                //     enabledBorder: OutlineInputBorder(
                //         borderSide: BorderSide(color: Colors.grey.shade300)),
                //     focusColor: Colors.grey.shade300,
                //   ),
                // ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () => editProfileCubit.updateProfile(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade200,
                        overlayColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        // padding: const EdgeInsets.only(top: 16, bottom: 16)
                      ),
                      child: Center(
                        child: BlocConsumer<EditProfileCubit, EditProfileState>(
                            bloc: editProfileCubit,
                            listener: (context, state) {},
                            builder: (context, state) {
                              if (state is EditProfileUpdating) {
                                return const CircularProgressIndicator(
                                  strokeWidth: 3,
                                  color: Colors.green,
                                );
                              }
                              return const Text(
                                'Thay đổi',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              );
                            }),
                      )),
                )
              ],
            )),
      ),
    );
  }
}
