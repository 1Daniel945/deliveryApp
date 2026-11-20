class ExtrasModel {
  final String extraName;
  final int extraPrice;

  ExtrasModel({
    required this.extraName,
    required this.extraPrice,
  });

  factory ExtrasModel.fromJson(Map<String, dynamic> json) {
    return ExtrasModel(
      extraName: json['extra_name'],
      extraPrice: (json['extra_price'] as num).toInt(),
    );
  }
}