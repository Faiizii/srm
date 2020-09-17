
class ProductionSummaryResponse
{
  var success;
  var message;
  List<dynamic> list;

  ProductionSummaryResponse({this.success, this.message,this.list});
  factory ProductionSummaryResponse.fromJson(Map<String, dynamic> json) {
    return ProductionSummaryResponse(
      success: json['success'],
      message: json['message'],
      list: json['summary'],
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
  var name;
  var printing;
  var wrapping;
  var quality;
  var packing;
  var insertion;

  Model({this.name,this.printing,this.wrapping,this.quality,this.packing,this.insertion});
  factory Model.fromJson(Map<String,dynamic> jsonMap)
  {
    return Model(
      name: jsonMap['name'],
      printing: jsonMap['printing'],
      wrapping: jsonMap['wrapping'],
      quality: jsonMap['quality'],
      packing: jsonMap['packing'],
      insertion: jsonMap['insertion'],
    );
  }

/*
  "name": "12:00 AM to 03:00 AM",
  "printing": null,
  "wrapping": null,
  "quality": null,
  "packing": null,
  "insertion": null*/
}