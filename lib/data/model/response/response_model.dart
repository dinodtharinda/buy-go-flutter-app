class ResponseModel {
  final bool isSuccess;
   dynamic data;
  final String? errorMessage;

  ResponseModel({
     this.isSuccess =false,
    this.data,
    this.errorMessage,
  });

  // Factory method to create a ResponseModel instance from a JSON map
  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      isSuccess: json['status']==1,
      data: json['data'],
      errorMessage: json['errorMessage'],
    );
  }
}