import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTicket extends StatefulWidget {
  const CustomTicket({super.key});

  @override
  State<CustomTicket> createState() => _CustomTicketState();
}

class _CustomTicketState extends State<CustomTicket> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        flex: 1,
        child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0)),
            child: Image.network(
                'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
                fit: BoxFit.cover,
                // color: Colors.white,
                width: 1000)),
      ),
      Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.all(8),
            // ignore: prefer_const_constructors
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Giảm giá 30,000VND cho dịch vụ Dọn dẹp nhà',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'bTaskee',
                  style: TextStyle(color: Colors.grey),
                ),
                Row(
                  children: [
                    Text(
                      '150',
                      style: TextStyle(
                          color: Colors.orange, fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          ))
    ]);
  }
}
// Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Container(
        //       width: 10,
        //       height: 10,
        //       decoration: const BoxDecoration(
        //           color: Colors.transparent,
        //           borderRadius:
        //               BorderRadius.only(topRight: Radius.circular(50)),
        //           border: Border(
        //               top: BorderSide(width: 1, color: Colors.grey),
        //               right: BorderSide(width: 1, color: Colors.grey))),
        //     ),
        //     Container(
        //       width: 10,
        //       height: 11,
        //       decoration: const BoxDecoration(
        //           color: Colors.transparent,
        //           borderRadius:
        //               BorderRadius.only(bottomRight: Radius.circular(50)),
        //           border: Border(
        //               bottom: BorderSide(width: 1, color: Colors.grey),
        //               right: BorderSide(width: 1, color: Colors.grey))),
        //     )
        //   ],
        // ),
        // Align(
        //   alignment: Alignment.centerRight,
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Container(
        //         width: 10,
        //         height: 20,
        //         // transform: Matrix4.translationValues(0.8, 0, 1),
        //         decoration: BoxDecoration(
        //           color: Colors.grey.shade100,
        //           borderRadius: BorderRadius.only(
        //               topLeft: Radius.circular(50),
        //               bottomLeft: Radius.circular(50)),
        //           // border: Border(
        //           //     bottom:
        //           //         BorderSide(width: 1, color: Colors.grey.shade500),
        //           //     right: BorderSide.none,
        //           //     top: BorderSide(width: 1, color: Colors.grey.shade500),
        //           //     left:
        //           //         BorderSide(width: 1, color: Colors.grey.shade500))
        //         ),
        //       ),
        //     ],
        //   ),
        // )