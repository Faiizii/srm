import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:srm/api/api.dart';
import 'package:srm/components/MaterialColor.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:srm/model/NormalResponse.dart';
import 'package:srm/utils/utils.dart';


class AddProductionScreen extends StatefulWidget {
  @override
  _AddProductionScreenState createState() => _AddProductionScreenState();
}

class _AddProductionScreenState extends State<AddProductionScreen> {
  final TextEditingController simPrintingController = new TextEditingController();
  final TextEditingController wrappingController = new TextEditingController();
  Timer timer;
  String _timeString="";
  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    timer = new Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    timer.cancel();
    super.dispose();
  }
  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('hh:mm:ss a (dd MMMM)').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Add Production"),
        backgroundColor: MyColors.PrimaryColor,
      ),
      body: new Container(
        color: Colors.white,
        child: new ListView(
          children: <Widget>[

            Card(
              elevation: 5,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: new Text(_timeString,textAlign: TextAlign.center,style: new TextStyle(fontSize: 24),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Text('Sim Printing', textAlign: TextAlign.center,style: new TextStyle(fontSize: 14)),
                  ),
                  Expanded(
                    child: TextField(
                      controller: simPrintingController,
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
                    child: Container()
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
                    child: Text('Wrapping', textAlign: TextAlign.center,style: new TextStyle(fontSize: 14)),
                  ),
                  Expanded(
                    child: TextField(
                      controller: wrappingController,
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
                    child: Container()
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
                      onPressed: ()=>saveClick(context),
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
  bool isClicked = false;
  void showAlertDialog(BuildContext context)
  {
    showDialog(context: context,builder: (BuildContext context){
      return SimpleDialog(title: Text('Confirm'),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Text('Sim Printing', textAlign: TextAlign.start,style: new TextStyle(fontSize: 14)),
                ),
                Expanded(
                  child: Text(simPrintingController.text, textAlign: TextAlign.center,style: new TextStyle(fontSize: 14)),
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
                  child: Text('Wrapping', textAlign: TextAlign.start,style: new TextStyle(fontSize: 14)),
                ),
                Expanded(
                  child: Text(wrappingController.text, textAlign: TextAlign.center,style: new TextStyle(fontSize: 14)),
                ),
              ],
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end,children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlineButton(onPressed: ()=>Navigator.pop(context),child: new Text("Cancel")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(onPressed: ()=>!isClicked ? saveDataToServer(context):null,child: new Text("Confirm",style: new TextStyle(color:Colors.white),),color: MyColors.PrimaryColor,),
            ),
          ],)
        ],);
    });

  }
  saveClick(BuildContext context) {
    if(validate()) {
      showAlertDialog(context);
      print("Save Clicked");
    }else{
      print('else Called');
      showEmptyDialog(context);
    }
  }

  saveDataToServer(BuildContext context) async{
    isClicked = true;
    var params = new Map<String, dynamic>();
    params[Api.SIM_PRINTING] = simPrintingController.text;
    params[Api.WRAPPING] = wrappingController.text;
    params[Api.IP_ADDRESS] = "";
    params[Api.LOCATION] ="";
    params[Api.USER_ID] ="10";
    //call api here
    http.Response response = await http.post(Api.API_ADD_PRODUCTION,body: params);
    print(response.body.toString());
    NormalResponse normalResponse = NormalResponse.fromJson(json.decode(response.body));
    print(normalResponse.success);

    if(normalResponse.success == 1)
    {
      Navigator.pop(context);
      simPrintingController.text = "";
      wrappingController.text = "";
      isClicked = false;
    }
  }

  String inputError = "";
  bool validate() {
    bool check =true;
    if(simPrintingController.text.isEmpty) {
      if (wrappingController.text.isEmpty) {
        check = false;
        inputError = "Empty";
      }
    }
    return check ;
  }

  void showEmptyDialog(BuildContext context) {
    showDialog(context: context,builder: (BuildContext context){
      return AlertDialog(title: Text("Error"),content: Text("All Fields Are Empty"),actions: <Widget>[
        FlatButton(onPressed:()=> Navigator.pop(context), child: Text("Ok"))
      ],);
    });
  }
}
