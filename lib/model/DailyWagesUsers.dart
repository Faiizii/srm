class DailyWagesUserResponse
{
  var success;
  var message;
  List<dynamic> list;

  DailyWagesUserResponse({this.success, this.message,this.list});
  factory DailyWagesUserResponse.fromJson(Map<String, dynamic> json) {
    return DailyWagesUserResponse(
      success: json['success'],
      message: json['message'],
      list: json['daily_wages_users'],
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

  List<Model> getQualityUsers()
  {
    List<Model> tempList = new List();
    list.forEach((model)=>
      model.jobType.toString().toLowerCase().compareTo("quality") == 0?
        tempList.add(model):null
    );
    return tempList;
  }
  List<Model> getPackingUsers() {
    List<Model> tempList = new List();
    list.forEach((model)=>
    model.jobType.toString().toLowerCase().compareTo("packing") == 0?
    tempList.add(model):null
    );
    return tempList;
  }
  List<Model> getInsertionUsers() {
    List<Model> tempList = new List();
    list.forEach((model)=>
    model.jobType.toString().toLowerCase().compareTo("insertion") == 0?
    tempList.add(model):null
    );
    return tempList;
  }
}

class Model
{
  var id;
  var name;
  var cnic;
  var phone;
  var jobType;
  var addedBy;
  var status;

  Model({this.id,this.name,this.cnic,this.phone,this.jobType,this.addedBy,this.status});
  factory Model.fromJson(Map<String,dynamic> jsonMap)
  {
    return Model(
      id: jsonMap['id'],
      name: jsonMap['name'],
      cnic: jsonMap['cnic'],
      phone: jsonMap['phone'],
      jobType: jsonMap['job_type'],
      addedBy: jsonMap['added_by'],
      status: jsonMap['status'],
    );
  }

/*
            "id": "1",
            "name": "Addullah Khan",
            "cnic": "1234567890",
            "phone": "03333258000",
            "job_type": "Quality",
            "added_by": "1",
            "add_date": "2019-08-07 21:56:19",
            "delete_date": null,
            "deleted_by": null,
            "status": "A"

 */
}