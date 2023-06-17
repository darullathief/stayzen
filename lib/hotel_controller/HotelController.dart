import 'dart:convert';
import 'package:flutter/services.dart';
import '../model/Hotels.dart';
import 'package:http/http.dart' as http;

class HotelController {
  List<Hotel> hotels = [];
  final String apiUrl = 'https://darullathief.000webhostapp.com/hotel/';

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
