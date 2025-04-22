import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:timelines_plus/timelines_plus.dart';

class demoscreen extends StatefulWidget {
  const demoscreen({super.key});

  @override
  State<demoscreen> createState() => _demoscreenState();
}

class _demoscreenState extends State<demoscreen> {
  // late VideoPlayerController _controller;
  // late Future<void> _initializeVideoPlayerFuture;
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _controller = VideoPlayerController.networkUrl(Uri.parse(
  //       'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'));
  //   _initializeVideoPlayerFuture = _controller.initialize();
  // }
  //
  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  // List <int> numbers=[1,2,3,4];
  //
  // void add(){
  //   int last=numbers.last;
  //   numbers.add(last+1);
  // }

  showAlert() {
    return AlertDialog(
      title: Text("Simple Alert"),
      content: Text("This is an alert message"),
      actions: [
        TextButton(
          child: Text("Ok"),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // double latitude = 23.0225;
    // double longitude = 72.5714;
    return Scaffold(
      // body: SafeArea(
      //   child: Center(
      //     child: _controller.value.isInitialized
      //         ? AspectRatio(
      //       aspectRatio: _controller.value.aspectRatio,
      //       child: VideoPlayer(_controller),
      //     )
      //         : CircularProgressIndicator(),
      //   ),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     setState(() {
      //       _controller.value.isPlaying
      //           ? _controller.pause()
      //           : _controller.play();
      //     });
      //   },
      //   child: Icon(
      //     _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
      //   ),
      // ),
      // appBar: AppBar(
      //   title: Text("TimeLine"),
      //   backgroundColor: Colors.blue,
      // ),
      // body:  Timeline.tileBuilder(
      //   builder: TimelineTileBuilder.fromStyle(
      //     contentsAlign: ContentsAlign.alternating,
      //     contentsBuilder: (context, index) => Padding(
      //       padding: const EdgeInsets.all(24.0),
      //       child: Text('Timeline Event $index'),
      //     ),
      //     itemCount: 10,
      //   ),
      // ),

      // body:  Center(
      //   child: Stack(
      //     alignment: Alignment.center,
      //     children: [
      //       SizedBox(
      //         width: 300,
      //         height: 100,
      //         child: GoogleMap(
      //           initialCameraPosition: CameraPosition(
      //             target: LatLng(latitude, longitude),
      //             zoom: 15,
      //           ),
      //           gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
      //             Factory<OneSequenceGestureRecognizer>(() => EagerGestureRecognizer()),
      //           },
      //         ),
      //       ),
      //       Positioned.fill(
      //         child: Material(
      //           color: Colors.transparent,
      //           child: InkWell(
      //             onTap: () async {
      //               Uri googleMapsUrl = Uri.parse(
      //                 "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude",
      //               );
      //               if (await canLaunchUrl(googleMapsUrl)) {
      //                 await launchUrl(googleMapsUrl);
      //               } else {
      //                 print("Cannot open Google Maps");
      //               }
      //             },
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),


      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return showAlert();
              },
            );
          },
          child: Text("Simple Alert"),
        ),
      ),
    );
  }
}
