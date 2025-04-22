import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:timelines_plus/timelines_plus.dart';
import 'package:travel_app/timeline_cubit/timeline_cubit.dart';
import 'package:travel_app/timeline_cubit/timeline_cubit_state.dart';
import 'package:travel_app/utils/string.dart';
import 'package:url_launcher/url_launcher.dart';

class FoodOrderScreen extends StatefulWidget {
  const FoodOrderScreen({super.key});

  @override
  State<FoodOrderScreen> createState() => _FoodOrderScreenState();
}

class Order {
  String? item;
  int price;
  int tax;
  int total;
  String? terms;
  final List<String> status;

  Order(this.item,
      this.price,
      this.tax,
      this.total,
      this.terms,
      this.status,);
}

class _FoodOrderScreenState extends State<FoodOrderScreen> {
  List<Order> content = [
    Order(
      "Farm Villa Pizza",
      799,
      101,
      900,
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur molestie aliquam mi id fringilla. Cras at euismod ipsum.",
      [
        "Order Place Successfully",
        "Order is on the way",
        "Delivered Successfully",
      ],
    ),
  ];

  double latitude = 23.0225;
  double longitude = 72.5714;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TimeLine"), backgroundColor: Colors.blue),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: ListView.builder(
          itemCount: content.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${content[index].item}", style: TextStyle(fontSize: 20)),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Price", style: TextStyle(color: Colors.grey[700])),
                    Text("₹ ${content[index].price}"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("GST", style: TextStyle(color: Colors.grey[700])),
                    Text("₹ ${content[index].tax}"),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Total"), Text("₹ ${content[index].total}")],
                ),
                Divider(),
                Text("Terms & Conditions", style: TextStyle(fontSize: 15)),
                Text(
                  "${content[index].terms}",
                  style: TextStyle(color: Colors.grey[700]),
                ),
                Divider(),
                BlocBuilder<ShowDetailsCubit, ShowDetailsState>(
                    builder: (context, state) {
                      return FixedTimeline(
                        theme: TimelineTheme.of(context).copyWith(
                            nodePosition: 0),
                        children: [
                          CustomTimelineTile(
                            title: content[0].status[0],
                            indicatorShape: Icon(
                                Icons.fastfood_sharp,
                                color: Colors.blue),
                            endConnector: SolidLineConnector(),
                            icon: state.isExpanded[0]
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            subStatus: state.isExpanded[0]
                                ? state.subStatus[0]
                                : null,
                            onIconPressed: () {
                              context.read<ShowDetailsCubit>().showSubStatus(0);
                            },
                          ),
                          CustomTimelineTile(
                            title: content[0].status[1],
                            indicatorShape: Icon(
                              Icons.directions_bike,
                              color: Colors.orange,
                            ),
                            startConnector: SolidLineConnector(),
                            endConnector: SolidLineConnector(),
                            icon: state.isExpanded[1]
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            subStatus: state.isExpanded[1]
                                ? state.subStatus[1]
                                : null,
                            onIconPressed: () {
                              context.read<ShowDetailsCubit>().showSubStatus(1);
                            },
                          ),
                          CustomTimelineTile(
                            title: content[0].status[2],
                            indicatorShape: Icon(
                              Icons.insert_emoticon_sharp,
                              color: Colors.green,
                            ),
                            startConnector: SolidLineConnector(),
                          ),
                        ],
                      );
                    }
                ),
                SizedBox(height: 10,),
                Center(child: Text(
                  "Track Your Delivery", style: TextStyle(fontSize: 20),)),
                SizedBox(height: 15),
                Center(
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 300,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: GoogleMap(
                            initialCameraPosition: CameraPosition(
                              target: LatLng(latitude, longitude),
                              zoom: 15,
                            ),
                            zoomControlsEnabled: false,
                            gestureRecognizers:
                            <Factory<OneSequenceGestureRecognizer>>{
                              Factory<OneSequenceGestureRecognizer>(
                                    () => EagerGestureRecognizer(),
                              ),
                            },
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () async {
                              Uri googleMapsUrl = Uri.parse(
                                "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude",
                              );
                              if (await canLaunchUrl(googleMapsUrl)) {
                                await launchUrl(googleMapsUrl);
                              } else {
                                print("Cannot open Google Maps");
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

// Custom widget for TimeLine...
class CustomTimelineTile extends StatelessWidget {
  final String title;
  final Widget indicatorShape;
  final Connector? startConnector;
  final Connector? endConnector;
  final IconData? icon;
  final VoidCallback? onIconPressed;
  final String? subStatus;

  const CustomTimelineTile({
    super.key,
    required this.title,
    required this.indicatorShape,
    this.startConnector,
    this.endConnector,
    this.icon,
    this.onIconPressed,
    this.subStatus,
  });

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      contents: Padding(
        padding: EdgeInsets.all(15),
        child: Theme(
          data: ThemeData().copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            tilePadding: EdgeInsets.zero,
            title: Text(title, style: TextStyle(fontSize: 16)),
            subtitle:
            subStatus != null
                ? Text(
              subStatus!,
              style: TextStyle(fontSize: 15, color: Colors.grey[700]),
            )
                : null,
            trailing: Icon(icon),
            // optional custom trailing icon
            onExpansionChanged: (expanded) {
              onIconPressed!();
            },
          ),
        ),
      ),
      node: TimelineNode(
        indicator: indicatorShape,
        startConnector: startConnector,
        endConnector: endConnector,
      ),
    );
  }
}
