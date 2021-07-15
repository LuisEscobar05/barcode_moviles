class User {
  final int index;
  final String title, first, last, picture,email;
  User(
      {required this.index,
      required this.title,
      required this.first,
      required this.last,
      required this.picture,
      required this.email,});

  String fullName() {
    return this.title + " " + this.first + " " + this.last;
  }
}
