import 'package:flutter/material.dart';
import 'package:new_bussiness_app/modules/login_screens/presentaition/Login_or_register.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                'مرحبا بكم فى تطبيق محطة الاعمال',
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(3),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: 150,
                    color: Colors.deepOrange[400],
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LogInOrRegister(
                                      selectPage: 1,
                                    )));
                      },
                      //style:  ButtonStyle(backgroundColor: Color(0xFF2F2F75)),
                      child: const Text(
                        'حساب جديد',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: 150,
                    color: const Color(0xFF2F2F75),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LogInOrRegister(
                                      selectPage: 0,
                                    )));
                      },
                      //style:  ButtonStyle(backgroundColor: Color(0xFF2F2F75)),
                      child: const Text(
                        'تسجيل الدخول',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // ignore: prefer_const_constructors
          SizedBox(height: 10),
          const Card(
            elevation: 0.5,
            child: ListTile(
              title: Text(
                'عن التطبيق',
                textDirection: TextDirection.rtl,
              ),
              trailing: Icon(Icons.info_outline),
            ),
          ),
          const Card(
            elevation: 0.5,
            child: ListTile(
              title: Text(
                'الشروط الاحكام',
                textDirection: TextDirection.rtl,
              ),
              trailing: Icon(Icons.policy_outlined),
            ),
          ),
          const Card(
            elevation: 0.5,
            child: ListTile(
              title: Text(
                'سياسة الخصوصية',
                textDirection: TextDirection.rtl,
              ),
              trailing: Icon(Icons.privacy_tip_outlined),
            ),
          ),
          const Card(
            elevation: 0.5,
            child: ListTile(
              title: Text(
                'تواص معنا',
                textDirection: TextDirection.rtl,
                style: TextStyle(color: Colors.black87),
              ),
              trailing: Icon(Icons.contact_support_outlined),
            ),
          ),
        ],
      ),
    );
  }
}
