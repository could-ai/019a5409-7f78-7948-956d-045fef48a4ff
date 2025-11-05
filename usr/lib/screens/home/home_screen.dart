import 'package:flutter/material.dart';
import '../campaigns/campaigns_screen.dart';
import '../analytics/analytics_screen.dart';
import '../profile/profile_screen.dart';
import 'widgets/dashboard_card.dart';
import 'widgets/quick_action_card.dart';
import 'widgets/stats_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const DashboardView(),
    const CampaignsScreen(),
    const AnalyticsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          NavigationDestination(
            icon: Icon(Icons.campaign_outlined),
            selectedIcon: Icon(Icons.campaign),
            label: 'Campaigns',
          ),
          NavigationDestination(
            icon: Icon(Icons.analytics_outlined),
            selectedIcon: Icon(Icons.analytics),
            label: 'Analytics',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outlined),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Marketing Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Notifications coming soon')),
              );
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Card
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome Back! 👋',
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Lets grow your business with AI-powered marketing',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.auto_awesome,
                        size: 48,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Stats Overview
              Text(
                'Overview',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              const Row(
                children: [
                  Expanded(
                    child: StatsCard(
                      title: 'Active Campaigns',
                      value: '12',
                      icon: Icons.campaign,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: StatsCard(
                      title: 'Total Reach',
                      value: '45.2K',
                      icon: Icons.people,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Row(
                children: [
                  Expanded(
                    child: StatsCard(
                      title: 'Engagement',
                      value: '8.4%',
                      icon: Icons.trending_up,
                      color: Colors.orange,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: StatsCard(
                      title: 'ROI',
                      value: '245%',
                      icon: Icons.attach_money,
                      color: Colors.purple,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Quick Actions
              Text(
                'AI Marketing Tools',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.1,
                children: [
                  QuickActionCard(
                    title: 'Content Generator',
                    subtitle: 'AI-powered content',
                    icon: Icons.create,
                    gradient: const LinearGradient(
                      colors: [Color(0xFF667eea), Color(0xFF764ba2)],
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/content-generator');
                    },
                  ),
                  QuickActionCard(
                    title: 'Social Media',
                    subtitle: 'Manage all platforms',
                    icon: Icons.share,
                    gradient: const LinearGradient(
                      colors: [Color(0xFFf093fb), Color(0xFFF5576C)],
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/social-media');
                    },
                  ),
                  QuickActionCard(
                    title: 'SEO Tools',
                    subtitle: 'Optimize rankings',
                    icon: Icons.search,
                    gradient: const LinearGradient(
                      colors: [Color(0xFF4facfe), Color(0xFF00f2fe)],
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/seo-tools');
                    },
                  ),
                  QuickActionCard(
                    title: 'Email Marketing',
                    subtitle: 'Smart campaigns',
                    icon: Icons.email,
                    gradient: const LinearGradient(
                      colors: [Color(0xFF43e97b), Color(0xFF38f9d7)],
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/email-marketing');
                    },
                  ),
                  QuickActionCard(
                    title: 'Ads Manager',
                    subtitle: 'Optimize ad spend',
                    icon: Icons.ads_click,
                    gradient: const LinearGradient(
                      colors: [Color(0xFFfa709a), Color(0xFFfee140)],
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/ads-manager');
                    },
                  ),
                  QuickActionCard(
                    title: 'Analytics',
                    subtitle: 'Deep insights',
                    icon: Icons.insights,
                    gradient: const LinearGradient(
                      colors: [Color(0xFF30cfd0), Color(0xFF330867)],
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/analytics');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
