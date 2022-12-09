import 'package:flutter/material.dart';
import 'result.dart';
import 'login.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences ob = await SharedPreferences.getInstance();
  var name = ob.getString('n');
  var password1 = ob.getString('p1');
  var email1 = ob.getString('e1');
  var password2 = ob.getString('p2');
  var email2 = ob.getString('e2');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(
        home:SignIn(),
      ),
    );
  }
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('data'),
      ),
    );
  }
}