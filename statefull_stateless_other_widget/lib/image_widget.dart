import 'package:flutter/material.dart';

class ImageWidgets extends StatelessWidget {
  const ImageWidgets({super.key});

  final _url =
      "https://media.licdn.com/dms/image/v2/D4D03AQGNfBs_L2ujyg/profile-displayphoto-shrink_200_200/profile-displayphoto-shrink_200_200/0/1729858680504?e=2147483647&v=beta&t=T7dYH9EpcpAxJqhyFJMs2OZfF8W8f8gIJSOvDYcFFww";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Resim Widgetları")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    width: 300,
                    height: 300,
                    color: Colors.blue.shade200,
                    child: Image.asset(
                      "assets/images/pp2.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 300,
                    height: 300,
                    color: Colors.blue.shade200,
                    child: Image.network(_url, fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
            Expanded(
              child: FadeInImage.assetNetwork(
                placeholder: "assets/images/pp2.jpg", 
                image: _url,
              ),
            ),
            Expanded(
              child: Placeholder(
                color: Colors.amber,
              ),
            ),
            Expanded(
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/pp2.jpg"),
                radius: 100,
              ),
            )
          ],
        ),
      ),
    );
  }
}
