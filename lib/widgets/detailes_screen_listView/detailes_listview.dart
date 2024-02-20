import 'package:flutter/material.dart';

class DetailesListView extends StatefulWidget {
  const DetailesListView({super.key});

  @override
  State<DetailesListView> createState() => _DetailesListViewState();
}

class _DetailesListViewState extends State<DetailesListView> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 5),
                child: Container(
                  height: 30,
                  width: double.infinity,
                  color:
                      index % 2 == 0 ? const Color(0xfff4f6f8) : Colors.white,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Row(children: [
                      Text('لا يوجد'),
                      Spacer(),
                      Text('قيمة الرواتب')
                    ]),
                  ),
                ),
              )),
    ]);
  }
}
