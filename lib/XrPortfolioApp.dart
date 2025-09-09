import 'package:flutter/material.dart';

void main() {
  runApp(const XRPortfolioApp());
}

class XRPortfolioApp extends StatelessWidget {
  const XRPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XR Portfolio',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.cyanAccent,
      ),
      home: const XRPortfolioPage(),
    );
  }
}

class XRPortfolioPage extends StatelessWidget {
  const XRPortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile with cyan border
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.cyanAccent,
                    width: 4,
                  ),
                ),
                child: const CircleAvatar(
                  radius: 140,
                  backgroundImage: AssetImage('assets/Profile1.jpg'),
                ),
              ),
              const SizedBox(height: 16),

              // Centered Titles
              const Text(
                'XR Developer\nFlutter Developer\nFull Stack Game Developer',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.cyanAccent,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'President - Multimedia Club, NIST University',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),

              // Achievements
              const AchievementCard(
                title: 'Shuruka Boxing',
                subtitle: 'Launched on Steam - PC Console Boxing Game',
                icon: Icons.sports_mma,
              ),
              const AchievementCard(
                title: 'FICCI BAF Award in XR',
                subtitle: 'Winner in XR Category',
                icon: Icons.emoji_events,
              ),
              const AchievementCard(
                title: 'Hackathon Champion',
                subtitle: 'Won 5+ hackathons',
                icon: Icons.code,
              ),
              const AchievementCard(
                title: 'Workshop Organizer',
                subtitle: 'Led a 2-day XR Workshop',
                icon: Icons.event,
              ),
              const AchievementCard(
                title: 'Unity, AR/VR Projects',
                subtitle: 'Proficient in Unity, Blender & ML',
                icon: Icons.vrpano,
              ),
              const AchievementCard(
                title: 'Flutter Projects',
                subtitle: 'Proficient in Frontend Flutter Development',
                icon: Icons.smartphone,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AchievementCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const AchievementCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.cyanAccent.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.cyanAccent, size: 40),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
