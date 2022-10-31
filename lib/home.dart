import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Akhirnya Berhasil', 
            style: TextStyle(
              fontWeight: FontWeight.bold, 
              fontSize: 30),
              ),
            const SizedBox(
                    height: 50,
                  ),
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.blue,
              child: const Text("Kembali", 
              style: TextStyle(
                color: Colors.white, 
                fontSize: 25,)), 
            )
          ],
        ),
      ),
    );
  }
}
