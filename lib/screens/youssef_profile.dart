import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobile_lab_3/totals_provider.dart';
import 'package:mobile_lab_3/widgets/like_button.dart';

class YoussefProfile extends StatelessWidget {
  const YoussefProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final totals = context.watch<TotalsProvider>();

    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(12),
        color: theme.colorScheme.primaryContainer,
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Back Home"),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            backgroundColor: theme.colorScheme.primaryContainer,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text("Youssef's Profile"),
              background: Center(
                child: Hero(
                  tag: 'avatar-youssef',
                  child: const CircleAvatar(
                    radius: 48,
                    backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1546548970-71785318a17b?w=300&auto=format&fit=crop&q=80',
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              const Text("Posts", style: TextStyle(fontWeight: FontWeight.bold)),
                              Text("${totals.youssef_posts}"),
                            ],
                          ),
                          Column(
                            children: [
                              const Text("Followers", style: TextStyle(fontWeight: FontWeight.bold)),
                              Text("${totals.youssef_followers}"),
                            ],
                          ),
                          Column(
                            children: [
                              const Text("Following", style: TextStyle(fontWeight: FontWeight.bold)),
                              Text("${totals.youssef_following}"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton.icon(
                        onPressed: () {
                          context.read<TotalsProvider>().increment_youssef_followers();
                        },
                        icon: const Icon(Icons.person_add),
                        label: const Text("Follow"),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          context.read<TotalsProvider>().increment_youssef_posts();
                        },
                        icon: const Icon(Icons.add_a_photo),
                        label: const Text("New Post"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const LikeButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
