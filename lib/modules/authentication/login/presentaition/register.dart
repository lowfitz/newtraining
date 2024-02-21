import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Register extends StatefulWidget {
  Register({super.key, required this.currentIndex});
  int currentIndex = 1;
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  void initState() {
    widget.currentIndex = _currentIndex;
    super.initState();
  }

  final int _currentIndex = 1;
  bool isSecure = true;
  var bottonColor = Colors.deepOrange[400];
  var textColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: ListView(
          // physics: NeverScrollableScrollPhysics(),
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Text('رقم الجوال   ')],
              ),
            ),
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: TextFormField(
                textAlign: TextAlign.end,
                textAlignVertical: TextAlignVertical.bottom,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  suffixIcon: const Icon(Icons.phone_in_talk_outlined),
                  prefix: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        SizedBox(
                            //padding: const EdgeInsets.only(top: 10),
                            width: 30,
                            child: CircleAvatar(
                              child: Image.asset('assets/images/qatar-fl.png'),
                            )),
                        const Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            '974+',
                            style: TextStyle(fontSize: 10),
                          ),
                        )
                      ],
                    ),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  hoverColor: bottonColor,
                  fillColor: bottonColor,
                  focusColor: bottonColor,
                  hintText: 'رقم الجوال',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Text('كلمة المرور   ')],
              ),
            ),
            Container(
              height: 50,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: TextFormField(
                obscureText: isSecure,
                textAlign: TextAlign.end,
                textAlignVertical: TextAlignVertical.bottom,
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.lock_outline),
                  prefix: IconButton(
                    icon: obSecureToggle(),
                    onPressed: () {},
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  hintText: 'كلمة المرور',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 100,
                    width: 250,
                    color: Colors.deepOrange[400],
                    child: TextButton(
                      child: const Text(
                        'تسجيل الدخول',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget obSecureToggle() {
    return IconButton(
      onPressed: () {
        setState(() {
          isSecure = !isSecure;
        });
      },
      icon: isSecure
          ? const Icon(Icons.visibility)
          : const Icon(Icons.visibility_off),
      color: Colors.grey,
    );
  }
}
