import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:partner_app/constant/constant.dart';
import 'package:partner_app/data/model/permanent_model.dart';
import 'package:partner_app/route/app_route.dart';

class PermanentHistoryItem extends StatefulWidget {
  const PermanentHistoryItem({super.key, required this.item});
  final PermanentModel item;
  @override
  State<PermanentHistoryItem> createState() => _PermanentHistoryItemState();
}

class _PermanentHistoryItemState extends State<PermanentHistoryItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRouteUser.permanentHistoryDetail,
            arguments: widget.item);
      },
      child: Container(
        margin: const EdgeInsets.only(top: 16),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.item.taskId!.name!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                  Container(
                    padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.greenAccent.withOpacity(0.5)),
                    child: Text(
                      widget.item.status == 0
                          ? 'Đang chờ'
                          : widget.item.status == 1
                              ? 'Đã nhận đơn'
                              : 'Đã hoàn thành',
                      style:
                          TextStyle(color: Colors.green.shade600, fontSize: 11),
                    ),
                  )
                ],
              ),
            ),
            Divider(
              height: 1,
              color: Colors.grey.shade300,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.task,
                        color: Color(0xfff6852c),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                          child: Text(
                              'Thứ năm, ${DateFormat('dd-MM-yyyy').format(widget.item.date![0])} - thứ sáu, ${DateFormat('dd-MM-yyyy').format(widget.item.date![widget.item.date!.length - 1])}'))
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.check_circle_outline,
                        color: Color(0xfff6852c),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                          child: Text(
                              '${(widget.item.taskId!.estimateTime! / 60).round()} giờ, ${(widget.item.time! / 60).round()}:00 đến ${(widget.item.time! / 60 + widget.item.taskId!.estimateTime! / 60).round()}:00'))
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.monetization_on_outlined,
                        color: Color(0xfff6852c),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                          child: Text(
                              '${AppConstant.oCcy.format(widget.item.price)} VND'))
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.place_outlined,
                        color: Color(0xfff6852c),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Text('${widget.item.taskId!.address}'),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
              color: Colors.grey.shade300,
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage:
                        AssetImage("assets/icons/logo_company.jpeg"),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text('Công ty A')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
