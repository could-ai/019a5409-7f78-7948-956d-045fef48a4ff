import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/signup_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/campaigns/campaigns_screen.dart';
import 'screens/content/content_generator_screen.dart';
import 'screens/analytics/analytics_screen.dart';
import 'screens/social/social_media_screen.dart';
import 'screens/seo/seo_tools_screen.dart';
import 'screens/email/email_marketing_screen.dart';
import 'screens/ads/ads_manager_screen.dart';
import 'screens/profile/profile_screen.dart';

void main() {
  runApp(const AIDigitalMarketingApp());
}

class AIDigitalMarketingApp extends StatelessWidget {
  const AIDigitalMarketingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Digital Marketing',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6366F1),
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
        ),
        cardTheme: CardTheme(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6366F1),
          brightness: Brightness.dark,
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
        ),
        cardTheme: CardTheme(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/home': (context) => const HomeScreen(),
        '/campaigns': (context) => const CampaignsScreen(),
        '/content-generator': (context) => const ContentGeneratorScreen(),
        '/analytics': (context) => const AnalyticsScreen(),
        '/social-media': (context) => const SocialMediaScreen(),
        '/seo-tools': (context) => const SEOToolsScreen(),
        '/email-marketing': (context) => const EmailMarketingScreen(),
        '/ads-manager': (context) => const AdsManagerScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}
