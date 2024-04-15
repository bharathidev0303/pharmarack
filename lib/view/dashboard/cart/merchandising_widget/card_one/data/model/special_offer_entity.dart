import 'package:json_annotation/json_annotation.dart';

part 'special_offer_entity.g.dart';

@JsonSerializable()
class SpecialOfferEntity {
  @JsonKey(name: 'statusCode')
  String? statusCode;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'specialOffers')
  List<SpecialOffers>? specialOffers;

  SpecialOfferEntity({
    this.statusCode,
    this.message,
    this.specialOffers,
  });

  factory SpecialOfferEntity.fromJson(Map<String, dynamic> json) =>
      _$SpecialOfferEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SpecialOfferEntityToJson(this);
}

@JsonSerializable()
class SpecialOffers {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'medicineName')
  String? medicineName;
  @JsonKey(name: 'ptr')
  String? ptr;
  @JsonKey(name: 'mrp')
  String? mrp;
  @JsonKey(name: 'imageUrl')
  String? imageUrl;

  SpecialOffers(
      {this.id, this.medicineName, this.ptr, this.mrp, this.imageUrl});

  factory SpecialOffers.fromJson(Map<String, dynamic> json) =>
      _$SpecialOffersFromJson(json);

  Map<String, dynamic> toJson() => _$SpecialOffersToJson(this);
}
