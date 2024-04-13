import 'package:json_annotation/json_annotation.dart';

part 'molecule_and_company_model.g.dart';

@JsonSerializable()
class MoleculeAndCompanyModel {
  @JsonKey(name: 'Molecule')
  List<Molecule>? molecule;
  @JsonKey(name: 'Company')
  List<Company>? company;

  MoleculeAndCompanyModel({
    this.molecule,
    this.company,
  });

  factory MoleculeAndCompanyModel.fromJson(Map<String, dynamic> json) =>
      _$MoleculeAndCompanyModelFromJson(json);

  Map<String, dynamic> toJson() => _$MoleculeAndCompanyModelToJson(this);

  MoleculeAndCompanyModel copyWith({
    List<Molecule>? molecule,
    List<Company>? company,
  }) {
    return MoleculeAndCompanyModel(
      molecule: molecule ?? this.molecule,
      company: company ?? this.company,
    );
  }
}

@JsonSerializable()
class Molecule {
  @JsonKey(name: 'MoleculeId')
  int? moleculeId;
  @JsonKey(name: 'MoleculeName')
  String? moleculeName;

  Molecule({
    this.moleculeId,
    this.moleculeName,
  });

  factory Molecule.fromJson(Map<String, dynamic> json) =>
      _$MoleculeFromJson(json);

  Map<String, dynamic> toJson() => _$MoleculeToJson(this);

  Molecule copyWith({
    int? moleculeId,
    String? moleculeName,
  }) {
    return Molecule(
      moleculeId: moleculeId ?? this.moleculeId,
      moleculeName: moleculeName ?? this.moleculeName,
    );
  }
}

@JsonSerializable()
class Company {
  @JsonKey(name: 'CompanyId')
  int? companyId;
  @JsonKey(name: 'CompanyName')
  String? companyName;

  bool? isChecked;

  Company({this.companyId, this.companyName, this.isChecked = false});

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);

  Company copyWith({
    int? companyId,
    String? companyName,
    bool? isChecked,
  }) {
    return Company(
      companyId: companyId ?? this.companyId,
      companyName: companyName ?? this.companyName,
      isChecked: isChecked ?? this.isChecked,
    );
  }
}
