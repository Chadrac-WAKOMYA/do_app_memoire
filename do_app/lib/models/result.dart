class Result {
  String? message;
  bool? error;
  int? status;
  dynamic data;
  Result({
    this.message,
    this.error,
    this.data,
    this.status,
  });
  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(
      message: json['message'] as String,
      error: json['error'] ,
      status: json['status'] as int,
      data: json['data'] == null ? null : json['data'] as dynamic);
}

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
      'data': instance.data
    };