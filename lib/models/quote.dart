class Quote {
  final String text;
  final String author;
  final String imagePath;
  List<String> categories;

  Quote(
      {required this.text,
      required this.author,
      required this.imagePath,
      required this.categories});
}
