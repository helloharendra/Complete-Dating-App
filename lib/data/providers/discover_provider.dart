import 'package:dating_app/core/services/match_service.dart';
import 'package:dating_app/data/models/users/user_model.dart';
import 'package:flutter/material.dart';

class DiscoverProvider with ChangeNotifier {
  final PageController pageController = PageController();
  final MatchService _matchService = MatchService();

  List<User> users = [];
  bool isLoading = true;
  int currentIndex = 0;

  DiscoverProvider() {
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    try {
      users = await _matchService.getDiscoverableUsers();
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();
      rethrow;
    }
  }

  void onPageChanged(int index) {
    currentIndex = index;
    notifyListeners();
  }

  Future<void> swipeLeft() async {
    if (currentIndex < users.length) {
      await _matchService.dislikeUser(users[currentIndex].id);
      _goToNextProfile();
    }
  }

  Future<void> swipeRight() async {
    if (currentIndex < users.length) {
      await _matchService.likeUser(users[currentIndex].id);
      _goToNextProfile();
    }
  }

  Future<void> superLike() async {
    if (currentIndex < users.length) {
      await _matchService.superLikeUser(users[currentIndex].id);
      _goToNextProfile();
    }
  }

  void _goToNextProfile() {
    if (currentIndex < users.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    } else {
      users.removeAt(currentIndex);
      notifyListeners();
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
