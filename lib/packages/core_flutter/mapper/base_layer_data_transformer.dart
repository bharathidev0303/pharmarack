
import 'package:pharmarack/packages/core_flutter/mapper/layer_data_transformer.dart';

abstract class BaseLayerDataTransformer<F, T>
    extends LayerDataTransformer<F, T> {
  @override
  F restore(T data) {
    throw UnimplementedError();
  }

  @override
  T transform() {
    throw UnimplementedError();
  }
}
