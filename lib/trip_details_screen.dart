import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/utils/string.dart';
import 'home_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';

class tripDeatilsScreen extends StatefulWidget {
  TripDetails tripDetails;
  

  tripDeatilsScreen({
    required this.tripDetails,
  });

  @override
  State<tripDeatilsScreen> createState() => _tripDeatilsScreenState();
}

class _tripDeatilsScreenState extends State<tripDeatilsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 350,
                    viewportFraction: 1,
                    autoPlay: true,
                    autoPlayInterval: Duration(milliseconds: 2500),
                  ), items: widget.tripDetails.imagePaths
                    .map((img) => Image.asset(img, fit: BoxFit.cover))
                .toList(),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.tripDetails.title!, style: TextStyle(fontSize: 24)),
                  SizedBox(height: 10),
                  Text(
                    widget.tripDetails.price!,
                    style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                  ),
                  SizedBox(height: 15),
                  Text(widget.tripDetails.description!, style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.grey[400],
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(addFav, style: TextStyle(color: Colors.black)),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.grey[400],
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(bookTrip, style: TextStyle(color: Colors.black)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
