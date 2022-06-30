// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unused_import, avoid_unnecessary_containers

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wallpaperapp/model/wallpapermodel.dart';
import 'package:wallpaperapp/views/imageview.dart';

Widget BrandName() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    // ignore: prefer_const_literals_to_create_immutables
    children: [
      Text(
        "Wallpaper",
        style: TextStyle(color: Colors.black87),
      ),
      Text(
        "Hub",
        style: TextStyle(color: Colors.blue),
      )
    ],
  );
}

Widget WallpaperList({required List<WallpaperModel> wallpapers, context}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        crossAxisSpacing: 6,
        mainAxisSpacing: 6,
        childAspectRatio: 0.6,
        children: wallpapers.map((wallpaper) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ImageView(
                            imgUrl: wallpaper.src!.portrait!,
                          )));
            },
            child: Hero(
              tag: wallpaper.src!.portrait!,
              child: GridTile(
                  child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    wallpaper.src!.portrait!,
                    fit: BoxFit.cover,
                  ),
                ),
              )),
            ),
          );
        }).toList()),
  );
}
