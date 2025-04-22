import 'package:flutter/material.dart';
import 'package:travel_app/package_details_screen.dart';
import 'package:travel_app/trip_details_screen.dart';
import 'package:travel_app/utils/imageResources.dart';
import 'package:travel_app/utils/string.dart';


class homeScreen extends StatefulWidget {
  @override
  State<homeScreen> createState() => _homeScreenState();
}

class TripDetails {
  String? image;
  String? title;
  String? price;
  String? description;
  final List<String> imagePaths;

  TripDetails(
    this.image,
    this.title,
    this.price,
    this.description,
    this.imagePaths,
  );
}

class _homeScreenState extends State<homeScreen> {
  List<TripDetails> details = [
    TripDetails(
      "assets/images/shimla.svg",
      "Shimla",
      "Starting : INR 48,999",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec semper non massa id dictum. Fusce vitae imperdiet nibh, in consequat mauris. In lacinia turpis ex, eget tempor quam rutrum sed. Vestibulum aliquet convallis congue. Praesent id pellentesque sem. Aenean maximus nulla sit amet sapien finibus, sit amet faucibus orci interdum. Ut condimentum diam sit amet libero tempor, eu semper nisl luctus. Nunc efficitur, leo at mattis iaculis, lacus velit pellentesque nisi, eu dictum eros nibh vulputate diam. Suspendisse et arcu et elit gravida euismod a in turpis. Nunc consequat dictum nunc ac sagittis. Vestibulum egestas ligula bibendum lacus ornare hendrerit. Curabitur malesuada, diam sed mollis lacinia, arcu mi tempor diam, in imperdiet turpis diam quis tellus. Proin sit amet tellus erat.Vivamus id cursus erat. Nullam malesuada diam quis eros condimentum scelerisque. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Integer sollicitudin odio ac porta gravida. Cras tincidunt condimentum diam in accumsan. Ut in velit finibus, bibendum neque sed, gravida sapien. Donec imperdiet erat sit amet nisi iaculis consectetur. Phasellus semper tempus nunc eu pulvinar. In tristique, dui non tincidunt auctor, diam urna ullamcorper felis, sit amet bibendum lacus ex id justo. Donec hendrerit leo.",
      [
        'assets/images/shimla1.svg',
        'assets/images/shimla2.svg',
        'assets/images/shimla3.svg',
      ],
    ),
    TripDetails(
      "assets/images/manali.svg",
      "Manali",
      "Starting : INR 35,999",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec semper non massa id dictum. Fusce vitae imperdiet nibh, in consequat mauris. In lacinia turpis ex, eget tempor quam rutrum sed. Vestibulum aliquet convallis congue. Praesent id pellentesque sem. Aenean maximus nulla sit amet sapien finibus, sit amet faucibus orci interdum. Ut condimentum diam sit amet libero tempor, eu semper nisl luctus. Nunc efficitur, leo at mattis iaculis, lacus velit pellentesque nisi, eu dictum eros nibh vulputate diam. Suspendisse et arcu et elit gravida euismod a in turpis. Nunc consequat dictum nunc ac sagittis. Vestibulum egestas ligula bibendum lacus ornare hendrerit. Curabitur malesuada, diam sed mollis lacinia, arcu mi tempor diam, in imperdiet turpis diam quis tellus. Proin sit amet tellus erat.Vivamus id cursus erat. Nullam malesuada diam quis eros condimentum scelerisque. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Integer sollicitudin odio ac porta gravida. Cras tincidunt condimentum diam in accumsan. Ut in velit finibus, bibendum neque sed, gravida sapien. Donec imperdiet erat sit amet nisi iaculis consectetur. Phasellus semper tempus nunc eu pulvinar. In tristique, dui non tincidunt auctor, diam urna ullamcorper felis, sit amet bibendum lacus ex id justo. Donec hendrerit leo.",
      [
        'assets/images/manali1.svg',
        'assets/images/manali2.svg',
        'assets/images/manali3.svg',
      ],
    ),
    TripDetails(
      "assets/images/nainital.svg",
      "Nainital",
      "Starting : INR 41,499",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec semper non massa id dictum. Fusce vitae imperdiet nibh, in consequat mauris. In lacinia turpis ex, eget tempor quam rutrum sed. Vestibulum aliquet convallis congue. Praesent id pellentesque sem. Aenean maximus nulla sit amet sapien finibus, sit amet faucibus orci interdum. Ut condimentum diam sit amet libero tempor, eu semper nisl luctus. Nunc efficitur, leo at mattis iaculis, lacus velit pellentesque nisi, eu dictum eros nibh vulputate diam. Suspendisse et arcu et elit gravida euismod a in turpis. Nunc consequat dictum nunc ac sagittis. Vestibulum egestas ligula bibendum lacus ornare hendrerit. Curabitur malesuada, diam sed mollis lacinia, arcu mi tempor diam, in imperdiet turpis diam quis tellus. Proin sit amet tellus erat.Vivamus id cursus erat. Nullam malesuada diam quis eros condimentum scelerisque. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Integer sollicitudin odio ac porta gravida. Cras tincidunt condimentum diam in accumsan. Ut in velit finibus, bibendum neque sed, gravida sapien. Donec imperdiet erat sit amet nisi iaculis consectetur. Phasellus semper tempus nunc eu pulvinar. In tristique, dui non tincidunt auctor, diam urna ullamcorper felis, sit amet bibendum lacus ex id justo. Donec hendrerit leo.",
      [
        'assets/images/nainital1.svg',
        'assets/images/nainital2.svg',
        'assets/images/nainital3.svg',
      ],
    ),
    TripDetails(
      "assets/images/darjeeling.svg",
      "Darjeeling",
      "Starting : INR 54,999",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec semper non massa id dictum. Fusce vitae imperdiet nibh, in consequat mauris. In lacinia turpis ex, eget tempor quam rutrum sed. Vestibulum aliquet convallis congue. Praesent id pellentesque sem. Aenean maximus nulla sit amet sapien finibus, sit amet faucibus orci interdum. Ut condimentum diam sit amet libero tempor, eu semper nisl luctus. Nunc efficitur, leo at mattis iaculis, lacus velit pellentesque nisi, eu dictum eros nibh vulputate diam. Suspendisse et arcu et elit gravida euismod a in turpis. Nunc consequat dictum nunc ac sagittis. Vestibulum egestas ligula bibendum lacus ornare hendrerit. Curabitur malesuada, diam sed mollis lacinia, arcu mi tempor diam, in imperdiet turpis diam quis tellus. Proin sit amet tellus erat.Vivamus id cursus erat. Nullam malesuada diam quis eros condimentum scelerisque. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Integer sollicitudin odio ac porta gravida. Cras tincidunt condimentum diam in accumsan. Ut in velit finibus, bibendum neque sed, gravida sapien. Donec imperdiet erat sit amet nisi iaculis consectetur. Phasellus semper tempus nunc eu pulvinar. In tristique, dui non tincidunt auctor, diam urna ullamcorper felis, sit amet bibendum lacus ex id justo. Donec hendrerit leo.",
      [
        'assets/images/darjeeling1.svg',
        'assets/images/darjeeling2.svg',
        'assets/images/darjeeling3.svg',
      ],
    ),
    TripDetails(
      "assets/images/leh_ladakh.svg",
      "Leh Ladakh",
      "Starting : INR 61,999",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec semper non massa id dictum. Fusce vitae imperdiet nibh, in consequat mauris. In lacinia turpis ex, eget tempor quam rutrum sed. Vestibulum aliquet convallis congue. Praesent id pellentesque sem. Aenean maximus nulla sit amet sapien finibus, sit amet faucibus orci interdum. Ut condimentum diam sit amet libero tempor, eu semper nisl luctus. Nunc efficitur, leo at mattis iaculis, lacus velit pellentesque nisi, eu dictum eros nibh vulputate diam. Suspendisse et arcu et elit gravida euismod a in turpis. Nunc consequat dictum nunc ac sagittis. Vestibulum egestas ligula bibendum lacus ornare hendrerit. Curabitur malesuada, diam sed mollis lacinia, arcu mi tempor diam, in imperdiet turpis diam quis tellus. Proin sit amet tellus erat.Vivamus id cursus erat. Nullam malesuada diam quis eros condimentum scelerisque. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Integer sollicitudin odio ac porta gravida. Cras tincidunt condimentum diam in accumsan. Ut in velit finibus, bibendum neque sed, gravida sapien. Donec imperdiet erat sit amet nisi iaculis consectetur. Phasellus semper tempus nunc eu pulvinar. In tristique, dui non tincidunt auctor, diam urna ullamcorper felis, sit amet bibendum lacus ex id justo. Donec hendrerit leo.",
      [
        'assets/images/lehladakh1.svg',
        'assets/images/lehladakh2.svg',
        'assets/images/lehladakh3.svg',
      ],
    ),
    TripDetails(
      "assets/images/gulmarg.svg",
      "Gulmarg",
      "Starting : INR 56,499",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec semper non massa id dictum. Fusce vitae imperdiet nibh, in consequat mauris. In lacinia turpis ex, eget tempor quam rutrum sed. Vestibulum aliquet convallis congue. Praesent id pellentesque sem. Aenean maximus nulla sit amet sapien finibus, sit amet faucibus orci interdum. Ut condimentum diam sit amet libero tempor, eu semper nisl luctus. Nunc efficitur, leo at mattis iaculis, lacus velit pellentesque nisi, eu dictum eros nibh vulputate diam. Suspendisse et arcu et elit gravida euismod a in turpis. Nunc consequat dictum nunc ac sagittis. Vestibulum egestas ligula bibendum lacus ornare hendrerit. Curabitur malesuada, diam sed mollis lacinia, arcu mi tempor diam, in imperdiet turpis diam quis tellus. Proin sit amet tellus erat.Vivamus id cursus erat. Nullam malesuada diam quis eros condimentum scelerisque. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Integer sollicitudin odio ac porta gravida. Cras tincidunt condimentum diam in accumsan. Ut in velit finibus, bibendum neque sed, gravida sapien. Donec imperdiet erat sit amet nisi iaculis consectetur. Phasellus semper tempus nunc eu pulvinar. In tristique, dui non tincidunt auctor, diam urna ullamcorper felis, sit amet bibendum lacus ex id justo. Donec hendrerit leo.",
      [
        'assets/images/gulmarg1.svg',
        'assets/images/gulmarg2.svg',
        'assets/images/gulmarg3.svg',
      ],
    ),
  ];

