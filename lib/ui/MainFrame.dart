import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:srm/api/api.dart';
import 'package:srm/components/MaterialColor.dart';
import 'package:http/http.dart' as http;
import 'package:srm/model/NormalResponse.dart';

class MainClass extends StatefulWidget {

  final int type;

  MainClass({Key key,this.type}):super(key:key);

  @override
  _MainClassState createState() {
    return _MainClassState();
  }
}

class _MainClassState extends State<MainClass> {

  final TextEditingController userGuideController = new TextEditingController();
  final TextEditingController ptaController = new TextEditingController();
  final TextEditingController inkRibbenController = new TextEditingController();
  final TextEditingController inkBottleController = new TextEditingController();
  final TextEditingController innerBoxController = new TextEditingController();
  final TextEditingController outerBoxController = new TextEditingController();
  final TextEditingController labelController = new TextEditingController();
  final TextEditingController cellophaneController = new TextEditingController();
  final TextEditingController controller = new TextEditingController();
  final TextEditingController solventController = new TextEditingController();
  final TextEditingController tapeController = new TextEditingController();
  final TextEditingController makeUpController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
      child: new ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Text('User Guide', textAlign: TextAlign.center,style: new TextStyle(fontSize: 12)),
                ),
                Expanded(
                  child: TextField(
                    controller: userGuideController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: new TextStyle(fontSize: 12,height: 2),
                    decoration: new InputDecoration(
                        hintText: "0",
                        contentPadding: EdgeInsets.symmetric(vertical: 0),
                        enabledBorder:OutlineInputBorder(
                            borderRadius: new BorderRadius.all(new Radius.circular(2)))
                    ),
                  ),
                ),
                Expanded(
                  child: Text('PTA', textAlign: TextAlign.center,style: new TextStyle(fontSize: 12)),
                ),
                Expanded(
                  child: TextField(
                    controller: ptaController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: new TextStyle(fontSize: 12,height: 2),
                    decoration: new InputDecoration(
                        hintText: "0",
                        contentPadding: EdgeInsets.symmetric(vertical: 0),
                        enabledBorder:OutlineInputBorder(
                            borderRadius: new BorderRadius.all(new Radius.circular(2)))
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
                  child: Text('Cellophane', textAlign: TextAlign.center,style: new TextStyle(fontSize: 12)),
                ),
                Expanded(
                  child: TextField(
                    controller: cellophaneController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: new TextStyle(fontSize: 12,height: 2),
                    decoration: new InputDecoration(
                        hintText: "0",
                        contentPadding: EdgeInsets.symmetric(vertical: 0),
                        enabledBorder:OutlineInputBorder(
                            borderRadius: new BorderRadius.all(new Radius.circular(2)))
                    ),
                  ),
                ),
                Expanded(
                  child: Text('Tape', textAlign: TextAlign.center,style: new TextStyle(fontSize: 12)),
                ),
                Expanded(
                  child: TextField(
                    controller: tapeController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: new TextStyle(fontSize: 12,height: 2),
                    decoration: new InputDecoration(
                        hintText: "0",
                        contentPadding: EdgeInsets.symmetric(vertical: 0),
                        enabledBorder:OutlineInputBorder(
                            borderRadius: new BorderRadius.all(new Radius.circular(2)))
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
                  child: Text('Outer Box', textAlign: TextAlign.center,style: new TextStyle(fontSize: 12)),
                ),
                Expanded(
                  child: TextField(
                    controller: outerBoxController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: new TextStyle(fontSize: 12,height: 2),
                    decoration: new InputDecoration(
                        hintText: "0",
                        contentPadding: EdgeInsets.symmetric(vertical: 0),
                        enabledBorder:OutlineInputBorder(
                            borderRadius: new BorderRadius.all(new Radius.circular(2)))
                    ),
                  ),
                ),
                Expanded(
                  child: Text('Inner Box', textAlign: TextAlign.center,style: new TextStyle(fontSize: 12)),
                ),
                Expanded(
                  child: TextField(
                    controller: innerBoxController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: new TextStyle(fontSize: 12,height: 2),
                    decoration: new InputDecoration(
                        hintText: "0",
                        contentPadding: EdgeInsets.symmetric(vertical: 0),
                        enabledBorder:OutlineInputBorder(
                            borderRadius: new BorderRadius.all(new Radius.circular(2)))
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
                  child: Text('Label', textAlign: TextAlign.center,style: new TextStyle(fontSize: 12)),
                ),
                Expanded(
                  child: TextField(
                    controller: labelController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: new TextStyle(fontSize: 12,height: 2),
                    decoration: new InputDecoration(
                        hintText: "0",
                        contentPadding: EdgeInsets.symmetric(vertical: 0),
                        enabledBorder:OutlineInputBorder(
                            borderRadius: new BorderRadius.all(new Radius.circular(2)))
                    ),
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Expanded(
                  child: Container(),
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
                  child: Text('Ink Ribben', textAlign: TextAlign.center,style: new TextStyle(fontSize: 12)),
                ),
                Expanded(
                  child: TextField(
                    controller: inkRibbenController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: new TextStyle(fontSize: 12,height: 2),
                    decoration: new InputDecoration(
                        hintText: "0",
                        contentPadding: EdgeInsets.symmetric(vertical: 0),
                        enabledBorder:OutlineInputBorder(
                            borderRadius: new BorderRadius.all(new Radius.circular(2)))
                    ),
                  ),
                ),
                Expanded(
                  child: Text('Make Up', textAlign: TextAlign.center,style: new TextStyle(fontSize: 12)),
                ),
                Expanded(
                  child: TextField(
                    controller: makeUpController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: new TextStyle(fontSize: 12,height: 2),
                    decoration: new InputDecoration(
                        hintText: "0",
                        contentPadding: EdgeInsets.symmetric(vertical: 0),
                        enabledBorder:OutlineInputBorder(
                            borderRadius: new BorderRadius.all(new Radius.circular(2)))
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
                  child: Text('Ink Bottle', textAlign: TextAlign.center,style: new TextStyle(fontSize: 12)),
                ),
                Expanded(
                  child: TextField(
                    controller: inkBottleController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: new TextStyle(fontSize: 12,height: 2),
                    decoration: new InputDecoration(
                        hintText: "0",
                        contentPadding: EdgeInsets.symmetric(vertical: 0),
                        enabledBorder:OutlineInputBorder(
                            borderRadius: new BorderRadius.all(new Radius.circular(2)))
                    ),
                  ),
                ),
                Expanded(
                  child: Text('Solvent', textAlign: TextAlign.center,style: new TextStyle(fontSize: 12)),
                ),
                Expanded(
                  child: TextField(
                    controller: solventController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: new TextStyle(fontSize: 12,height: 2),
                    decoration: new InputDecoration(
                        hintText: "0",
                        contentPadding: EdgeInsets.symmetric(vertical: 0),
                        enabledBorder:OutlineInputBorder(
                            borderRadius: new BorderRadius.all(new Radius.circular(2)))
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
                      onPressed: ()=>saveClick(context,widget.type),
                      color: MyColors.PrimaryColor,
                      padding: new EdgeInsets.all(5.0),
                      focusColor: Colors.black,
                      elevation: 5,
                      child: new Text("Save",style: new TextStyle(color: Colors.white,fontSize: 16),),
                      shape:  RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0)),
                    ),
                  ),],
                ),
          )
        ],
      ),
    );
  }

  saveClick(BuildContext context,int type) {
    if(validate()){
      showConfirmDialog(context,type);
    }else {
      print("input fields are empty");
      showEmptyDialog(context);
    }
  }

  bool validate()
  {
    bool check = true;
    if(userGuideController.text.isEmpty && ptaController.text.isEmpty
        && cellophaneController.text.isEmpty && tapeController.text.isEmpty && outerBoxController.text.isEmpty
        && innerBoxController.text.isEmpty && labelController.text.isEmpty && inkRibbenController.text.isEmpty
        && inkBottleController.text.isEmpty && makeUpController.text.isEmpty && solventController.text.isEmpty){
      check = false;
    }

    if(isClicked)
      check = false;
    return check;
  }


  bool isClicked = false;
  saveDataToServer(BuildContext context,int type) async{
    var params = new Map<String, dynamic>();
    params[Api.USER_GUIDE] = userGuideController.text;
    params[Api.PTA] = ptaController.text;
    params[Api.CELLOPHANE] = cellophaneController.text;
    params[Api.TEAR_TAPE] = tapeController.text;
    params[Api.OUTER_BOX] = outerBoxController.text;
    params[Api.INNER_BOX] = innerBoxController.text;
    params[Api.LABEL] = labelController.text;
    params[Api.INK_RIBBON] = inkRibbenController.text;
    params[Api.INK_CATRIAGE] = inkBottleController.text;
    params[Api.MAKEUP] = makeUpController.text;
    params[Api.SOLVENT] = solventController.text;
    params[Api.IP_ADDRESS] = "";
    params[Api.LOCATION] ="";
    params[Api.USER_ID] ="10";

    http.Response response;
    switch(type)
    {
      case 0:
        response = await http.post(Api.API_ADD_CONSUME,body: params);
        break;
      case 1:
        response = await http.post(Api.API_ADD_RECEIVE,body: params);
        break;
      case 2:
        response = await http.post(Api.API_ADD_WASTE,body: params);
        break;
      default:
        response = await http.post(Api.API_ADD_CONSUME,body: params);
    }
    if(response != null){
      print(response.body.toString());
      NormalResponse normalResponse = NormalResponse.fromJson(json.decode(response.body));
      print(normalResponse.success);

      if(normalResponse.success == 1)
      {
        Navigator.pop(context);
        userGuideController.text = "";
        ptaController.text = "";
        cellophaneController.text = "";
        tapeController.text = "";
        outerBoxController.text = "";
        innerBoxController.text = "";
        labelController.text = "";
        inkRibbenController.text = "";
        inkBottleController.text = "";
        makeUpController.text = "";
        solventController.text = "";
      }
      isClicked = false;
    }
  }

  void showEmptyDialog(BuildContext context) {
    showDialog(context: context,builder: (BuildContext context){
      return AlertDialog(title: Text("Error"),content: Text("All Fields Are Empty"),actions: <Widget>[
        FlatButton(onPressed:()=> Navigator.pop(context), child: Text("Ok"))
      ],);
    });
  }
  void showConfirmDialog(BuildContext context,int type) {
    showDialog(context: context,builder: (BuildContext context){
      return new SimpleDialog(title: Text("Confirm"),children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Text('User Guide', textAlign: TextAlign.start,style: new TextStyle(fontSize: 12)),
              ),
              Expanded(
                child: Text(userGuideController.text.isNotEmpty ? userGuideController.text:"0", textAlign: TextAlign.center,style: new TextStyle(fontSize: 12)),
              ),
              Expanded(
                child: Text('PTA', textAlign: TextAlign.start,style: new TextStyle(fontSize: 12)),
              ),
              Expanded(
                child: Text(ptaController.text.isNotEmpty ? ptaController.text:"0", textAlign: TextAlign.center,style: new TextStyle(fontSize: 12)),
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
                child: Text('Cellophane', textAlign: TextAlign.start,style: new TextStyle(fontSize: 12)),
              ),
              Expanded(
                child: Text(cellophaneController.text.isNotEmpty ? cellophaneController.text:"0", textAlign: TextAlign.center,style: new TextStyle(fontSize: 12)),
              ),
              Expanded(
                child: Text('Tape', textAlign: TextAlign.start,style: new TextStyle(fontSize: 12)),
              ),
              Expanded(
                child: Text(tapeController.text.isNotEmpty ? tapeController.text:"0", textAlign: TextAlign.center,style: new TextStyle(fontSize: 12)),
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
                child: Text('Outer Box', textAlign: TextAlign.start,style: new TextStyle(fontSize: 12)),
              ),
              Expanded(
                child:Text(outerBoxController.text.isNotEmpty ? outerBoxController.text:"0", textAlign: TextAlign.center,style: new TextStyle(fontSize: 12)),
              ),
              Expanded(
                child: Text('Inner Box', textAlign: TextAlign.start,style: new TextStyle(fontSize: 12)),
              ),
              Expanded(
                child: Text(innerBoxController.text.isNotEmpty ? innerBoxController.text:"0", textAlign: TextAlign.center,style: new TextStyle(fontSize: 12)),
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
                child: Text('Label', textAlign: TextAlign.start,style: new TextStyle(fontSize: 12)),
              ),
              Expanded(
                child: Text(labelController.text.isNotEmpty ? labelController.text:"0", textAlign: TextAlign.center,style: new TextStyle(fontSize: 12)),
              ),
              Expanded(
                child: Container(),
              ),
              Expanded(
                child: Container(),
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
                child: Text('Ink Ribben', textAlign: TextAlign.start,style: new TextStyle(fontSize: 12)),
              ),
              Expanded(
                child: Text(inkRibbenController.text.isNotEmpty ? inkRibbenController.text:"0", textAlign: TextAlign.center,style: new TextStyle(fontSize: 12)),
              ),
              Expanded(
                child: Text('Make Up', textAlign: TextAlign.start,style: new TextStyle(fontSize: 12)),
              ),
              Expanded(
                child:Text(makeUpController.text.isNotEmpty ? makeUpController.text:"0", textAlign: TextAlign.center,style: new TextStyle(fontSize: 12)),
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
                child: Text('Ink Bottle', textAlign: TextAlign.start,style: new TextStyle(fontSize: 12)),
              ),
              Expanded(
                child: Text(inkBottleController.text.isNotEmpty ? inkBottleController.text:"0", textAlign: TextAlign.center,style: new TextStyle(fontSize: 12)),
              ),
              Expanded(
                child: Text('Solvent', textAlign: TextAlign.start,style: new TextStyle(fontSize: 12)),
              ),
              Expanded(
                child: Text(solventController.text.isNotEmpty ? solventController.text:"0", textAlign: TextAlign.center,style: new TextStyle(fontSize: 12)),
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
            child: RaisedButton(onPressed: ()=>!isClicked ? saveDataToServer(context,type):null,child: new Text("Confirm",style: new TextStyle(color:Colors.white),),color: MyColors.PrimaryColor,),
          ),
        ],)
      ],);
    });
  }


}
