import 'package:dating_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // const ProfileHeader(),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'About Me',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Digital artist and coffee enthusiast. Love hiking on weekends and exploring new music. Looking for someone to share adventures with!',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Interests',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _buildInterestChip('Art'),
                      _buildInterestChip('Travel'),
                      _buildInterestChip('Music'),
                      _buildInterestChip('Coffee'),
                      _buildInterestChip('Hiking'),
                      _buildInterestChip('Photography'),
                    ],
                  ),
                  const SizedBox(height: 24),
                  _buildProfileButton(
                    icon: Icons.edit,
                    text: 'Edit Profile',
                    onPressed: () {},
                  ),
                  _buildProfileButton(
                    icon: Icons.photo_library,
                    text: 'Add Media',
                    onPressed: () {},
                  ),
                  _buildProfileButton(
                    icon: Icons.payment,
                    text: 'Subscription',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInterestChip(String text) {
    return Chip(
      label: Text(text),
      backgroundColor: AppColors.primary.withOpacity(0.1),
      labelStyle: TextStyle(color: AppColors.primary),
      shape: StadiumBorder(
        side: BorderSide(color: AppColors.primary.withOpacity(0.3)),
      ),
    );
  }

  Widget _buildProfileButton({
    required IconData icon,
    required String text,
    required VoidCallback onPressed,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary),
      title: Text(text),
      trailing: const Icon(Icons.chevron_right),
      onTap: onPressed,
    );
  }
}
