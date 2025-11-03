import 'package:data_extraction_listing/models/photos_model.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class DioUse extends StatelessWidget {
  const DioUse({super.key});

  Future<List<Photo>> _getPhotos() async {
    try {
      final dio = Dio();
      var url = "https://jsonplaceholder.typicode.com/photos";
      var response = await dio.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final List<Photo> photoList = data
            .map((e) => Photo.fromJson(e))
            .toList();
        return photoList;
      } else {
        return [];
      }
    } on DioException catch (e) {
      return Future.error(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dio Kullanımı")),
      body: photoList(),
    );
  }

  FutureBuilder<List<Photo>> photoList() {
    return FutureBuilder(
      future: _getPhotos(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var photos = snapshot.data!;
          return ListView.builder(
            itemCount: photos.length,
            itemBuilder: (context, index) {
              var element = photos[index];
              return ExpansionTile(
                title: Text(element.title),
                leading: CircleAvatar(child: Text(element.albumId.toString())),
                children: [Image.network("element.url")],
              );
            },
          );
        } else if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
