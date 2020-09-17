import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:srm/api/api.dart';
import 'package:srm/components/MaterialColor.dart';
import 'package:http/http.dart' as http;
import 'package:srm/model/JobType.dart';
import 'package:srm/model/NormalResponse.dart';



class RegisterDailyWagesUser extends StatefulWidget {
  @override
  _RegisterDailyWagesUserState createState() => _RegisterDailyWagesUserState();
}

class _RegisterDailyWagesUserState extends State<RegisterDailyWagesUser> {
  String dropdownValue;
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController cnicController = new TextEditingController();
  final TextEditingController phoneController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    getJobTypes();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Add User"),
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
                    flex:1,
                    child: Text('Name', textAlign: TextAlign.center,style: new TextStyle(fontSize: 14)),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10,0,10,0),
                      child: TextField(
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.center,
                        style: new TextStyle(fontSize: 15),
                        decoration: new InputDecoration(
                            hintText: "Name",
                            contentPadding: EdgeInsets.symmetric(vertical: 6),
                            enabledBorder:OutlineInputBorder(
                                borderRadius: new BorderRadius.all(new Radius.circular(2)))
                        ),
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
                    child: Text('CNIC', textAlign: TextAlign.center,style: new TextStyle(fontSize: 14)),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10,0,10,0),
                      child: TextField(
                        controller: cnicController,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: new TextStyle(fontSize: 15),
                        decoration: new InputDecoration(
                            hintText: "35xxx-1112233-1",
                            contentPadding: EdgeInsets.symmetric(vertical: 6),
                            enabledBorder:OutlineInputBorder(
                                borderRadius: new BorderRadius.all(new Radius.circular(2)))
                        ),
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
                    child: Text('Phone No.', textAlign: TextAlign.center,style: new TextStyle(fontSize: 14)),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10,0,10,0),
                      child: TextField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        textAlign: TextAlign.center,
                        style: new TextStyle(fontSize: 15),
                        decoration: new InputDecoration(
                            hintText: "0300-1234567",
                            contentPadding: EdgeInsets.symmetric(vertical: 6),
                            enabledBorder:OutlineInputBorder(
                                borderRadius: new BorderRadius.all(new Radius.circular(2)))
                        ),
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
                    child: Text('Job Type', textAlign: TextAlign.center,style: new TextStyle(fontSize: 14)),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10,0,10,0),
                      child: DropdownButton<String>(
                        hint: new Text("Select"),
                        isExpanded: true,
                        value: dropdownValue,
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                        items: jobTypeList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
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

  List<String> jobTypeList = ["Select"];
  void getJobTypes() async {
    http.Response response = await http.get(Api.API_GET_JOB_TYPES);
    print(response.body.toString());
    JobTypeResponse jobTypeResponse = JobTypeResponse.fromJson(json.decode(response.body));
    print(jobTypeResponse.success);

    if (jobTypeResponse.success == 1) {
      setState(() {
        jobTypeList = jobTypeResponse.list;
      });
      print(jobTypeResponse.list.length);
    }else{
      print(jobTypeResponse.message);
    }
  }

  bool saveClicked = false;
  saveClick() {
   if(validate() && !saveClicked)
     {
       saveClicked = true;
       saveDataToServer();
     }else{
     showEmptyDialog(context);
     print("else called");
   }
  }
  bool validate()
  {
    bool check = true;

    if(nameController.text.isEmpty)
      check = false;
    if(cnicController.text.isEmpty)
      check = false;
    if(phoneController.text.isEmpty)
      check = false;
    if(dropdownValue == null || dropdownValue.isEmpty)
      check = false;
    return check;
  }
  saveDataToServer() async
  {
    print("saveToServer");
    var params = new Map<String, dynamic>();
    params[Api.NAME] = nameController.text;
    params[Api.CNIC] = cnicController.text;
    params[Api.PHONE] = phoneController.text;
    params[Api.JOB_TYPE] = dropdownValue;
    params[Api.USER_ID] ="10";

    http.Response response = await http.post(Api.API_ADD_DAILY_WAGES_USER,body: params);
    print(response.body.toString());
    NormalResponse normalResponse = NormalResponse.fromJson(json.decode(response.body));
    print(normalResponse.success);

    if(normalResponse.success == 1)
    {
      nameController.text = "";
      cnicController.text = "";
      phoneController.text = "";
    }
    saveClicked = false;
  }

  void showEmptyDialog(BuildContext context) {
    showDialog(context: context,builder: (BuildContext context){
      return AlertDialog(title: Text("Error"),content: Text("All Fields Are Empty"),actions: <Widget>[
        FlatButton(onPressed:()=> Navigator.pop(context), child: Text("Ok"))
      ],);
    });
  }
}
