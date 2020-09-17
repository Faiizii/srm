
import 'package:flutter/material.dart';
import 'package:srm/components/MaterialColor.dart';
import 'package:srm/ui/AddProduction.dart';
import 'package:srm/ui/DailyWages.dart';
import 'package:srm/ui/RegisterDWUser.dart';
import 'package:srm/ui/StockInHand.dart';
import 'package:srm/ui/ViewProduction.dart';

import 'MainFrame.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          bottom: TabBar(
            tabs: [
              Tab(text: "Consumption",),
              Tab(text: "Receieved"),
              Tab(text:"Waste"),
            ],
          ),
          title: Text(widget.title),
          backgroundColor: MyColors.PrimaryColor,
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text('Add Production'),
                onTap: () {
                  //navigate here
                  Navigator.pop(context);
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext){
                    return new AddProductionScreen();
                  }));
                },
              ),
              ListTile(
                title: Text('View Production'),
                onTap: () {
                  //navigate here
                  Navigator.pop(context);
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext){
                    return new ViewProductionScreen();
                  }));
                },
              ),
              ListTile(
                title: Text('Stock in Hand'),
                onTap: () {
                  //navigate here
                  Navigator.pop(context);
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext){
                    return new StockInHand();
                  }));
                },
              ),
              ListTile(
                title: Text('Daily Wages'),
                onTap: () {
                  //navigate here
                  Navigator.pop(context);
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext){
                    return new AddDailyWages();
                  }));
                },
              ),
              ListTile(
                title: Text('Register Daily Wages Worker'),
                onTap: () {
                  //navigate here
                  Navigator.pop(context);
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext){
                    return new RegisterDailyWagesUser();
                  }));
                },
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            new MainClass(type: 0),
            new MainClass(type: 1),
            new MainClass(type: 2),
          ],
        ),
      ),
    );
  }
}
