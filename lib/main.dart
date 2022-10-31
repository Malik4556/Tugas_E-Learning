import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _messangerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: snackbarPage(),
      home: Scaffold(
        //  key: _messangerKey,
        appBar: AppBar(title: (Text("login Sederhana E-learning"))),
        body: MyLogin(),
      ),
    );
  }
}

/////

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {

  final snackBar = SnackBar(
    content: const Text(''),
    action: SnackBarAction(
      label: '',
      onPressed: () {
      },
    ),
  );

  bool visibilityPass = false;

  final String user = 'jamjam';
  final String pass = '12345';

  TextEditingController cUser = TextEditingController();
  TextEditingController cPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
                child: const CircleAvatar(
                  backgroundImage: AssetImage(
                    'images/icon.png',
                  ),
                  backgroundColor: Colors.white,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                child: Text('Login', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),),

              ),
              Container(
                padding: EdgeInsets.all(15),
                child: Column(children: [
                  TextField(
                    controller: cUser,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1.5)),
                        labelText: 'Username',
                        hintText: 'Input Username Anda',
                        prefixIcon: Icon(Icons.person),),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: cPass,
                    obscureText: !visibilityPass,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1.5)),
                      labelText: 'Password',
                      hintText: 'Input Password Anda',
                      prefixIcon: Icon(Icons.lock),
                    //   suffixIcon: IconButton(
                    //       onPressed: () {
                    //         setState(() {
                    //            visibilityPass=!visibilityPass;
                    //         });
                    //       },
                    //   //     icon: visibilityPass
                    //   //         ? Icon(Icons.visibility)
                    //   //         : Icon(Icons.visibility_off))),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        CekLogin(context);
                      },
                      child: Text('LOGIN', 
                      style: TextStyle(fontSize: 25),), 
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(250, 50)),
                        ),
                ]),
              )
            ],
          ),
        );
  }

  void CekLogin(BuildContext context) {
    // final String user = 'jamjam';
    // final String pass = '12345';

    if (cUser.text == user && cPass.text == pass) {
       Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));

    } else if (cUser.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Username Harus Diisi'),
          backgroundColor: Colors.blue,
        ),
      );

      } else if (cPass.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password Harus Diisi'),
          backgroundColor: Colors.blue,
        ),
      );
      
      // } else if (cUser.text.isNotEmpty) {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //     content: Text('Username Salah'),
      //     backgroundColor: Colors.blue,
      //   ),
      // );

      // } else if (cPass.text.isNotEmpty) {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //     content: Text('Passwor Salah'),
      //     backgroundColor: Colors.blue,
      //   ),
      // );

    } else  {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('User dan Password Anda Salah'),
          backgroundColor: Colors.blue,
        ),
      );
    }
  }
}
