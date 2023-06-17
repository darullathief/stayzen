import 'dart:convert';
import '../model/Hotels.dart';
import 'package:http/http.dart' as http;

class HotelDetailController {

  List<Hotel> hotel = [];
  final String apiUrl;

  HotelDetailController({required String id}) : apiUrl = 'https://darullathief.000webhostapp.com/hotel/getById.php?id=$id';

  Future<List<Hotel>> fetchHotels() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      List<Hotel> hotels = [];

      for (var item in jsonData) {
        Hotel hotel = Hotel.fromJson(item);
        hotels.add(hotel);
      }

      return hotels;
    } else {
      throw Exception('Failed to load hotels');
    }
  }
}
