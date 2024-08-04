import 'dart:convert';

class SheetDataFieldsModels {
  // static String no = 'no';
  static String accounts = 'accounts';
  static String nama_outlet = 'nama_outlet';
  static String nama_pemilik_outlet = 'nama_pemilik_outlet';
  static String nomor_hp_pemilik_outlet = 'nomor_hp_pemilik_outlet';
  static String tipe_outlet = 'tipe_outlet';
  static String outlet_operator = 'outlet_operator';
  static String latitude = 'latitude';
  static String longitude = 'longitude';
  static String poto = 'poto';

  static List<String> getFields() => [accounts,nama_outlet,nama_pemilik_outlet,nomor_hp_pemilik_outlet,tipe_outlet,outlet_operator,latitude,longitude,poto];
}

class SheetData{
  // final int? no;
  final String? accounts;
  final String? nama_outlet;
  final String? nama_pemilik_outlet;
  final String? nomor_hp_pemilik_outlet;
  final String? tipe_outlet;
  final String? outlet_operator;
  final String? latitude;
  final String? longitude;
  final String? poto;

  const SheetData({
    // this.no,
    this.accounts,
    this.nama_outlet,
    this.nama_pemilik_outlet,
    this.nomor_hp_pemilik_outlet,
    this.tipe_outlet,
    this.outlet_operator,
    this.latitude,
    this.longitude,
    this.poto
  });

  static SheetData fromJson(Map<String, dynamic> json) => SheetData(
    // no: jsonDecode(json[SheetDataFieldsModels.no]),
    accounts: json[SheetDataFieldsModels.accounts],
    nama_outlet: json[SheetDataFieldsModels.nama_outlet],
    nama_pemilik_outlet: json[SheetDataFieldsModels.nama_pemilik_outlet],
    nomor_hp_pemilik_outlet: json[SheetDataFieldsModels.nomor_hp_pemilik_outlet],
    tipe_outlet: json[SheetDataFieldsModels.tipe_outlet],
    outlet_operator: json[SheetDataFieldsModels.outlet_operator],
    latitude: json[SheetDataFieldsModels.latitude],
    longitude: json[SheetDataFieldsModels.longitude],
    poto: json[SheetDataFieldsModels.poto]
  );

  Map<String, dynamic> toJson() =>{
    // SheetDataFieldsModels.no: no,
    SheetDataFieldsModels.accounts: accounts,
    SheetDataFieldsModels.nama_outlet: nama_outlet,
    SheetDataFieldsModels.nama_pemilik_outlet: nama_pemilik_outlet,
    SheetDataFieldsModels.nomor_hp_pemilik_outlet: nomor_hp_pemilik_outlet,
    SheetDataFieldsModels.tipe_outlet: tipe_outlet,
    SheetDataFieldsModels.outlet_operator: outlet_operator,
    SheetDataFieldsModels.latitude: latitude,
    SheetDataFieldsModels.longitude: longitude,
    SheetDataFieldsModels.poto: poto
  };
}