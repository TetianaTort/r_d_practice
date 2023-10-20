import 'package:r_d_practice/art_app/models/models.dart';

List<ArtItem> artsListData = [
  ArtItem(
    name: 'Mona Lisa',
    description:
        'The Mona Lisa is a half-length portrait painting by Italian artist Leonardo da Vinci.',
    galleryId: 1,
    period: Period.renaissance.name,
    created: '1503',
    imgUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg/1200px-Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg',
  ),
  ArtItem(
    name: 'Liberty Leading the People',
    description:
        'Liberty Leading the People is a painting by Eugène Delacroix commemorating the July Revolution of 1830, which toppled King Charles X.',
    galleryId: 1,
    period: Period.romanticism.name,
    created: '1830',
    imgUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5d/Eugène_Delacroix_-_Le_28_Juillet._La_Liberté_guidant_le_peuple.jpg/1200px-Eugène_Delacroix_-_Le_28_Juillet._La_Liberté_guidant_le_peuple.jpg',
  ),
  ArtItem(
    name: 'Death of the Virgin',
    description:
        'Death of the Virgin is a painting by the Italian Baroque master Caravaggio depicting the death of the Virgin Mary.',
    galleryId: 1,
    period: Period.baroque.name,
    created: '1604–1606',
    imgUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/78/Death_of_the_Virgin-Caravaggio_%281606%29.jpg/1200px-Death_of_the_Virgin-Caravaggio_%281606%29.jpg',
  ),
  ArtItem(
      name: 'The Lacemaker',
      description: 'The Lacemaker is a painting by the Dutch artist Johannes Vermeer.',
      galleryId: 1,
      period: Period.dutchGoldenAge.name,
      created: '1669–1670',
      imgUrl:
          'https://upload.wikimedia.org/wikipedia/commons/0/03/Johannes_Vermeer_-_The_lacemaker_%28c.1669-1671%29.jpg'),
  ArtItem(
    name: 'The Kiss',
    description:
        'The Kiss is an oil-on-canvas painting with added gold leaf, silver and platinum by the Austrian Symbolist painter Gustav Klimt.',
    galleryId: 2,
    period: Period.symbolism.name,
    created: '1907–1908',
    imgUrl:
        'http://lh3.googleusercontent.com/7aJyS2Nd7c8oCJKmfXlmM-rnSnLMY0ykfBFOP8N3OjV6M4hbhS_NEg8tH6SJDfvl=w298-h300-n-l64',
  ),
  ArtItem(
    name: 'Pathway in Monet\'s Garden at Giverny',
    description:
        'A Pathway in Monet\'s Garden depicts rows of bright flowers surrounding a path leading to Claude Monet\'s house.',
    galleryId: 2,
    period: Period.impressionism.name,
    created: '1902',
    imgUrl:
        'http://lh3.googleusercontent.com/cBSHc9LTHRkZvI6OQ2zvj4gm4tr37H-QSEIAS2YeDcxjzSHiZ3gAbi1mKtjVk-S1Qb8=w306-h300-n-l64',
  ),
  ArtItem(
    name: 'Cutting the Stone',
    description:
        'Cutting the Stone, also called The Extraction of the Stone of Madness or The Cure of Folly, is a painting by Hieronymus Bosch',
    galleryId: 3,
    period: Period.renaissance.name,
    created: '1494',
    imgUrl: 'https://upload.wikimedia.org/wikipedia/commons/b/b1/Cutting_the_Stone_%28Bosch%29.jpg',
  ),
  ArtItem(
    name: 'The Garden of Earthly Delights',
    description:
        'The Garden of Earthly Delights is the modern title given to a triptych oil painting on oak panel painted by the Early Netherlandish master Hieronymus Bosch',
    galleryId: 3,
    period: Period.renaissance.name,
    created: '1503–1515',
    imgUrl: 'https://upload.wikimedia.org/wikipedia/commons/3/38/Jheronimus_Bosch_023.jpg',
  ),
  ArtItem(
    name: 'Las Meninas',
    description:
        'Las Meninas is a 1656 painting in the Museo del Prado in Madrid, by Diego Velázquez, the leading artist of the Spanish Baroque.',
    galleryId: 3,
    period: Period.baroque.name,
    created: '1656',
    imgUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Las_Meninas%2C_by_Diego_Velázquez%2C_from_Prado_in_Google_Earth.jpg/1200px-Las_Meninas%2C_by_Diego_Velázquez%2C_from_Prado_in_Google_Earth.jpg',
  ),
  ArtItem(
    name: 'The Night Watch',
    description:
        'Militia Company of District II under the Command of Captain Frans Banninck Cocq, also known as The Shooting Company of Frans Banning Cocq and Willem van Ruytenburch, but commonly referred to as The Night Watch, is a 1642 painting by Rembrandt van Rijn.',
    galleryId: 4,
    period: Period.baroque.name,
    created: '1642',
    imgUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5a/The_Night_Watch_-_HD.jpg/1200px-The_Night_Watch_-_HD.jpg',
  ),
  ArtItem(
    name: 'The Milkmaid',
    description:
        'The Milkmaid, sometimes called The Kitchen Maid, is an oil-on-canvas painting of a "milkmaid", in fact, a domestic kitchen maid, by the Dutch artist Johannes Vermeer.',
    galleryId: 4,
    period: Period.baroque.name,
    created: '1657–1658',
    imgUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/Johannes_Vermeer_-_Het_melkmeisje_-_Google_Art_Project.png/1200px-Johannes_Vermeer_-_Het_melkmeisje_-_Google_Art_Project.png',
  ),
  ArtItem(
    name: 'Self-Portrait with Dishevelled Hair',
    description:
        'Self-Portrait with Dishevelled Hair, also known as Self-Portrait as a Young Man and by various other titles, is an early self-portrait by the Dutch artist Rembrandt.',
    galleryId: 4,
    period: Period.baroque.name,
    created: '1628',
    imgUrl:
        'https://upload.wikimedia.org/wikipedia/commons/e/e8/Rembrandt_Harmensz._van_Rijn_-_Zelfportret_op_jeugdige_leeftijd_-_Google_Art_Project.jpg',
  ),
  ArtItem(
    name: 'Self-Portrait with Grey Felt Hat.',
    description:
        '"Self-Portrait with Grey Felt Hat" is a work painted by Vincent Van Gogh in 1887, during his Parisian period.',
    galleryId: 4,
    period: Period.postImpressionism.name,
    created: '1887',
    imgUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Van_Gogh_Self-Portrait_with_Grey_Felt_Hat_1886-87_Rijksmuseum.jpg/952px-Van_Gogh_Self-Portrait_with_Grey_Felt_Hat_1886-87_Rijksmuseum.jpg',
  ),
];

