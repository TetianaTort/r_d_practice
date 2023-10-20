enum Period {
  postImpressionism('Post-Impressionism'),
  romanticism('Romanticism'),
  renaissance('Renissance'),
  baroque('Baroque'),
  dutchGoldenAge('Dutch Golden Age'),
  impressionism('Impressionism'),
  symbolism('Symbolism');

  final String name;
  const Period(this.name);
}

class Gallery {
  final int galleryId;
  final String name;
  final String address;
  final String imageUrl;

  Gallery({
    required this.galleryId,
    required this.name,
    required this.address,
    required this.imageUrl,
  });
}

class ArtItem {
  final String name;
  final String description;
  final int galleryId;
  final String period;
  final String created;
  final String imgUrl;

  ArtItem({
    required this.name,
    required this.description,
    required this.galleryId,
    required this.period,
    required this.created,
    required this.imgUrl,
  });
}
