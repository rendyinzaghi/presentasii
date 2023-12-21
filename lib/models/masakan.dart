class Masakan {
  final String name;
  final String origin;
  final String description;
  final String imageAsset;
  final List<String> imageUrls;
  bool isFavorite;

  Masakan({
    required this.name,
    required this.origin,
    required this.description,
    required this.imageAsset,
    required this.imageUrls,
    this.isFavorite = true,
  });

}

