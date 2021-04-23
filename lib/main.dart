import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'videopage.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/home": (context) => HomePage(),
        "/video": (context) => VideoPlayerWidget(),
      },
      initialRoute: "/home",
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffECEDED),
      appBar: AppBar(
        title: Text("Hiit School"),
        centerTitle: true,
        backgroundColor: Color(0xff27BD93),
      ),
      body: Center(
        child: ListView(
          children: [
            DescWidget(), // Puts some text in the header of the app

            // video tiles, add as many as you wish. But make sure to add thumbnail url(local)
            // and video url(network) tot them.
            VideoTile(
              videoName: "Squat to hook",
              thumbnailUrl: "images/squat.png",
              videoUrl:
                  "https://s3.amazonaws.com/freestock-transcoded-videos-prod/transcoded/freestock_v3241807.mp4",
            ),
            VideoTile(
              videoName: "Fast Feet Twist",
              thumbnailUrl: "images/fast_feet.png",
              videoUrl:
                  "https://s3.amazonaws.com/freestock-transcoded-videos-prod/transcoded/freestock_v3241807.mp4",
            ),
            VideoTile(
              videoName: "Skater With a Hop",
              thumbnailUrl: "images/skater.png",
              videoUrl:
                  "https://s3.amazonaws.com/freestock-transcoded-videos-prod/transcoded/freestock_v3241807.mp4",
            ),
            VideoTile(
              videoName: "Front Back Jumping Jack",
              thumbnailUrl: "images/jump.png",
              videoUrl:
                  "https://s3.amazonaws.com/freestock-transcoded-videos-prod/transcoded/freestock_v3241807.mp4",
            ),
            VideoTile(
              videoName: "Alternate Knee to Elbow",
              thumbnailUrl: "images/knee.png",
              videoUrl:
                  "https://s3.amazonaws.com/freestock-transcoded-videos-prod/transcoded/freestock_v3241807.mp4",
            ),
            VideoTile(
              videoName: "Marching",
              thumbnailUrl: "images/marching.png",
              videoUrl:
                  "https://s3.amazonaws.com/freestock-transcoded-videos-prod/transcoded/freestock_v3241807.mp4",
            ),
            VideoTile(
              videoName: "High Knees to Butt Kicker",
              thumbnailUrl: "images/highknee.png",
              videoUrl:
                  "https://s3.amazonaws.com/freestock-transcoded-videos-prod/transcoded/freestock_v3241807.mp4",
            ),
            VideoTile(
              videoName: "Ski",
              thumbnailUrl: "images/ski.png",
              videoUrl:
                  "https://s3.amazonaws.com/freestock-transcoded-videos-prod/transcoded/freestock_v3241807.mp4",
            )
          ],
        ),
      ),
    );
  }
}

// This is a header text widget for the app
class DescWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        style: TextStyle(
          color: Color(0xff525352),
        ),
      ),
    );
  }
}

class VideoTile extends StatelessWidget {
  final thumbnailUrl;
  final videoUrl;
  final videoName;

  VideoTile({this.thumbnailUrl, this.videoUrl, this.videoName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // this on tap gesture detector send the user to the video player page.
      onTap: () {
        VideoPlayerController vidController = VideoPlayerController.network(
            videoUrl); // making the video controller
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VideoPlayerWidget(
                  vidController:
                      vidController), // Chaning from main page to video page
            ));
      },
      child: Card(
        color: Color(0xffEdEdEd),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // This widget shows the thumbnail for the video
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(
                image: AssetImage(thumbnailUrl),
                width: MediaQuery.of(context).size.width *
                    .3, // restrics the image size to 30% of the screen width
              ),
            ),

            SizedBox(
              width: 10,
            ), // just adding some extra space

            // Shows the name of the video
            Text(
              videoName.toString(),
              style: TextStyle(
                color: Color(0xff525352),
              ),
            ),

            SizedBox(width: 10), // again adding some extra space

            Icon(
              Icons.arrow_right,
              color: Color(0xff27BD93),
            )
          ],
        ),
      ),
    );
  }
}
