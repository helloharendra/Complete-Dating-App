class User {
  final String id;
  final String name;
  final int age;
  final String photoUrl;
  final String bio;
  final double distance;
  final List<String> interests;

  User({
    required this.id,
    required this.name,
    required this.age,
    required this.photoUrl,
    required this.bio,
    required this.distance,
    required this.interests,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      photoUrl: json['photoUrl'],
      bio: json['bio'],
      distance: json['distance'].toDouble(),
      interests: List<String>.from(json['interests']),
    );
  }
}
