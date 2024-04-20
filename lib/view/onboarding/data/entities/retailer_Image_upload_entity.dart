import 'package:json_annotation/json_annotation.dart';

part 'retailer_Image_upload_entity.g.dart';

@JsonSerializable()
class RetailerImageUploadEntity {
  @JsonKey(name: "success")
  bool? success;
  @JsonKey(name: "StatusCode")
  int? statusCode;
  @JsonKey(name: "data")
  ImageUploadResponceEntity? data;
  @JsonKey(name: "message")
  String? message;

  RetailerImageUploadEntity({
    this.success,
    this.statusCode,
    this.data,
    this.message,
  });

  factory RetailerImageUploadEntity.fromJson(Map<String, dynamic> json) =>
      _$RetailerImageUploadEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RetailerImageUploadEntityToJson(this);
}

@JsonSerializable()
class ImageUploadResponceEntity {
  @JsonKey(name: "imageUrl")
  String? imageUrl;
  @JsonKey(name: "imageDbPath")
  String? imageDbPath;
  @JsonKey(name: "type")
  String? type;

  ImageUploadResponceEntity({
    this.imageDbPath,
    this.imageUrl,
    this.type,
  });

  factory ImageUploadResponceEntity.fromJson(Map<String, dynamic> json) =>
      _$ImageUploadResponceEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ImageUploadResponceEntityToJson(this);
}
