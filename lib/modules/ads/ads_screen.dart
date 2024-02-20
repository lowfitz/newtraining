import 'package:flutter/material.dart';
import 'package:new_bussiness_app/widgets/reusable_widgets.dart';

class Ads extends StatefulWidget {
  const Ads({super.key});

  @override
  State<Ads> createState() => _AdsState();
}

class _AdsState extends State<Ads> {
  int _index = 0;

  var bottonColor = Colors.deepOrange[400];
  var textColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Card(
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Card(
                        elevation: _index == 1 ? 4 : 0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            color: _index == 1 ? bottonColor : Colors.white,
                            height: 40,
                            width: 140,
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  _index = 1;
                                });
                              },
                              child: Text(
                                'منشور',
                                style: TextStyle(
                                    fontSize: 12,
                                    color:
                                        _index == 1 ? textColor : Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Card(
                        shadowColor: Colors.deepOrange[400],
                        elevation: _index == 0 ? 3 : 0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: SizedBox(
                            height: 40,
                            width: 140,
                            child: Container(
                              color: _index == 0 ? bottonColor : Colors.white,
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    _index = 0;
                                  });
                                },
                                child: Text(
                                  'قيد المراجعة',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: _index == 0
                                          ? textColor
                                          : Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        Expanded(
            child: _index == 0
                ? const SizedBox(
                    height: 200,
                    child: AdsGridView(
                      selectedIndez: 0,
                    ))
                : const SizedBox(
                    height: 200,
                    child: AdsGridView(
                      selectedIndez: 1,
                    )))
        //     ? SizedBox(/*height: 200, child: ReusableGridView()*/)
        //     : const SizedBox(height: 200, child: ReusableGridView()),
        // const SizedBox(height: 200, child: ReusableGridView()),
        // const SizedBox(height: 200, child: ReusableGridView()),
      ],
    ));
  }
}
