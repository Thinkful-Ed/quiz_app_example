import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_ui/vertical_card.dart';
import 'package:travel_ui/horizontal_card.dart';
import 'package:travel_ui/places.dart';
import 'package:travel_ui/touriest_place.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map place = places[0];
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CupertinoTabBar(
            currentIndex: _index,
            onTap: (value) {
              setState(() {
                _index = value;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                Icons.favorite,
              )),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
              ),
            ]),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: ListView(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10)),
                      child: IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            color: Colors.grey,
                            'assets/images/menu.png',
                          ))),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Current Loction',
                        style: TextStyle(color: Colors.grey.shade800),
                      ),
                      ElevatedButton.icon(
                          style: const ButtonStyle(
                              elevation: MaterialStatePropertyAll(0),
                              iconColor: MaterialStatePropertyAll(Colors.blue)),
                          onPressed: () {},
                          icon: const Icon(Icons.location_on),
                          label: const Text(
                            'New Delhi,India',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                  const CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/circleavatar1.png'),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Catagory',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  Expanded(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'View all',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      )
                    ],
                  )),
                  Icon(
                    Icons.arrow_right_alt_rounded,
                    color: Colors.blue,
                  )
                ],
              ),

              const SizedBox(
                height: 20,
              ),
              TourPlaces(),

            
              const SizedBox(
                height: 20,
              ),
              HorizontalCard(),
            
              const SizedBox(
                height: 30,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Destination',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  Expanded(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'View all',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      )
                    ],
                  )),
                  Icon(
                    Icons.arrow_right_alt_rounded,
                    color: Colors.blue,
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
             
              VerticalCard(),
            ]),
          ),
        ),
      ),
    );
  }
}

