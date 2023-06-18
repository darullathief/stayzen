import 'dart:convert';
import 'package:stayzen/model/HotelDetail.dart';

import '../model/Hotels.dart';
import 'package:http/http.dart' as http;

class HotelDetailController {

  List<HotelModel> hotel = [];
  final String apiUrl;

  HotelDetailController({required String id}) : apiUrl = 'https://darullathief.000webhostapp.com/hotel/getById.php?id=$id';

  Future<List<HotelModel>> fetchHotels() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      List<HotelModel> hotels = [];

      for (var item in jsonData) {
        HotelModel hotel = HotelModel.fromJson(item);
        hotels.add(hotel);
      }

      return hotels;
    } else {
      throw Exception('Failed to load hotels');
    }
  }
}
