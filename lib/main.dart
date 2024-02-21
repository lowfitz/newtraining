import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_bussiness_app/General/utils.dart';
import 'package:new_bussiness_app/data/remote/dio_service.dart';
import 'package:new_bussiness_app/modules/home/presentaion/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalData.cacheInitiolization();
  Utils.getToken();
  DioService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF2F2F75),
          ),
          primaryColor: const Color(0xFF2F2F75),
          textTheme: GoogleFonts.cairoTextTheme(Theme.of(context).textTheme)),
      home: const Home(),
      builder: FlutterSmartDialog.init(),
    );
  }
}
