import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api/api_auth.dart';
import '../widgets/dialog_info.dart';
import '../widgets/dialog_loading.dart';
import '../api/api_profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _name = "Loading...";
  String _email = "Loading...";
  String? _profilePictureUrl;

  @override
  void initState() {
    super.initState();
    _fetchUserProfile();
  }

  Future<void> _fetchUserProfile() async {
    try {
      final profileData = await ProfileService.fetchUserProfile();
      if (!mounted) return;

      setState(() {
        _name = profileData?["name"] ?? "Unknown User";
        _email = profileData?["email"] ?? "No email available";
        _profilePictureUrl = profileData?["profile_picture_url"];
      });
    } catch (e) {
      print("Error fetching user profile: $e");
    }
  }

  Future<void> _logout() async {
    DialogInfo(
      headerText: "Log Out?",
      subText: "Are you sure you want to quit?",
      confirmText: "Confirm",
      onCancel: () => Navigator.pop(context),
      onConfirm: () async {
        Navigator.pop(context);
        DialogLoading(subtext: "Logging out...").buildLoadingScreen(context);

        String logoutStatus = await LogoutUser().logOut();
        if (!mounted) return;
        Navigator.pop(context);
        Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
        if (logoutStatus == 'success') {
          final prefs = await SharedPreferences.getInstance();
          await prefs.remove('auth_token');
          await prefs.remove('name');
          await prefs.remove('email');
          await prefs.remove('phone');
        } else {
          DialogInfo(
            headerText: "Error",
            subText: "Logout failed. Please try again.",
            confirmText: "OK",
            onConfirm: () => Navigator.of(context, rootNavigator: true).pop(),
            onCancel: () => Navigator.of(context, rootNavigator: true).pop(),
          ).build(context);
        }
      },
    ).build(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 80,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            CircleAvatar(
              radius: 50,
              backgroundImage: _profilePictureUrl != null && _profilePictureUrl!.isNotEmpty
                  ? NetworkImage(_profilePictureUrl!) as ImageProvider
                  : const AssetImage('assets/icons/profile.png'),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _name,
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          _email,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: _logout,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Sign Out', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                    Icon(Icons.logout, size: 16, color: Colors.red),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
