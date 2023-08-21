// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:travel_ui/places.dart';

class DetailPage extends StatefulWidget {
  final Map place;
  final bool isHor;
  const DetailPage({
    Key? key,
    required this.place,
    this.isHor = false,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  IconData icon = Icons.favorite_border;
  bool active = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        padding: EdgeInsets.all(10),
        children: [
          SizedBox(
            height: 300,
            width: double.maxFinite,
            child: Stack(
              // fit: StackFit.expand,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage(widget.isHor
                              ? widget.place['horimg']
                              : widget.place['img']),
                          fit: BoxFit.cover)),
                ),
                Positioned(
                  left: 10,
                  top: 10,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        )),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            if (active) {
                              icon = Icons.favorite_rounded;
                              active = false;
                            } else {
                              icon = Icons.favorite_border;
                              active = true;
                            }
                          });
                        },
                        icon: Icon(
                          icon,
                          color: Colors.red,
                        )),
                  ),
                )
              ],
            ),
          ),
          Card(
            surfaceTintColor: Colors.white,
            elevation: 5,
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              width: double.infinity,
              height: 480,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Column(children: [
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  title: Text(
                    widget.isHor
                        ? widget.place['horname']
                        : widget.place['name'],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.blue,
                        size: 17,
                        weight: 10,
                      ),
                      Text(
                        widget.isHor
                            ? widget.place['horlocation']
                            : widget.place['location'],
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  trailing: Text(
                    widget.place['price'],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    widget.place['details'],
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold),
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Preview',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    Expanded(
                        child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        )
                      ],
                    )),
                    Text(
                      widget.place['rating'],
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 110,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: places.length,
                    itemBuilder: (context, index) {
                      Map plc = places[index];
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 5,
                          right: 15,
                        ),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(plc['preimg']))),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 300,
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      'Book Now',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                ),
              ]),
            ),
          )
        ],
      ),
    ));
  }
}












// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';

// import 'package:travel_ui/places.dart';

// class DetailPage extends StatelessWidget {
//   final Map place;
//   final bool isHor;
//   const DetailPage({
//     Key? key,
//     required this.place,
//     this.isHor = false,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     IconData icon = Icons.favorite_border;
//     return Scaffold(
//         body: SafeArea(
//       child: ListView(
//         padding: EdgeInsets.all(10),
//         children: [
//           SizedBox(
//             height: 300,
//             width: double.maxFinite,
//             child: Stack(
//               // fit: StackFit.expand,
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       image: DecorationImage(
//                           image: AssetImage(
//                               isHor ? place['horimg'] : place['img']),
//                           fit: BoxFit.cover)),
//                 ),
//                 Positioned(
//                   left: 10,
//                   top: 10,
//                   child: Container(
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15),
//                         color: Colors.white),
//                     child: IconButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         icon: Icon(
//                           Icons.arrow_back,
//                           color: Colors.black,
//                         )),
//                   ),
//                 ),
//                 Positioned(
//                   right: 10,
//                   top: 10,
//                   child: Container(
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15),
//                         color: Colors.white),
//                     child: IconButton(
//                         onPressed: () {
//                           icon = Icons.favorite_rounded;
//                         },
//                         icon: Icon(
//                           icon,
//                           color: Colors.red,
//                         )),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Card(
//             surfaceTintColor: Colors.white,
//             elevation: 5,
//             child: Container(
//               padding: EdgeInsets.only(left: 10, right: 10),
//               width: double.infinity,
//               height: 480,
//               decoration:
//                   BoxDecoration(borderRadius: BorderRadius.circular(20)),
//               child: Column(children: [
//                 SizedBox(
//                   height: 20,
//                 ),
//                 ListTile(
//                   title: Text(
//                     isHor ? place['horname'] : place['name'],
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//                   ),
//                   subtitle: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Icon(
//                         Icons.location_on,
//                         color: Colors.blue,
//                         size: 17,
//                         weight: 10,
//                       ),
//                       Text(
//                         isHor ? place['horlocation'] : place['location'],
//                         style: TextStyle(
//                             color: Colors.blue, fontWeight: FontWeight.bold),
//                       )
//                     ],
//                   ),
//                   trailing: Text(
//                     place['price'],
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 10, right: 10),
//                   child: Text(
//                     place['details'],
//                     style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.black54,
//                         fontWeight: FontWeight.bold),
//                     maxLines: 6,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Preview',
//                       style:
//                           TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
//                     ),
//                     Expanded(
//                         child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Icon(
//                           Icons.star,
//                           color: Colors.yellow,
//                         )
//                       ],
//                     )),
//                     Text(
//                       place['rating'],
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 17,
//                           fontWeight: FontWeight.w500),
//                     )
//                   ],
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Container(
//                   height: 110,
//                   child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: places.length,
//                     itemBuilder: (context, index) {
//                       Map plc = places[index];
//                       return Padding(
//                         padding: const EdgeInsets.only(
//                           left: 5,
//                           right: 15,
//                         ),
//                         child: Container(
//                           width: 100,
//                           height: 100,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               image: DecorationImage(
//                                   fit: BoxFit.cover,
//                                   image: AssetImage(plc['preimg']))),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Container(
//                   width: 300,
//                   height: 45,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10))),
//                     child: Text(
//                       'Book Now',
//                       style: TextStyle(fontSize: 20, color: Colors.white),
//                     ),
//                     onPressed: () {},
//                   ),
//                 ),
//               ]),
//             ),
//           )
//         ],
//       ),
//     ));
//   }
// }
