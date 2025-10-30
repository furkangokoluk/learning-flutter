import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final url = "https://docs.kariyer.net/candidate/000/033/963/avatar/3396389920250312074317514.jpg?filesec=XdsV1VzBKiPzRwcAz5MUUh4NOCPTeN1vIXAIocT1wPYIzQa4DBaEjOpYnZSxq0UvCRpPsPS%2FzfxFITIO9x%2F7p2duQE7T4sMY!e!";

  Widget _buildItem(String value, String label){
    return Expanded(
      child: Column(
        children: [
          Text(
            value ,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label ,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          title: Text("Profil Sayfası"),
          centerTitle: true),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
                children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(url),
                ),
                SizedBox(height: 16),
                Text(
                  "Furkan Gökoluk", 
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  ),
                ),
                 Text(
                  "Flutter Geliştiricisi", 
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 24),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        _buildItem("1.5K", "Takipçi"),
                        _buildItem("2.5K", "Takip"),
                        _buildItem("150", "Gönderi"),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hakkımda",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Flutter ile mobil geliştirmeyi seviyorum. Yeni teknolojileri öğrenmek ve projeler geliştirmek en büyük tutkum."
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
