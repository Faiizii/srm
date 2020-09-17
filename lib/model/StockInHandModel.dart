
class StockInHandResponse
{
  var success;
  var message;
  List<dynamic> list;

  StockInHandResponse({this.success, this.message,this.list});
  factory StockInHandResponse.fromJson(Map<String, dynamic> json) {
    return StockInHandResponse(
      success: json['success'],
      message: json['message'],
      list: json['stock'],
    );
  }
}

class ModelList
{
  final List<Model> list;
  ModelList({this.list});

  factory ModelList.fromJson(List<dynamic> jsonList)
  {
    List<Model> models = new List<Model>();
    models = jsonList.map((index)=>Model.fromJson(index)).toList();
    return ModelList(list:models);
  }
}


class Model
{
  var id;
  var description;
  var vendor;
  var balance;
  var currentBalance;

  Model({this.id, this.description, this.vendor, this.balance,
      this.currentBalance});

  factory Model.fromJson(Map<String,dynamic> json){
    return Model(
      id : json['item_id'],
      description : json['item_description'],
      vendor : json['vendor'],
      balance : json['balance'],
      currentBalance : json['Current_balance'],
    );
  }


/*
  "item_id": "4",
  "item_description": "User Guide (VSP)+ PTA Letter Combo",
  "vendor": "",
  "balance": "0",
  "Current_balance": "0"*/
}