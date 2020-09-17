class JobTypeResponse
{
  var success;
  var message;
  List<dynamic> list;

  JobTypeResponse({this.success, this.message,this.list});
  factory JobTypeResponse.fromJson(Map<String, dynamic> json) {
    print(json['job_types']);
    return JobTypeResponse(
      success: json['success'],
      message: json['message'],
      list: json['job_types'].cast<String>(),
    );
  }
}