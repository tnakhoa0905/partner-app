import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:partner_app/components/back_ground.dart';
import 'package:partner_app/cubit/banking_info/banking_info_cubit.dart';
import 'package:partner_app/cubit/banking_info/banking_info_state.dart';

class BankingInfoPage extends StatefulWidget {
  const BankingInfoPage({super.key});

  @override
  State<BankingInfoPage> createState() => _BankingInfoPageState();
}

class _BankingInfoPageState extends State<BankingInfoPage> {
  late BankingInfoCubit bankingInfoCubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bankingInfoCubit = BlocProvider.of<BankingInfoCubit>(context);
    BlocProvider.of<BankingInfoCubit>(context).init();
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
                      'Cài đặt tài khoản',
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
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16)),
                    child: SingleChildScrollView(
                      child: BlocConsumer<BankingInfoCubit, BankingInfoState>(
                        bloc: bankingInfoCubit,
                        listener: (context, state) {},
                        builder: (context, state) {
                          if (state is BankingInfoLoaded) {
                            if (bankingInfoCubit.bankAccountModel != null) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 24,
                                  ),
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
                                    controller: bankingInfoCubit.stk,
                                    style: const TextStyle(color: Colors.black),
                                    cursorColor: Colors.grey.shade300,
                                    autofocus: false,
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      fillColor: Colors.grey.shade300,
                                      prefixIconColor: Colors.grey.shade300,
                                      suffixIconColor: Colors.grey.shade300,
                                      hoverColor: Colors.grey.shade300,
                                      iconColor: Colors.grey.shade300,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          borderSide: const BorderSide(
                                              color: Colors.black)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          borderSide: const BorderSide(
                                              color: Colors.black)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          borderSide: const BorderSide(
                                              color: Colors.black)),
                                      focusColor: Colors.grey.shade300,
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
                                  // DropdownButtonFormField2<String>(
                                  //   // isDense: false,
                                  //   isExpanded: false,
                                  //   decoration: InputDecoration(
                                  //     contentPadding:
                                  //         const EdgeInsets.symmetric(
                                  //             vertical: 16),
                                  //     border: OutlineInputBorder(
                                  //       borderRadius: BorderRadius.circular(15),
                                  //     ),
                                  //     // Add more decoration..
                                  //   ),
                                  //   hint: const Text(
                                  //     'Chọn ngân hàng',
                                  //     style: TextStyle(fontSize: 14),
                                  //   ),
                                  //   items: bankingInfoCubit.listBanking
                                  //       .map((item) => DropdownMenuItem<String>(
                                  //             value: item.shortName,
                                  //             child: Row(
                                  //               children: [
                                  //                 Image.network(
                                  //                     width: 40,
                                  //                     height: 40,
                                  //                     item.logo!),
                                  //                 Text(
                                  //                   item.shortName!,
                                  //                   style: const TextStyle(
                                  //                     fontSize: 14,
                                  //                   ),
                                  //                 ),
                                  //               ],
                                  //             ),
                                  //           ))
                                  //       .toList(),
                                  //   validator: (value) {
                                  //     if (value == null) {
                                  //       return 'Please select gender.';
                                  //     }
                                  //     return null;
                                  //   },
                                  //   onChanged: (value) {
                                  //     //Do something when selected item is changed.
                                  //   },
                                  //   onSaved: (value) {
                                  //     // selectedValue = value.toString();
                                  //   },
                                  //   buttonStyleData: const ButtonStyleData(
                                  //     padding: EdgeInsets.only(right: 8),
                                  //   ),
                                  //   iconStyleData: const IconStyleData(
                                  //     icon: Icon(
                                  //       Icons.arrow_drop_down,
                                  //       color: Colors.black45,
                                  //     ),
                                  //     iconSize: 24,
                                  //   ),
                                  //   dropdownStyleData: DropdownStyleData(
                                  //     maxHeight: 300,
                                  //     decoration: BoxDecoration(
                                  //       borderRadius: BorderRadius.circular(15),
                                  //     ),
                                  //   ),
                                  //   menuItemStyleData: const MenuItemStyleData(
                                  //     padding:
                                  //         EdgeInsets.symmetric(horizontal: 16),
                                  //   ),
                                  // ),
                                  // const SizedBox(
                                  //   height: 8,
                                  // ),
                                  TextField(
                                    controller: bankingInfoCubit.nameBank,
                                    style: const TextStyle(color: Colors.black),
                                    cursorColor: Colors.grey.shade300,
                                    autofocus: false,
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      fillColor: Colors.grey.shade300,
                                      prefixIconColor: Colors.grey.shade300,
                                      suffixIconColor: Colors.grey.shade300,
                                      hoverColor: Colors.grey.shade300,
                                      iconColor: Colors.grey.shade300,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          borderSide: const BorderSide(
                                              color: Colors.black)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          borderSide: const BorderSide(
                                              color: Colors.black)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          borderSide: const BorderSide(
                                              color: Colors.black)),
                                      focusColor: Colors.grey.shade300,
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
                                    controller: bankingInfoCubit.name,
                                    style: const TextStyle(color: Colors.black),
                                    cursorColor: Colors.grey.shade300,
                                    autofocus: false,
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      fillColor: Colors.grey.shade300,
                                      prefixIconColor: Colors.grey.shade300,
                                      suffixIconColor: Colors.grey.shade300,
                                      hoverColor: Colors.grey.shade300,
                                      iconColor: Colors.grey.shade300,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          borderSide: const BorderSide(
                                              color: Colors.black)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          borderSide: const BorderSide(
                                              color: Colors.black)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          borderSide: const BorderSide(
                                              color: Colors.black)),
                                      focusColor: Colors.grey.shade300,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  const Text(
                                      'Bạn chỉ được cập nhật một lần, vui lòng liên hệ công ty để thay đổi.'),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                ],
                              );
                            }
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 24,
                                ),
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
                                  controller: bankingInfoCubit.stk,
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
                                        borderSide: const BorderSide(
                                            color: Colors.black)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide: const BorderSide(
                                            color: Colors.black)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide: const BorderSide(
                                            color: Colors.black)),
                                    focusColor: Colors.grey.shade300,
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
                                DropdownButtonFormField2<String>(
                                  // isDense: false,
                                  isExpanded: false,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 16),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    // Add more decoration..
                                  ),
                                  hint: const Text(
                                    'Chọn ngân hàng',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  items: bankingInfoCubit.listBanking
                                      .map((item) => DropdownMenuItem<String>(
                                            value: item.shortName,
                                            child: Row(
                                              children: [
                                                Image.network(
                                                    width: 40,
                                                    height: 40,
                                                    item.logo!),
                                                Text(
                                                  item.shortName!,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ))
                                      .toList(),
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please select gender.';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    //Do something when selected item is changed.
                                    bankingInfoCubit.nameBank.text =
                                        value.toString();
                                    print(bankingInfoCubit.nameBank.text);
                                  },
                                  onSaved: (value) {
                                    bankingInfoCubit.nameBank.text =
                                        value.toString();
                                    print(bankingInfoCubit.nameBank.text);
                                  },
                                  buttonStyleData: const ButtonStyleData(
                                    padding: EdgeInsets.only(right: 8),
                                  ),
                                  iconStyleData: const IconStyleData(
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    iconSize: 24,
                                  ),
                                  dropdownStyleData: DropdownStyleData(
                                    maxHeight: 300,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  menuItemStyleData: const MenuItemStyleData(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                // TextField(
                                //   controller: bankingInfoCubit.nameBank,
                                //   style: const TextStyle(color: Colors.black),
                                //   cursorColor: Colors.grey.shade300,
                                //   autofocus: false,
                                //   decoration: InputDecoration(
                                //     fillColor: Colors.grey.shade300,
                                //     prefixIconColor: Colors.grey.shade300,
                                //     suffixIconColor: Colors.grey.shade300,
                                //     hoverColor: Colors.grey.shade300,
                                //     iconColor: Colors.grey.shade300,
                                //     border: OutlineInputBorder(
                                //         borderRadius: BorderRadius.circular(16),
                                //         borderSide: const BorderSide(
                                //             color: Colors.black)),
                                //     focusedBorder: OutlineInputBorder(
                                //         borderRadius: BorderRadius.circular(16),
                                //         borderSide: const BorderSide(
                                //             color: Colors.black)),
                                //     enabledBorder: OutlineInputBorder(
                                //         borderRadius: BorderRadius.circular(16),
                                //         borderSide: const BorderSide(
                                //             color: Colors.black)),
                                //     focusColor: Colors.grey.shade300,
                                //   ),
                                // ),
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
                                  controller: bankingInfoCubit.name,
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
                                        borderSide: const BorderSide(
                                            color: Colors.black)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide: const BorderSide(
                                            color: Colors.black)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide: const BorderSide(
                                            color: Colors.black)),
                                    focusColor: Colors.grey.shade300,
                                  ),
                                ),

                                Text(
                                  state.error!,
                                  style:
                                      const TextStyle(color: Colors.redAccent),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                const Text(
                                    'Bạn chỉ được cập nhật một lần, vui lòng liên hệ công ty để thay đổi.'),
                                const SizedBox(
                                  height: 16,
                                ),
                                SizedBox(
                                  height: 60,
                                  width: MediaQuery.sizeOf(context).width,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        bankingInfoCubit.createBanking();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        surfaceTintColor: Colors.transparent,
                                        elevation: 0,
                                        // splashFactory: NoSplash.splashFactory,
                                        backgroundColor: Colors.redAccent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                      child: const Text(
                                        'Xác nhận',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )),
                                ),
                              ],
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
