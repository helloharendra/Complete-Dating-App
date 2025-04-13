import 'dart:math';

import 'package:dating_app/data/models/users/user_model.dart';

class MatchService {
  static final Random _random = Random();
  static final List<String> _mockPhotos = [
    'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=300&h=400', // Woman 1
    'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=300&h=400', // Woman 2
    'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=300&h=400', // Man 1
    'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=300&h=400', // Man 2
    'https://images.unsplash.com/photo-1554151228-14d9def656e4?w=300&h=400', // Woman 3
  ];

  static final List<String> _names = [
    'Emma', 'Olivia', 'Ava', 'Sophia', 'Isabella', // Female names
    'Liam', 'Noah', 'Oliver', 'Elijah', 'William' // Male names
  ];

  static final List<String> _bios = [
    'Artist | Dog lover | Coffee enthusiast',
    'Software Engineer | Hiker | Foodie',
    'Medical Student | Yoga | Bookworm',
    'Chef | Traveler | Photographer',
    'Teacher | Musician | Nature lover',
    'Entrepreneur | Reader | Fitness enthusiast',
    'Digital Nomad | Surfing | Photography',
    'Doctor | Marathon Runner | Wine Connoisseur'
  ];

  static final List<String> _interests = [
    'Art',
    'Travel',
    'Music',
    'Tech',
    'Nature',
    'Cooking',
    'Medicine',
    'Fitness',
    'Reading',
    'Photography',
    'Sports',
    'Dancing',
    'Movies',
    'Gaming',
    'Writing',
    'Languages'
  ];

  Future<List<User>> getDiscoverableUsers() async {
    try {
      // Simulate network delay
      await Future.delayed(const Duration(seconds: 1));

      // Generate 10 random users
      return List.generate(10, (index) => _generateRandomUser());
    } catch (e) {
      // Fallback to basic mock data if error occurs
      return _getFallbackUsers();
    }
  }

  User _generateRandomUser() {
    final gender = _random.nextBool() ? 'female' : 'male';
    final name = _names[
        gender == 'female' ? _random.nextInt(5) : 5 + _random.nextInt(5)];

    return User(
      id: _random.nextInt(10000).toString(),
      name: name,
      age: 18 + _random.nextInt(15), // 18-32 years old
      photoUrl: _mockPhotos[_random.nextInt(_mockPhotos.length)],
      bio: _bios[_random.nextInt(_bios.length)],
      distance: 0.5 + _random.nextDouble() * 9.5, // 0.5-10 miles
      interests: _generateRandomInterests(),
    );
  }

  List<String> _generateRandomInterests() {
    final count = 2 + _random.nextInt(3); // 2-4 interests
    final interests = <String>{};

    while (interests.length < count) {
      interests.add(_interests[_random.nextInt(_interests.length)]);
    }

    return interests.toList();
  }

  List<User> _getFallbackUsers() {
    return [
      User(
        id: 'fallback1',
        name: 'Alex',
        age: 28,
        photoUrl:
            'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=300&h=400',
        bio: 'Adventure seeker | Coffee addict',
        distance: 3.2,
        interests: ['Hiking', 'Photography', 'Travel'],
      ),
      User(
        id: 'fallback2',
        name: 'Taylor',
        age: 25,
        photoUrl:
            'https://images.unsplash.com/photo-1517841905240-472988babdf9?w=300&h=400',
        bio: 'Artist | Dog mom | Yoga enthusiast',
        distance: 1.5,
        interests: ['Art', 'Yoga', 'Animals'],
      ),
    ];
  }

  Future<void> likeUser(String userId) async {
    try {
      await Future.delayed(const Duration(milliseconds: 300));
      print('Liked user $userId');
      // In real app: await apiClient.post('/likes', {'userId': userId});
    } catch (e) {
      print('Error liking user: $e');
      rethrow;
    }
  }

  Future<void> dislikeUser(String userId) async {
    try {
      await Future.delayed(const Duration(milliseconds: 300));
      print('Disliked user $userId');
      // In real app: await apiClient.post('/dislikes', {'userId': userId});
    } catch (e) {
      print('Error disliking user: $e');
      rethrow;
    }
  }

  Future<void> superLikeUser(String userId) async {
    try {
      await Future.delayed(const Duration(milliseconds: 300));
      print('Super liked user $userId');
      // In real app: await apiClient.post('/superlikes', {'userId': userId});
    } catch (e) {
      print('Error super liking user: $e');
      rethrow;
    }
  }
}
