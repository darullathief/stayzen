class Hotel {
  String kdHotel;
  String nmHotel;
  String alamatHotel;
  String deskripsiHotel;
  String fotoHotel;

  Hotel({
    required this.kdHotel,
    required this.nmHotel,
    required this.alamatHotel,
    required this.deskripsiHotel,
    required this.fotoHotel,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      kdHotel: json['kdHotel'],
      nmHotel: json['nmHotel'],
      alamatHotel: json['alamatHotel'],
      deskripsiHotel: json['deskripsiHotel'],
      fotoHotel: json['fotoHotel'],
    );
  }
}