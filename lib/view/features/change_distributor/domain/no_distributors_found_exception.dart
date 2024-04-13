class NoDistributorsFoundException implements Exception {
  String productName;
  NoDistributorsFoundException(this.productName);
}