List<Gallery> galleryListData = [
  Gallery(
    galleryId: 1,
    name: 'Louvre Museum',
    address: 'Museum address',
    imageUrl:
        'https://api-www.louvre.fr/sites/default/files/2021-01/cour-napoleon-et-pyramide_1.jpg',
  ),
  Gallery(
    galleryId: 2,
    name: 'Belvedere Palace',
    address: 'Museum address',
    imageUrl:
        'https://t0.gstatic.com/licensed-image?q=tbn:ANd9GcSK6shta1bEbzLmS3jQkE3-e7GlfrffI-jpsZK3wOHxDNGFmX-oI9KUaY5UwBFuYEzt',
  ),
  Gallery(
    galleryId: 3,
    name: 'Museo Nacional del Prado',
    address: 'Museum address',
    imageUrl:
        'https://lh3.googleusercontent.com/p/AF1QipN6GUICd-pgKnWB_jzrtHMuEs7QxK_BcRI2NsQo=s1360-w1360-h1020',
  ),
  Gallery(
    galleryId: 4,
    name: 'Rijksmuseum',
    address: 'Museum address',
    imageUrl:
        'https://lh3.googleusercontent.com/p/AF1QipPEtxCvsxVn7zW01vooJK9G4NhMwPeG5pwZk6Id=s1360-w1360-h1020',
  ),
];
