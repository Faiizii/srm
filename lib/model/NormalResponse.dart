class NormalResponse
{
  var success;
  var message;

  NormalResponse({this.success, this.message});
  factory NormalResponse.fromJson(Map<String, dynamic> json) {
    return NormalResponse(
      success: json['success'],
      message: json['message'],
    );
  }
}