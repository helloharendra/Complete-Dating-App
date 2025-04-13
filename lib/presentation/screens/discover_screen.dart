import 'package:dating_app/data/providers/discover_provider.dart';
import 'package:dating_app/presentation/features/discover/action_button.dart';
import 'package:dating_app/presentation/features/discover/profile_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DiscoverProvider(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('SparkMatch'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.message_outlined),
              onPressed: () {},
            ),
          ],
        ),
        body: Consumer<DiscoverProvider>(
          builder: (context, provider, _) {
            if (provider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (provider.users.isEmpty) {
              return const Center(child: Text('No more profiles to show'));
            }

            return Column(
              children: [
                Expanded(
                  child: GestureDetector(
                    onHorizontalDragEnd: (details) {
                      if (details.primaryVelocity! > 0) {
                        provider.swipeRight();
                      } else if (details.primaryVelocity! < 0) {
                        provider.swipeLeft();
                      }
                    },
                    child: PageView.builder(
                      controller: provider.pageController,
                      itemCount: provider.users.length,
                      onPageChanged: provider.onPageChanged,
                      itemBuilder: (context, index) {
                        return ProfileCard(user: provider.users[index]);
                      },
                    ),
                  ),
                ),
                ActionButtons(
                  onSwipeLeft: provider.swipeLeft,
                  onSwipeRight: provider.swipeRight,
                  onSuperLike: provider.superLike,
                ),
                const SizedBox(height: 20),
              ],
            );
          },
        ),
      ),
    );
  }
}