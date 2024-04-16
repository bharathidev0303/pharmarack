import 'package:equatable/equatable.dart';
import 'package:pharmarack/view/dashboard/order_history/data/model/reorder_entity.dart';


class ReorderModel with EquatableMixin {
  String? statusCode;
  String? message;
  dynamic hideProductMSG;
  dynamic iList;

  ReorderModel({
    this.statusCode,
    this.message,
    this.hideProductMSG,
    this.iList,
  });

  ReorderModel copyWith({
    String? statusCode,
    String? message,
    dynamic hideProductMSG,
    dynamic iList,
  }) {
    return ReorderModel(
      statusCode: statusCode ?? this.statusCode,
      message: message ?? this.message,
      hideProductMSG: hideProductMSG ?? this.hideProductMSG,
      iList: iList ?? this.iList,
    );
  }

  factory ReorderModel.fromReorderEntity(ReorderEntity entity) {
    return ReorderModel(
      statusCode: entity.statusCode,
      message: entity.message,
      hideProductMSG: entity.hideProductMSG,
      iList: entity.iList,
    );
  }

  @override
  List<Object?> get props => [
        statusCode,
        message,
        hideProductMSG,
        iList,
      ];
}
