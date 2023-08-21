import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_ui/detail_page.dart';
import 'package:travel_ui/places.dart';

class HorizontalCard extends StatefulWidget {
  const HorizontalCard({super.key});

  @override
  State<HorizontalCard> createState() => _HorizontalCardState();
}

class _HorizontalCardState extends State<HorizontalCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: places.length,
        itemBuilder: (context, index) {
          Map place = places[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => DetailPage(
                            place: place,
                            isHor: true,
                          ))),
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 200,
                    width: 250,
                    padding: const EdgeInsets.only(
                      top: 135,
                    ),
                    child: ListTile(
                      title: Text(place['horname'],
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold)),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 18.0,
                            color: Colors.white,
                          ),
                          Text(
                            place['horlocation'],
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      trailing: Text(place['horprice'],
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(place['horimg'])),
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
