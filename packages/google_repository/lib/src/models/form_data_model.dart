/// FeedbackForm is a data class which stores data fields of Feedback.
class DataForm {
  String? accounts;
  String? nama_outlet;
  String? nama_pemilik_outlet;
  String? nomor_hp_pemilik_outlet;
  String? tipe_outlet;
  String? latitude;
  String? longitude;

  DataForm(this.accounts, this.nama_outlet, this.nama_pemilik_outlet, this.nomor_hp_pemilik_outlet, this.tipe_outlet, this.latitude, this.longitude);

  factory DataForm.fromJson(dynamic json) {
    return DataForm("${json['accounts']}", "${json['nama_outlet']}",
        "${json['nama_pemilik_outlet']}", "${json['nomor_hp_pemilik_outlet']}",
        "${json['tipe_outlet']}", "${json['latitude']}", "${json['longitude']}");
  }

  // Method to make GET parameters.
  Map toJson() => {
    'accounts': accounts,
    'nama_outlet': nama_outlet,
    'nama_pemilik_outlet': nama_pemilik_outlet,
    'nomor_hp_pemilik_outlet': nomor_hp_pemilik_outlet,
    'tipe_outlet': tipe_outlet,
    'latitude': latitude,
    'longitude': longitude,
  };
}