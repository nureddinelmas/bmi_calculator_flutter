class Records {
  String? id;
  String? name;
  int? age;
  int? kg;
  int? cm;
  double? hmiIndex;
  String? hmiLevel = "";

  Records(
      {required this.id,
      this.name,
      this.age,
      required this.kg,
      required this.cm,
      required this.hmiIndex,
      required this.hmiLevel});

  // static List<Records> recordsList() {
  //   return [
  //     Records(id: "01", kg: 90, cm: 180),
  //     Records(id: "01", kg: 100, cm: 120),
  //     Records(id: "01", kg: 90, cm: 140),
  //     Records(id: "01", kg: 90, cm: 160),
  //     Records(id: "01", kg: 90, cm: 190),
  //   ];
  // }
}
