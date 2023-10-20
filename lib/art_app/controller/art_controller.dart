import 'package:r_d_practice/art_app/data/art_data.dart';
import 'package:r_d_practice/art_app/models/models.dart';

class ArtController {
  int selectedGalleryId = 0;
  List<ArtItem> artList = artsListData;
  List<Gallery> galleryList = galleryListData;
  String galleryName = 'looking art from all museams';

  List<ArtItem> getArtList(galeryId) {
    return artList = galeryId == 0
        ? artsListData
        : artsListData.where((artItem) => artItem.galleryId == galeryId).toList();
  }

  String gaLLeryName(galleryId) {
    return galleryName = galleryId == 0
        ? galleryName
        : ('in ${galleryList.firstWhere((gallery) => gallery.galleryId == galleryId).name}');
  }
}
