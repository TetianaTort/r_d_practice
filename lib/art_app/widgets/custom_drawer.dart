import 'package:flutter/material.dart';
import 'package:r_d_practice/art_app/controller/art_controller.dart';
import 'package:r_d_practice/art_app/data/art_data.dart';
import 'package:r_d_practice/art_app/screens/information_screen.dart';

class CustomDrawer extends StatelessWidget {
  final Function getGalleryId;
  final ArtController controller;
  const CustomDrawer({
    super.key,
    required this.getGalleryId,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InformationScreen(
                      controller: controller,
                    ),
                  ),
                );
              },
              child: const Text('Information'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                getGalleryId(0);
              },
              child: const Text('All Arts'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: galleryListData.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      getGalleryId(index + 1);
                    },
                    child: Column(
                      children: [
                        Image.network(galleryListData[index].imageUrl),
                        Text(
                          galleryListData[index].name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
