import 'dart:convert';
import 'package:flutter/services.dart';
import '../model/hotels.dart';

class HotelController {
  List<Hotel> hotels = [];

  Future<void> fetchHotels() async {
    final String response =
    await rootBundle.loadString('assets/data/hotels.json');
    final data = jsonDecode(response);

    hotels = List<Hotel>.from(data.map((hotel) => Hotel.fromJson(hotel)));
  }
}