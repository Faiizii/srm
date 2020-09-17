import 'package:flutter/material.dart';
import 'package:srm/api/api.dart';
import 'package:srm/components/MaterialColor.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:srm/model/StockInHandModel.dart';

class StockInHand extends StatefulWidget {
  @override
  _StockInHandState createState() => _StockInHandState();
}

class _StockInHandState extends State<StockInHand> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getStockInHand();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Stock In Hand"),
        backgroundColor: MyColors.PrimaryColor,
      ),
      body: new Container(
        color: Colors.white,
        child: new ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Text('New User Guide 4G', textAlign: TextAlign.end,style: new TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15.0,0.0,0.0,0.0),
                      child: Text(userGuide, textAlign: TextAlign.start,style: new TextStyle(fontSize: 16)),
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
                    child: Text('PTA TC Letter', textAlign: TextAlign.end,style: new TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15.0,0.0,0.0,0.0),
                      child: Text(pta, textAlign: TextAlign.start,style: new TextStyle(fontSize: 16)),
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
                    child: Text('Cellophane KG', textAlign: TextAlign.end,style: new TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15.0,0.0,0.0,0.0),
                      child: Text(cellophane, textAlign: TextAlign.start,style: new TextStyle(fontSize: 16)),
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
                    child: Text('Inner Boxes', textAlign: TextAlign.end,style: new TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15.0,0.0,0.0,0.0),
                      child: Text(innerBox, textAlign: TextAlign.start,style: new TextStyle(fontSize: 16)),
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
                    child: Text('Outer Boxes', textAlign: TextAlign.end,style: new TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15.0,0.0,0.0,0.0),
                      child: Text(outerBox, textAlign: TextAlign.start,style: new TextStyle(fontSize: 16)),
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
                    child: Text('Telenor Logo Tape', textAlign: TextAlign.end,style: new TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15.0,0.0,0.0,0.0),
                      child: Text(tape, textAlign: TextAlign.start,style: new TextStyle(fontSize: 16)),
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
                    child: Text('Printer Label Rolls', textAlign: TextAlign.end,style: new TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15.0,0.0,0.0,0.0),
                      child: Text(label, textAlign: TextAlign.start,style: new TextStyle(fontSize: 16)),
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
                    child: Text('Printer Ink Ribben', textAlign: TextAlign.end,style: new TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15.0,0.0,0.0,0.0),
                      child: Text(inkRibbon, textAlign: TextAlign.start,style: new TextStyle(fontSize: 16)),
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
                    child: Text('Make Up Printing Machine', textAlign: TextAlign.end,style: new TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15.0,0.0,0.0,0.0),
                      child: Text(makeUp, textAlign: TextAlign.start,style: new TextStyle(fontSize: 16)),
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
                    child: Text('Solvent Printing Machine (Litter)', textAlign: TextAlign.end,style: new TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15.0,0.0,0.0,0.0),
                      child: Text(inkBottle, textAlign: TextAlign.start,style: new TextStyle(fontSize: 16)),
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
                    child: Text('Ink Catridge Printing Machine', textAlign: TextAlign.end,style: new TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15.0,0.0,0.0,0.0),
                      child: Text(inkBottle, textAlign: TextAlign.start,style: new TextStyle(fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getStockInHand() async
  {

    http.Response response = await http.get(Api.API_GET_STOCK);
    StockInHandResponse stockInHandResponse = StockInHandResponse.fromJson(json.decode(response.body));
    print(stockInHandResponse.success);
    if(stockInHandResponse.success == 1)
      {
        ModelList modelList = ModelList.fromJson(stockInHandResponse.list);
        for(Model model in modelList.list)
          {
            setState(() {
              updateUI(model);
            });
          }
      }
  }

  String userGuide="0",pta="0",cellophane="0",innerBox="0",outerBox="0",
      tape="0",label="0",makeUp="0",solvent="0", inkBottle="0",inkRibbon="0";
  void updateUI(Model model) {
    switch(model.id)
    {

      case "5":
        //userGuide
        userGuide = model.currentBalance;
        break;
      case "6":
        //pta
        pta = model.currentBalance;
        break;
      case "8":
      //cellophane
      cellophane = model.currentBalance;
        break;
      case "11":
      //inner box
      innerBox = model.currentBalance;
        break;
      case "12":
      //outer box
      outerBox = model.currentBalance;
        break;
      case "13":
      //tape
      tape = model.currentBalance;
        break;
      case "14":
      //label
      label = model.currentBalance;
        break;
      case "15":
      //ink ribben
      inkRibbon = model.currentBalance;
        break;
      case "16":
      //ink bottle
      inkBottle = model.currentBalance;
        break;
      case "17":
      //make up
      makeUp = model.currentBalance;
        break;
      case "18":
      // solvent
      solvent = model.currentBalance;
        break;
    }
  }
}
