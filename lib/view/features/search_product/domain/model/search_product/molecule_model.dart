import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class MoleculeModel {
  @JsonKey(name: 'MoleculeId')
  final int? id;

  @JsonKey(name: 'MoleculeName')
  final String? moleculeName;

  MoleculeModel(this.id, this.moleculeName);

  @override
  String toString() {
    return 'MoleculeModel(MoleculeId: $id, MoleculeName: $moleculeName)';
  }
}
