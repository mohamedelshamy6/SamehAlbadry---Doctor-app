import 'package:flutter/material.dart';
import 'main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'result.dart';
class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  void createnewaccount(BuildContext ctx) {
    Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
      return MyHomePage();
    }));
  }

  bool visible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 150, 10, 50),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

              Container(
              width: double.infinity,
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Full Name',
                    hintStyle: TextStyle(fontSize: 15),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.greenAccent, width: 0)),
                    prefixIcon: Icon(Icons.person)),
                keyboardType: TextInputType.text,
                controller: namecontroller,
              ),
            ),
               
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Email Adress',
                      hintStyle: TextStyle(fontSize: 15),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.greenAccent, width: 3)),
                      prefixIcon: IconButton(
                        icon: Icon(Icons.email),
                        onPressed: (() {}),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'password',
                      hintStyle: TextStyle(fontSize: 15),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.greenAccent, width: 3)),
                      suffixIcon: IconButton(
                        icon: Icon(
                            visible ? Icons.visibility : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            visible = !visible;
                          });},
                      ),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: visible,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Text(
                      'forget password?',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Builder(
                  builder: (ctx) {
                    return Container(
                      height: 50,
                      width: double.infinity,
                      margin: EdgeInsets.all(8.0),
                      child: ElevatedButton(
                         onPressed: () async {
                    SharedPreferences ob =
                        await SharedPreferences.getInstance();
                    ob.setString('n', namecontroller.text);
                    ob.setString('e1', passwordcontroller2.text);
                    ob.setString('p1', emailcontroller2.text);
                    
                  },
                        child: Text(
                          'Log IN',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green)),
                      ),
                    );
                  }
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have account?'),
                    InkWell(
                      child: Text(
                        '   create new account.',
                        style: TextStyle(color: Colors.greenAccent),
                      ),
                      onTap: () {
                        createnewaccount(context);
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Or',
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.facebook),
                      label: Text(
                        'connect with facebook',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 33, 37, 243)),
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.gpp_maybe_outlined),
                      label: Text(
                        'connect with Google',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}