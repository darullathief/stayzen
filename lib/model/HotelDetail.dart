class HotelModel {
  String kdHotel;
  String nmHotel;
  String alamatHotel;
  String deskripsiHotel;
  String fotoHotel;
  Map<String, RoomTypeModel> tipeKamar;
  Map<String, ReviewModel> ulasan;

  HotelModel({
    required this.kdHotel,
    required this.nmHotel,
    required this.alamatHotel,
    required this.deskripsiHotel,
    required this.fotoHotel,
    required this.tipeKamar,
    required this.ulasan,
  });

  factory HotelModel.fromJson(Map<String, dynamic> json) {
    var tipeKamarMap = json['tipeKamar'] as Map<String, dynamic>;
    var ulasanMap = json['ulasan'] as Map<String, dynamic>;

    Map<String, RoomTypeModel> tipeKamar = {};
    Map<String, ReviewModel> ulasan = {};

    tipeKamarMap.forEach((key, value) {
      tipeKamar[key] = RoomTypeModel.fromJson(value);
    });

    ulasanMap.forEach((key, value) {
      ulasan[key] = ReviewModel.fromJson(value);
    });

    return HotelModel(
      kdHotel: json['kdHotel'],
      nmHotel: json['nmHotel'],
      alamatHotel: json['alamatHotel'],
      deskripsiHotel: json['deskripsiHotel'],
      fotoHotel: json['fotoHotel'],
      tipeKamar: tipeKamar,
      ulasan: ulasan,
    );
  }
}

class RoomTypeModel {
  String idTipe;
  String nmTipe;
  String harga;
  String deskripsiFasilitas;
  String fotoKamar;

  RoomTypeModel({
    required this.idTipe,
    required this.nmTipe,
    required this.harga,
    required this.deskripsiFasilitas,
    required this.fotoKamar,
  });

  factory RoomTypeModel.fromJson(Map<String, dynamic> json) {
    return RoomTypeModel(
      idTipe: json['idTipe'],
      nmTipe: json['nmTipe'],
      harga: json['harga'],
      deskripsiFasilitas: json['deskripsiFasilitas'],
      fotoKamar: json['fotoKamar'],
    );
  }
}

class ReviewModel {
  String kdUlasan;
  String tglUlasan;
  String isiUlasan;
  String fotoUlasan;
  String idPengguna;

  ReviewModel({
    required this.kdUlasan,
    required this.tglUlasan,
    required this.isiUlasan,
    required this.fotoUlasan,
    required this.idPengguna,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      kdUlasan: json['kdUlasan'],
      tglUlasan: json['tglUlasan'],
      isiUlasan: json['isiUlasan'],
      fotoUlasan: json['fotoUlasan'],
      idPengguna: json['idPengguna'],
    );
  }
}