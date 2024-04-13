// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'molecule_and_company_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoleculeAndCompanyModel _$MoleculeAndCompanyModelFromJson(
        Map<String, dynamic> json) =>
    MoleculeAndCompanyModel(
      molecule: (json['Molecule'] as List<dynamic>?)
          ?.map((e) => Molecule.fromJson(e as Map<String, dynamic>))
          .toList(),
      company: (json['Company'] as List<dynamic>?)
          ?.map((e) => Company.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MoleculeAndCompanyModelToJson(
        MoleculeAndCompanyModel instance) =>
    <String, dynamic>{
      'Molecule': instance.molecule,
      'Company': instance.company,
    };

Molecule _$MoleculeFromJson(Map<String, dynamic> json) => Molecule(
      moleculeId: json['MoleculeId'] as int?,
      moleculeName: json['MoleculeName'] as String?,
    );

Map<String, dynamic> _$MoleculeToJson(Molecule instance) => <String, dynamic>{
      'MoleculeId': instance.moleculeId,
      'MoleculeName': instance.moleculeName,
    };

Company _$CompanyFromJson(Map<String, dynamic> json) => Company(
      companyId: json['CompanyId'] as int?,
      companyName: json['CompanyName'] as String?,
      isChecked: json['isChecked'] as bool? ?? false,
    );

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'CompanyId': instance.companyId,
      'CompanyName': instance.companyName,
      'isChecked': instance.isChecked,
    };
