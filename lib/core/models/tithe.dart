class TitheModel {
  final String month;
  final bool isPaid;

  const TitheModel({
    required this.month,
    required this.isPaid,
  });

  TitheModel copyWith({String? month, bool? isPaid}) {
    return TitheModel(
      month: month ?? this.month,
      isPaid: isPaid ?? this.isPaid,
    );
  }

  TitheModel.fromMap(Map map)
      : month = map["month"],
        isPaid = map["isPaid"];

  Map toMap() {
    return {"month": month, "isPaid": isPaid};
  }
}