  List<Map<String,String>> categories = [
    {'image': 'assets/images/adventure.svg', 'name': 'Adventure'},
    {'image': 'assets/images/honeymoon.svg', 'name': 'Honeymoon'},
    {'image': 'assets/images/nature.svg', 'name': 'Nature'},
    {'image': 'assets/images/family.svg', 'name': 'Family'},
    {'image': 'assets/images/trip.svg', 'name': 'Trip'},
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 240,
              width: 400,
              child: Stack(
                children: [
                  SizedBox(
                    height: 200,
                    width: 400,
                    child: Image.asset(bali_image, fit: BoxFit.fill),
                  ),
                  Positioned(
                    bottom: 95,
                    left: 10,
                    child: Text(
                      bali,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  Positioned(
                    bottom: 75,
                    left: 10,
                    child: Text(
                      subTitle,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    left: 10,
                    right: 10,
                    child: Container(
                      margin: EdgeInsetsDirectional.all(10.0),
                      width: 400,
                      height: 45,
                      child: SearchBar(
                        hintText: searchPlaceholder,
                        hintStyle: WidgetStateProperty.all(
                          TextStyle(fontSize: 12),
                        ),
                        padding: WidgetStateProperty.all(
                          EdgeInsets.only(bottom: 4, left: 10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 0.0,
                ),
                child: Row(
                  children: [
                    Icon(Icons.travel_explore),
                    SizedBox(width: 10),
                    Text(experiences, style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: List.generate(
                    categories.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(
                              categories[index][image]!,
                            ),
                            radius: 40,
                          ),
                          Text(categories[index][name]!),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Divider(thickness: 1, height: 30),
            Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 0,
                ),
                child: Row(
                  children: [
                    Icon(Icons.map),
                    SizedBox(
                     width: 8,
                    ),
                    Text(popularDest, style: TextStyle(fontSize: 20)),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => packageDetailsScreen(),
                          ),
                        );
                      },
                      child: Text(viewAll),
                    ),
                  ],
                ),
            ),
            SizedBox(height: 1),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: details.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => tripDeatilsScreen(
                                      tripDetails: details[index],

                                    ),
                              ),
                            );
                          },
                          child: Image.asset(
                            details[index].image!,
                            height: 100,
                            width: 200,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          details[index].title!,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          details[index].price!,
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
