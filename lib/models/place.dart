import 'package:places/models/user.dart';

class Place {
  final String description;
  final String image;
  final String postedByUserId;
  final String title;
  User user;

  Place(
      {this.description,
      this.image,
      this.postedByUserId,
      this.title,
      this.user});
}
