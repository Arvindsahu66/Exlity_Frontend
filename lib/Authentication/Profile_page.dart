import 'package:flutter/material.dart';
import 'auth_service.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth  = AuthService();
    final phone = auth.currentUserPhone() ?? 'Unknown';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async => auth.signOut(),
          ),
        ],
      ),
      body: Center(
        child: Text('You are logged in as\n$phone',
            textAlign: TextAlign.center),
      ),
    );
  }
}
