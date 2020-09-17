import 'package:flutter/material.dart';
import 'package:srm/api/api.dart';
import 'package:srm/components/MaterialColor.dart';
import 'package:http/http.dart' as http;
import 'package:srm/model/NormalResponse.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

import 'package:srm/model/ProductionSummary.dart';

class ViewProductionScreen extends StatefulWidget {
  @override
  _ViewProductionScreenState createState() => _ViewProductionScreenState();
}

class _ViewProductionScreenState extends State<ViewProductionScreen> {
  String resultStr = "Fetching Data";
  int radioGroupValue = 0;
  String selectedDate ;
  int rowsPerPageCount = 8;
  @override
  void initState() {
    // TODO: implement initState
    selectedDate = dateToString(DateTime.now());
    getProductionSummary(radioGroupValue);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Production Summary"),
        backgroundColor: MyColors.PrimaryColor,
      ),
      body: Scrollbar(child: ListView(
        children: <Widget>[
      Row(mainAxisSize: MainAxisSize.max,children: <Widget>[

        Row(mainAxisSize: MainAxisSize.min,children: <Widget>[
          Radio(value: 0, groupValue: radioGroupValue, onChanged: handleRadioGroupChange),
          Text("Daily"),
          Radio(value: 1, groupValue: radioGroupValue, onChanged: handleRadioGroupChange),
          Text("Monthly"),
        ],),
        Spacer(),
        FlatButton(onPressed:() => _selectDate(context), child: Text(selectedDate)),
      ],),
          summary != null ? getPaginatedTable() :
          Column(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[Text(resultStr),],),
        ]
      ))
    );
  }

  Future<Null> _selectDate(BuildContext context) async {
    DateTime date = DateTime.now();
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateFormat('yyyy-MM-dd').parse(selectedDate),
        firstDate: DateTime(2000, 1),
        lastDate: date);
    if (picked != null && picked != date)
      setState(() {
        date = picked;
        selectedDate = dateToString(date);
        print(selectedDate);
        getProductionSummary(radioGroupValue);
      });
  }
  String dateToString(DateTime time)
  {
    return DateFormat('yyyy-MM-dd').format(time);
  }
  List<Model> summary;
  void getProductionSummary(int value) async
  {
    var params = new Map<String, dynamic>();
    params[Api.DATE] = selectedDate;
    http.Response response = await http.post(Api.API_PRODUCTION_SUMMARY,body: params);
    switch(value)
    {
      case 0:
        rowsPerPageCount = 8;
        response = await http.post(Api.API_PRODUCTION_SUMMARY,body: params);
        break;
      case 1:
        rowsPerPageCount = 12;
        response = await http.post(Api.API_GET_MONTHLY_PRODUCTION_REPORT,body: params);
        break;
      default:
        response = await http.post(Api.API_PRODUCTION_SUMMARY,body: params);
    }
    print(response.body.toString());
    ProductionSummaryResponse summaryResponse = ProductionSummaryResponse.fromJson(json.decode(response.body));
    print(summaryResponse.success);

    if(summaryResponse.success == 1)
    {
      ModelList list = ModelList.fromJson(summaryResponse.list);
      setState(() {
        summary = list.list;
      });
      print(summary[0].name);
    }else{
      setState(() {
        resultStr = "No Data Found";
      });
    }
  }

  Widget getPaginatedTable()
  {
    return PaginatedDataTable(
      rowsPerPage: rowsPerPageCount,
      header: const Text('Summary'),
      columns: <DataColumn>[
        DataColumn(
          label: const Text('Timing'),
        ),
        DataColumn(
          label: const Text('Wrapping'),
        ),
        DataColumn(
          label: const Text('Printing'),
        ),
        DataColumn(
          label: const Text('Packing'),
        ),
        DataColumn(
          label: const Text('Quality'),
        ),
        DataColumn(
          label: const Text('Insertion'),
        ),
      ],
      source: TableDataSource(summary),
    );
  }

  void handleRadioGroupChange(int value) {
    setState(() {
      radioGroupValue = value;
      getProductionSummary(value);
    });
  }
}

class TableDataSource extends DataTableSource
{
  List<Model> models;
  TableDataSource(this.models);

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if (index >= models.length)
      return null;
    final Model model = models[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text(model.name),placeholder: true),
        DataCell(Text(model.wrapping != null ? model.wrapping : "0")),
        DataCell(Text(model.printing != null ? model.printing : "0")),
        DataCell(Text(model.packing != null ? model.packing : "0")),
        DataCell(Text(model.quality != null ? model.quality : "0")),
        DataCell(Text(model.insertion != null ? model.insertion : "0")),
      ],
    );
  }
  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => models.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;

}