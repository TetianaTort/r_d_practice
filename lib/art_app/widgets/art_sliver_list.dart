import 'package:flutter/material.dart';
import 'package:r_d_practice/art_app/controller/art_controller.dart';
import 'package:r_d_practice/art_app/screens/art_details_screen.dart';

class ArtSliverList extends StatelessWidget {
  const ArtSliverList({super.key, required this.controller});

  final ArtController controller;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ArtDetailsScreen(artItem: controller.artList[index]),
                  ),
                );
              },
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Image.network(controller.artList[index].imgUrl),
                  Text(
                    controller.artList[index].name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        },
        childCount: controller.artList.length,
      ),
    );
  }
}
