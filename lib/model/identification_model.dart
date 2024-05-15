import 'dart:convert';

IdentificationModel identificationModelFromJson(String str) =>
    IdentificationModel.fromJson(json.decode(str));

String identificationModelToJson(IdentificationModel data) =>
    json.encode(data.toJson());

class IdentificationModel {
  String message;
  List<Data> data;

  IdentificationModel({
    required this.message,
    required this.data,
  });

  factory IdentificationModel.fromJson(Map<String, dynamic> json) =>
      IdentificationModel(
        message: json["message"],
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Data {
  int id;
  int userId;
  String name;
  DateTime date;
  String time;
  int age;
  int sex;
  int chestPainType;
  int restingBp;
  int cholesterol;
  int fastingBs;
  int restingEcg;
  int maxHr;
  int exerciseAngina;
  double oldpeak;
  int stSlope;
  String result;

  Data({
    required this.id,
    required this.userId,
    required this.name,
    required this.date,
    required this.time,
    required this.age,
    required this.sex,
    required this.chestPainType,
    required this.restingBp,
    required this.cholesterol,
    required this.fastingBs,
    required this.restingEcg,
    required this.maxHr,
    required this.exerciseAngina,
    required this.oldpeak,
    required this.stSlope,
    required this.result,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userId: json["userId"],
        name: json["name"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
        age: json["age"],
        sex: json["sex"],
        chestPainType: json["chestPainType"],
        restingBp: json["restingBP"],
        cholesterol: json["cholesterol"],
        fastingBs: json["fastingBS"],
        restingEcg: json["restingECG"],
        maxHr: json["maxHR"],
        exerciseAngina: json["exerciseAngina"],
        oldpeak: json["oldpeak"]?.toDouble(),
        stSlope: json["stSlope"],
        result: json["result"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "name": name,
        "date": date.toIso8601String(),
        "time": time,
        "age": age,
        "sex": sex,
        "chestPainType": chestPainType,
        "restingBP": restingBp,
        "cholesterol": cholesterol,
        "fastingBS": fastingBs,
        "restingECG": restingEcg,
        "maxHR": maxHr,
        "exerciseAngina": exerciseAngina,
        "oldpeak": oldpeak,
        "stSlope": stSlope,
        "result": result,
      };
}
