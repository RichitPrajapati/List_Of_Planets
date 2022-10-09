import 'package:flutter/material.dart';
import 'package:list_of_planet/Globals.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..repeat();}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade600,
      appBar: AppBar(
        title: Text("GALAXY PLANETS"),
        centerTitle: true,
        leading: Icon(Icons.menu),
        actions: [Icon(Icons.search_rounded)],
        flexibleSpace: Container(
        decoration: const BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.blueAccent,Colors.lightBlue
        ],
      ),
    ),
    ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [...Global.planets
              .map(
                (e) => GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed('detailpage', arguments: e);
              },
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 70),
                    margin: EdgeInsets.only(
                        left: 100, bottom: 20, top: 20, right: 20),
                    height: 190,
                    width: 370,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade700,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 25),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              e['planets'],
                              style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(Icons.more_vert, color: Colors.grey),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Milkyway Gallexy",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        SizedBox(height: 40),
                        Row(
                          children: [
                            Icon(Icons.my_location, color: Colors.grey),
                            SizedBox(width: 5),
                            Text(
                              e['km'],
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(width: 10),
                            Icon(Icons.unfold_less, color: Colors.grey),
                            SizedBox(height: 5),
                            Text(
                              e['m/s'],
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  RotationTransition(
                    turns: animationController,
                    child: Hero(
                      tag: e['tag'],
                      child: Container(
                        height: 145,
                        width: 145,
                        margin: EdgeInsets.all(15),
                        child: Image.asset(
                          e['images'],

                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
              .toList(),
          ],
        ),
      ),
    );
  }
}
