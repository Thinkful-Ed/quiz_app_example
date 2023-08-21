import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_ui/detail_page.dart';
import 'package:travel_ui/places.dart';

class VerticalCard extends StatefulWidget {
  const VerticalCard({super.key});

  @override
  State<VerticalCard> createState() => _VerticalCardState();
}

class _VerticalCardState extends State<VerticalCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120 * places.length.toDouble(),
      child: ListView.builder(
        itemCount: places.length,
        itemBuilder: (context, index) {
          Map place = places[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => DetailPage(place: place))),
              child: Card(
                  elevation: 2.0,
                  child: Container(
                      height: 120,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            place['img'],
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: Container(
                              width: 200,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    place['name'],
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: Colors.blue,
                                        size: 17,
                                        weight: 10,
                                      ),
                                      Text(
                                        place['location'],
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  Text(
                                    place['details'],
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    place['price'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ))),
            ),
          );
        },
      ),
    );
  }
}
