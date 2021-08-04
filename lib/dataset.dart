import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class VaccineData{
  final String country;
  final List<dynamic> info;

  VaccineData(this.country, this.info);

  factory VaccineData.fromJson(Map<String, dynamic> json){
    return VaccineData(
        json['country'],
        json['data'] as List
    );
  }

  List<Data> getListData(){
    List<dynamic> _list = info;
    return _list.map((js) => Data.fromJson(js)).toList();
  }
}

class Data{
  final String date;
  final int total;
  final int people;
  final int peopleFully;
  final int daily;

  Data(this.date, this.total, this.people, this.peopleFully, this.daily);

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      json['date'] as String,
      json['total_vaccinations'],
      json['people_vaccinated'],
      json['people_fully_vaccinated'],
      json['daily_vaccinations']
    );
  }
}

Future<List<VaccineData>> fetchVaccine() async{
  print("Start parsing Vaccine data.");
  String url = "https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/vaccinations/vaccinations.json";
  final response = await http.get(url);
  if(response.statusCode == 200){
    List<dynamic> _list = jsonDecode(response.body);
    return _list.map((json) => VaccineData.fromJson(json)).toList();
  }
  else{
    throw Exception("Failed to load Vaccine");
  }
}

class CasesData{
  final String country;
  final List<dynamic> info;

  CasesData(this.country, this.info);

  factory CasesData.fromJson(Map<String, dynamic> json){
    return CasesData(
        json['location'],
        json['data'] as List
    );
  }

  List<DataCase> getListData(){
    List<dynamic> _list = info;
    return _list.map((js) => DataCase.fromJson(js)).toList();
  }
}

class DataCase{
  final String date;
  double totalCase;
  double totalDeath;
  final double newCase;

  DataCase(this.date, this.totalCase, this.totalDeath, this.newCase);

  factory DataCase.fromJson(Map<String, dynamic> json){
    return DataCase(
        json['date'] as String,
        json['total_cases'],
        json['total_deaths'],
        json['new_cases'],
    );
  }
}

Future<List<CasesData>> fetchCases() async{
  print("Start parsing Cases/Deaths data.");
  String url = "https://covid.ourworldindata.org/data/owid-covid-data.json";
  final response = await http.get(url);
  if(response.statusCode == 200){

    Map<String, dynamic> _map = jsonDecode(response.body);
    List<dynamic> _list = <dynamic>[];
    _map.forEach((code, json) { _list.add(json); });

    return _list.map((json) => CasesData.fromJson(json)).toList();
  }
  else{
    throw Exception("Failed to load Cases");
  }
}