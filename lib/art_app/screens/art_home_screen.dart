import 'package:flutter/material.dart';
import 'package:r_d_practice/art_app/controller/art_controller.dart';
import 'package:r_d_practice/art_app/widgets/art_sliver_grid.dart';
import 'package:r_d_practice/art_app/widgets/art_sliver_list.dart';
import 'package:r_d_practice/art_app/widgets/custom_drawer.dart';

class ArtHomeScreen extends StatefulWidget {
  const ArtHomeScreen({super.key});

  static const Color backgroundColor = Color.fromARGB(255, 74, 58, 51);
  static const String appBarPicLink =
      'https://static.vecteezy.com/system/resources/previews/003/510/739/original/single-one-line-drawing-classic-museum-construction-building-with-pillar-at-front-art-gallery-structure-isolated-doodle-minimal-concept-trendy-continuous-line-draw-design-graphic-illustration-vector.jpg';

  @override
  State<ArtHomeScreen> createState() => _ArtHomeScreenState();
}

class _ArtHomeScreenState extends State<ArtHomeScreen> {
  final controller = ArtController();

  void getGalleryId(int ind) {
    setState(() {
      controller.selectedGalleryId = ind;
      controller.getArtList(ind);
      controller.gaLLeryName(ind);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ArtHomeScreen.backgroundColor,
      drawer: CustomDrawer(
        getGalleryId: getGalleryId,
        controller: controller,
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                ArtHomeScreen.appBarPicLink,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SliverLayoutBuilder(
            builder: (context, constraints) {
              if (constraints.crossAxisExtent > 600) {
                return ArtSliverGrid(controller: controller);
              } else {
                return ArtSliverList(controller: controller);
              }
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAdaptiveDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog.adaptive(
                  title: const Text('You are'),
                  content: Text(controller.galleryName),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Close'),
                    ),
                  ]);
            },
          );
        },
        child: const Icon(Icons.info),
      ),
    );
  }
}
