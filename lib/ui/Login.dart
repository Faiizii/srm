import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:srm/api/api.dart';
import 'package:srm/components/MaterialColor.dart';
import 'package:http/http.dart' as http;
import 'package:srm/model/NormalResponse.dart';
import 'dart:convert';
import 'Home.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        color: Colors.white,
        child:new Center(

            child: Padding(
              padding: const EdgeInsets.fromLTRB(40,0,40,0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new TextField(
                    controller: usernameController,
                    maxLength: 45,
                    decoration: new InputDecoration(
                      hintText: "Username",
                    ),
                  ),
                  new TextField(
                    controller: passwordController,
                    maxLength: 45,
                    obscureText: _obscureText,
                    decoration: new InputDecoration(
                      hintText: "Password",
                      suffixIcon: GestureDetector(
                        dragStartBehavior: DragStartBehavior.down,
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Icon(
                          _obscureText ? Icons.visibility : Icons.visibility_off,
                          semanticLabel: _obscureText ? 'show password' : 'hide password',
                        ),
                      )
                    ),
                  ),
                ButtonTheme(
                  minWidth: 100.0,
                  height: 40.0,
                  child: new RaisedButton(
                    onPressed: ()=>loginClick(context),
                    color: MyColors.PrimaryColor,
                    padding: new EdgeInsets.all(5.0),
                    focusColor: Colors.black,
                    elevation: 5,
                    child: new Text("Login",style: new TextStyle(color: Colors.white,fontSize: 16),),
                    shape:  RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0)),
                  ),
                ),

                ],
              ),
            )
        ),
      ),
    );
  }

  String username = "", password = "";
  bool validateFields()
  {
    bool check = true;

    username = usernameController.text;
    password = passwordController.text;

    if(username.isEmpty || password.isEmpty)
      {
        check = false;
      }
    return check;
  }
  void loginClick(BuildContext context) async{
    String username = usernameController.text;
    String password = passwordController.text;

    if(validateFields()) {
      var params = new Map<String, dynamic>();
      params[Api.PARAM_USERNAME] = username;
      params[Api.PARAM_PASSWORD] = password;
      //call api here
      http.Response response = await http.post(Api.API_LOGIN,body: params);
      print(response.body.toString());
      NormalResponse normalResponse = NormalResponse.fromJson(json.decode(response.body));
      print(normalResponse.success);

      if(normalResponse.success == 1)
        {
          loginSuccess(context);
        }
    }

  }
  void loginSuccess(BuildContext context)
  {
     Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (BuildContext){
      return new MyHomePage(title: 'SRM');
    }));
  }
}
