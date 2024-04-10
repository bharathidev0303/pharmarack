class AddressState {
  int? stateId;
  String? statename;

  AddressState({this.stateId, this.statename});

  AddressState.fromJson(Map<String, dynamic> json) {
    stateId = json['StateId'];
    statename = json['Statename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['StateId'] = stateId;
    data['Statename'] = statename;
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressState &&
          runtimeType == other.runtimeType &&
          stateId == other.stateId &&
          statename == other.statename;

  @override
  int get hashCode => stateId.hashCode ^ statename.hashCode;
}
