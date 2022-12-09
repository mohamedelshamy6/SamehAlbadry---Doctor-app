import 'package:flutter/material.dart';
import 'main.dart';
import 'package:shared_preferences/shared_preferences.dart';

var passwordcontroller1 = TextEditingController();
var passwordcontroller2 = TextEditingController();
var emailcontroller1 = TextEditingController();
var emailcontroller2 = TextEditingController();
var namecontroller = TextEditingController();

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  void createnewaccount(BuildContext ctx) {
    Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
      return SignIn();
    }));
  }

  bool visible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(10, 80, 10, 50),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'create account',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                          child: Text(
                            'Already have account?',
                            style: TextStyle(
                                fontSize: 15, color: Colors.greenAccent),
                          ),
                          onTap: () {
                            createnewaccount(context);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
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
              height: 10,
            ),
            Container(
              width: double.infinity,
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Email Adress',
                    hintStyle: TextStyle(fontSize: 15),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.greenAccent, width: 0)),
                    prefixIcon: Icon(Icons.email)),
                keyboardType: TextInputType.emailAddress,
                controller: emailcontroller1,
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
                  hintStyle: TextStyle(fontSize: 15),enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.greenAccent, width: 0)),
                  suffixIcon: IconButton(
                    icon:
                        Icon(visible ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        visible = !visible;
                      });
                    },
                  ),
                ),
                keyboardType: TextInputType.visiblePassword,
                obscureText: visible,
                controller: passwordcontroller1,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Builder(builder: (ctx) {
              return Container(
                height: 50,
                width: double.infinity,
                margin: EdgeInsets.all(15.0),
                child: ElevatedButton(
                  onPressed: () async {
                    SharedPreferences ob =
                        await SharedPreferences.getInstance();
                    ob.setString('n', namecontroller.text);
                    ob.setString('e1', emailcontroller1.text);
                    ob.setString('p1', passwordcontroller1.text);
                    
                  },
                  child: Text(
                    'SIGN IN',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green)),
                ),
              );
            }),
            Text(
              softWrap: true,
              ' By Signing Up you agree to join our Terms conditions & privacy policy.',
              style: TextStyle(fontSize: 15),
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
          ]),
        ),
      ),
    );
  }
}