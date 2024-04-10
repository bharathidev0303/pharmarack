
import 'package:pharmarack/view/onboarding/data/entities/retailer_registration/state.dart';

class AddressStateModel {
  int? stateId;
  String? stateName;

  AddressStateModel({this.stateId, this.stateName});

  AddressStateModel.from(AddressState addressState) {
    stateId = addressState.stateId;
    stateName = addressState.statename;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressStateModel &&
          runtimeType == other.runtimeType &&
          stateId == other.stateId &&
          stateName == other.stateName;

  @override
  int get hashCode => stateId.hashCode ^ stateName.hashCode;
}
