import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:srm/api/api.dart';
import 'package:srm/components/MaterialColor.dart';
import 'package:http/http.dart' as http;
import 'package:srm/model/DailyWagesUsers.dart';
import 'package:srm/model/NormalResponse.dart';
import 'package:srm/utils/MyPreference.dart';

class AddDailyWages extends StatefulWidget {
  @override
  _AddDailyWagesState createState() => _AddDailyWagesState();
}

class _AddDailyWagesState extends State<AddDailyWages> {
  String dropdownValue = 'One';
  Model qualityUser,packingUser, insertionUser;
  final TextEditingController qualityController = new TextEditingController();
  final TextEditingController packingController = new TextEditingController();
  final TextEditingController insertionController = new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    getDailyWagesUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Add Daily Wages"),
        backgroundColor: MyColors.PrimaryColor,
      ),
      body: new Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text('Quality', textAlign: TextAlign.center,style: new TextStyle(fontSize: 14)),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextField(
                      controller: qualityController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: new TextStyle(fontSize: 15),
                      decoration: new InputDecoration(
                          hintText: "0",
                          contentPadding: EdgeInsets.symmetric(vertical: 6),
                          enabledBorder:OutlineInputBorder(
                              borderRadius: new BorderRadius.all(new Radius.circular(2)))
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0,10,0),
                      child: DropdownButton<Model>(
                        value: qualityUser ,
                        hint: new Text("Select User"),
                        isExpanded: true,
                        onChanged: (Model newValue) {
                          setState(() {
                            qualityUser = newValue;
                          });
                        },
                        items: qualityUsers
                            .map((user) {
                          return DropdownMenuItem(
                            value: user,
                            child: Text(user!=null?user.name:"Fetching"),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex:1,
                    child: Text('Packing', textAlign: TextAlign.center,style: new TextStyle(fontSize: 14)),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextField(
                      controller: packingController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: new TextStyle(fontSize: 15),
                      decoration: new InputDecoration(
                          hintText: "0",
                          contentPadding: EdgeInsets.symmetric(vertical: 6),
                          enabledBorder:OutlineInputBorder(
                              borderRadius: new BorderRadius.all(new Radius.circular(2)))
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0,10,0),
                      child:DropdownButton<Model>(
                        value: packingUser ,
                        hint: new Text("Select User"),
                        isExpanded: true,
                        onChanged: (Model newValue) {
                          setState(() {
                            packingUser = newValue;
                          });
                        },
                        items: packingUsers
                            .map((user) {
                          return DropdownMenuItem(
                            value: user,
                            child: Text(user!=null?user.name:"Fetching"),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text('Insertion', textAlign: TextAlign.center,style: new TextStyle(fontSize: 14)),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextField(
                      controller: insertionController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: new TextStyle(fontSize: 15),
                      decoration: new InputDecoration(
                          hintText: "0",
                          contentPadding: EdgeInsets.symmetric(vertical: 6),
                          enabledBorder:OutlineInputBorder(
                              borderRadius: new BorderRadius.all(new Radius.circular(2)))
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0,10,0),
                        child: DropdownButton<Model>(
                          value: insertionUser,
                          hint: new Text("Select User"),
                          isExpanded: true,
                          onChanged: (Model newValue) {
                            setState(() {
                              insertionUser = newValue;
                            });
                          },
                          items: insertionUsers
                              .map((user) {
                            return DropdownMenuItem(
                              value: user,
                              child: Text(user!=null?user.name:"Fetching"),
                            );
                          }).toList(),
                        ),
                      ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  ButtonTheme(
                    minWidth: 100.0,
                    height: 40.0,
                    child: new RaisedButton(
                      onPressed: ()=>saveClick(),
                      color: MyColors.PrimaryColor,
                      padding: new EdgeInsets.all(5.0),
                      focusColor: Colors.black,
                      elevation: 5,
                      child: new Text("Save",style: new TextStyle(color: Colors.white,fontSize: 16),),
                      shape:  RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0)),
                    ),
                  ),],
              ),
            ),
          ],
        )
      ),
    );
  }

  bool validate()
  {
    bool check = true;

    if(qualityController.text.isEmpty && packingController.text.isEmpty && insertionController.text.isEmpty)
      check = false;
    if(qualityUser == null && packingUser == null && insertionUser == null)
      check = false;

    if(check){
      if(qualityController.text.isNotEmpty && qualityUser == null)
      check = false;

      if(packingController.text.isNotEmpty && packingUser == null)
        check = false;

      if(insertionController.text.isNotEmpty && packingUser == null)
        check = false;
    }


    print(qualityController.text);
    print(qualityUser);
    print(packingController.text);
    print(packingUser);
    print(insertionController.text);
    print(insertionUser);
    print(check);
    return check;
  }
  saveClick() {
    if(validate() && !isClicked){
      saveDataToServer();
    }else{
      print("error in validating error");
    }
    print("Save Button Clicke");
  }

  bool isClicked = false;
  void saveDataToServer() async{
    isClicked = true;
    var params = new Map<String, dynamic>();
    params[Api.QUALITY_USER_ID] = qualityUser != null ? qualityUser.id : "";
    params[Api.PACKING_USER_ID] = packingUser != null ? packingUser.id : "";
    params[Api.INSERTION_USER_ID] = insertionUser != null ? insertionUser.id : "";

    params[Api.QUALITY_VALUE] = qualityController.text;
    params[Api.PACKING_VALUE] = packingController.text;
    params[Api.INSERTION_VALUE] = insertionController.text;

    params[Api.IP_ADDRESS] = "";
    params[Api.LOCATION] ="";
    params[Api.USER_ID] ="10";
    //call api here
    http.Response response = await http.post(Api.API_ADD_DAILY_WAGES,body: params);
    print(response.body.toString());
    NormalResponse normalResponse = NormalResponse.fromJson(json.decode(response.body));
    print(normalResponse.success);

    if(normalResponse.success == 1)
    {
      qualityController.text = "";
      packingController.text = "";
      insertionController.text = "";
      isClicked = false;
    }
  }

  List<Model> qualityUsers = new List(1);
  List<Model> packingUsers = new List(1);
  List<Model> insertionUsers = new List(1);

  getDailyWagesUsers() async{
    var params = new Map<String, dynamic>();
    params[Api.USER_ID] = "10";
    MyPreferences.getUserId();
    http.Response response = await http.post(Api.API_GET_DAILY_WAGES_USERS,body: params);
    print(response.body.toString());
    DailyWagesUserResponse userResponse = DailyWagesUserResponse.fromJson(json.decode(response.body));
    print(userResponse.success);

    if(userResponse.success == 1)
    {
      ModelList modelList = ModelList.fromJson(userResponse.list);
      setState(() {
        qualityUsers = modelList.getQualityUsers();
        packingUsers = modelList.getPackingUsers();
        insertionUsers = modelList.getInsertionUsers();
      });

      print(qualityUsers.length);
      print(packingUsers.length);
      print(insertionUsers.length);
    }else{
      print(userResponse.message);
    }
  }
}
