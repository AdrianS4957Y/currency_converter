class Currency {
  final int id;
  final String code;
  final String ccy;
  final String ccyNmRu;
  final String ccyNmUz;
  final String ccyNmUzc;
  final String ccyNmEn;
  final String nominal;
  late final String _rate;
  final num diff;
  final DateTime date;
  Currency({
    required this.ccy,
    required rate,
    required this.ccyNmEn,
    required this.ccyNmRu,
    required this.ccyNmUz,
    required this.ccyNmUzc,
    required this.code,
    required this.date,
    required this.diff,
    required this.id,
    required this.nominal,
  }) {
    _rate = rate;
  }
  get rate {
    return double.parse(_rate);
  }

  factory Currency.parseJson(Map<String, dynamic> json) {
    return Currency(
        ccy: json['Ccy']!,
        rate: json["Rate"],
        ccyNmEn: json["CcyNm_EN"]!,
        ccyNmRu: json["CcyNm_RU"]!,
        ccyNmUz: json["CcyNm_UZ"]!,
        ccyNmUzc: json["CcyNm_UZC"]!,
        code: json["Code"]!,
        date: DateTime.parse(
            (json["Date"]! as String).split(".").reversed.join("-")),
        diff: double.parse(json["Diff"]!),
        id: json["id"]!,
        nominal: json["Nominal"]!);
  }
}
