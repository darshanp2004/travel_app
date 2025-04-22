import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:travel_app/utils/string.dart';

class packageDetailsScreen extends StatefulWidget {
  const packageDetailsScreen({super.key});

  @override
  State<packageDetailsScreen> createState() => _packageDetailsScreenState();
}

class _packageDetailsScreenState extends State<packageDetailsScreen> {
  final ScrollController _controller = ScrollController();
  bool isFavorited = false;
  Set<String> favoritePlace = {};
  List<Map<String, String>> locations = [
    {"place": "Bali", "days": "6 days , 5 nights", "price": "INR 1,59,000"},
    {"place": "Maldivs", "days": "8 days ,  7nights", "price": "INR 1,79,999"},
    {"place": "Paris", "days": "5 days , 4 nights", "price": "INR 99,999"},
    {
      "place": "Hong Kong",
      "days": "8 days , 7 nights",
      "price": "INR 1,24,999",
    },
    {"place": "Berlin", "days": "9 days , 8 nights", "price": "INR 1,99,999"},
    {"place": "Rome", "days": "6 days , 5 nights", "price": "INR 1,59,000"},
    {"place": "Bhutan", "days": "8 days , 7 nights", "price": "INR 1,79,999"},
    {"place": "Bangkok", "days": "5 days , 4 nights", "price": "INR 99,999"},
    {
      "place": "Singapore",
      "days": "8 days , 7 nights",
      "price": "INR 1,24,999",
    },
    {"place": "Dubai", "days": "9 days , 8 nights", "price": "INR 1,99,999"},
    {"place": "Phuket", "days": "6 days , 5 nights", "price": "INR 1,59,000"},
    {"place": "New York", "days": "8 days , 7 nights", "price": "INR 1,79,999"},
    {"place": "Amsterdam", "days": "5 days , 4 nights", "price": "INR 99,999"},
    {"place": "Madrid", "days": "8 days , 7 nights", "price": "INR 1,24,999"},
    {"place": "Tokyo", "days": "9 days , 8 nights", "price": "INR 1,99,999"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(packageDetail),
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30)),
        ),
        flexibleSpace: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.white),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 50),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30)),
            ),
          ),
        ),
      ),

      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 50),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topRight: Radius.circular(30)),
            ),
            child: SizedBox(
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Expanded(
                    child: Scrollbar(
                      interactive: true,
                      thickness: 10,
                      radius: Radius.circular(10),
                      controller: _controller,
                      child: ListView.builder(
                        controller: _controller,
                        itemCount: locations.length,
                        itemBuilder: (context, index) {
                          final location = locations[index];
                          final isFavorited = favoritePlace.contains(
                            location[place]!,
                          );
                          return Card(
                            surfaceTintColor: Colors.lightBlue,
                            margin: EdgeInsets.only(
                              left: 20,
                              right: 20,
                              bottom: 10,
                            ),
                            child: ListTile(
                              title: Text(
                                location[place]!,
                                style: TextStyle(fontSize: 18),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(location[days]!),
                                  Text(location[price]!),
                                ],
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      isFavorited
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: isFavorited ? Colors.red : null,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (isFavorited) {
                                          favoritePlace.remove(
                                            location[place]!,
                                          );
                                        } else {
                                          favoritePlace.add(location[place]!);
                                        }
                                        print("$likedPlaces : $favoritePlace");
                                      });
                                    },
                                  ),
                                  IconButton(
                                    onPressed: () async {
                                      Share.share(
                                        "$place : ${location[place]!}\n"
                                        "$duration : ${location[days]!}\n"
                                        "$price : ${location[price]!}\n",
                                      );
                                    },
                                    icon: Icon(Icons.share),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30, top: 15),
            width: 300,
            height: 45,
            child: SearchBar(
              hintText: search,
              trailing: [Icon(Icons.search)],
              hintStyle: WidgetStateProperty.all(TextStyle(fontSize: 15)),
            ),
          ),
        ],
      ),
    );
  }
}
