import 'package:r_d_practice/art_app/data/art_data.dart';
import 'package:r_d_practice/art_app/models/models.dart';

class ArtController {
  int selectedGalleryId = 0;
  List<ArtItem> artList = artsListData;
  List<Gallery> galleryList = galleryListData;
  String galleryName = 'looking art from all museams';

  List<ArtItem> getArtList(galeryId) {
    artList = artsListData;
    artList = galeryId == 0
        ? artList
        : artList.where((artItem) => artItem.galleryId == galeryId).toList();
    return artList;
  }

  String gaLLeryName(galeryId) {
    galleryName = 'looking art from all museams';
    galleryName = galeryId == 0
        ? galleryName
        : ('in ${galleryList.firstWhere((gallery) => gallery.galleryId == galeryId).name}');
    return galleryName;
  }
}
