import 'package:flutter/material.dart';

class Welcome extends StatelessWidget{
  final Map<String, String> arg;

  Welcome(this.arg);

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: Text("2017313135 권동민")
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('CORONA LIVE', style: TextStyle(color: Colors.blue, fontSize: 30),),
            Text('Login Success. Hello ${arg["loginID"]}!!'),
            Container(
              width: 300,
              height: 300,
              child: SizedBox(
                width:300,
                height:200,
                child: Image.asset("assets/image/welcome_img.jpg"),
              ),
            ),
            ElevatedButton(
                child: Text("Login"),
                onPressed: (){
                  Navigator.pushNamed(
                      context,
                      '/navigate',
                      arguments: {
                        "previous" : "Login Page",
                        "loginID" : arg["loginID"]
                      }
                  );
                }
            )
          ],
        ),
      )
    );
  }
}