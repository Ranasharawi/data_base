import 'package:flutter/material.dart';

import 'home_layout.dart';
import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  runApp(MyApp());
  MyApp app = MyApp();
}
//stateless
//stateful
//class My app
class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
      ),
      home: Login(),
    );

  }


}
