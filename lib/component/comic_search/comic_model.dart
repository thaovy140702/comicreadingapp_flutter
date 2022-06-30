class ComicSearch {
  final int id;
  final String comic_name;
  final String comic_image;
  final String author;

  const ComicSearch({
    required this.id,
    required this.comic_name,
    required this.comic_image,
    required this.author,
  });

  factory ComicSearch.fromJson(Map<String, dynamic> json) => ComicSearch(
    id: json['id'],
    comic_name: json['comic_name'],
    comic_image: json['comic_image'],
    author: json['author'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'comic_name': comic_name,
    'comic_image': comic_image,
    'author': author,
  };
}
