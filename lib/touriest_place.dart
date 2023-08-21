import 'package:flutter/material.dart';
import 'package:travel_ui/detail_page.dart';
import 'package:travel_ui/places.dart';

class TourPlaces extends StatefulWidget {
  const TourPlaces({super.key});

  @override
  State<TourPlaces> createState() => _TourPlacesState();
}

class _TourPlacesState extends State<TourPlaces> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: places.length,
        itemBuilder: (context, index) {
          Map place = places[index];
          return Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Chip(
              elevation: 0.4,
              label: Text(
                place['place'],
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
              ),
              backgroundColor: Colors.grey.shade300,
              avatar: Image.asset(place['icon']),
              shape: RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)),
            ),
          );
        },
      ),
    );
  }
}
