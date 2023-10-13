import 'package:flutter/material.dart';
import 'package:r_d_practice/art_app/controller/art_controller.dart';

class InformationScreen extends StatelessWidget {
  final ArtController controller;
  const InformationScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Information'),
      ),
      body: ListView.builder(
          itemCount: controller.galleryList.length,
          itemBuilder: (context, ind) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            controller.galleryList[ind].name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.location_on_outlined),
                              Text(controller.galleryList[ind].address),
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Image.network(
                        controller.galleryList[ind].imageUrl,
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
