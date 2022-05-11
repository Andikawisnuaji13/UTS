import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ulangantengahsemester_andikawisnuaji/home_screen.dart';
import 'package:ulangantengahsemester_andikawisnuaji/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool hidePass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
              child: Image.asset(
            'images/logo.png',
            height: 200,
          )),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text(
              'Welcome Back!',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 30),
            child: Text('Login in to your existart account of Q Alure'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            child: TextFormField(
              controller: userNameController,
              decoration: InputDecoration(
                  label: Text('Username'),
                  hintText: 'Masukkan username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  prefixIcon: Icon(
                    Icons.person,
                    size: 30,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            child: TextFormField(
              controller: passwordController,
              obscureText: hidePass,
              decoration: InputDecoration(
                label: Text('Password'),
                hintText: 'Masukkan password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    print('hide pass = $hidePass');
                    setState(() {
                      hidePass = !hidePass;
                    });
                  },
                  icon:
                      Icon(hidePass ? Icons.visibility : Icons.visibility_off),
                ),
                prefixIcon: Icon(
                  Icons.lock,
                  size: 30,
                ),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(230, 0, 0, 10),
              child: GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('fitur dalam pengembangan'),
                  ));
                },
                child: Text('Forgot Password?'),
              )),
          SizedBox(
            width: 180,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  primary: Color.fromARGB(255, 22, 77, 173)),
              onPressed: () {
                if (userNameController.text == 'user_uts' &&
                    passwordController.text == "pass_uts") {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('berhasil login'),
                    ),
                  );

                  var box = Hive.box('userBox');
                  box.put('isLogin', true);

                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => HomeScreen()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('username atau password salah'),
                    ),
                  );
                }
              },
              child: Text('Login'),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(top: 30),
              child: Text('Or Connect Using'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: SizedBox(
                  width: 150,
                  height: 40,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          primary: Color.fromARGB(255, 0, 80, 145)),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('fitur dalam pengembangan')));
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.facebook,
                            size: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text('facebook'),
                          ),
                        ],
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: SizedBox(
                  width: 150,
                  height: 40,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          primary: Colors.red),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('fitur dalam pengembangan')));
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            'images/gg.jpg',
                            width: 20,
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text('google'),
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text(
                    'Dont have an account?',
                  )),
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => SignUp_Screen()),
                      );
                    },
                    child:
                        Text('Sign Up', style: TextStyle(color: Colors.blue))),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
