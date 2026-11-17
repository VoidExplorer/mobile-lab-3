import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobile_lab_3/totals_provider.dart';
import 'package:mobile_lab_3/widgets/like_button.dart';

class BarbaryProfile extends StatelessWidget {
  const BarbaryProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final totals = context.watch<TotalsProvider>();

    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(12),
        color: theme.colorScheme.secondaryContainer,
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Return to Home"),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 190,
            pinned: true,
            backgroundColor: theme.colorScheme.secondaryContainer,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text("Barbary's Profile"),
              centerTitle: true,
              background: Center(
                child: Hero(
                  tag: 'avatar-barbary',
                  child: const CircleAvatar(
                    radius: 46,
                    backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1560806887-1e4cd0b6cbd6?w=300&auto=format&fit=crop&q=80',
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Posts\n${totals.barbary_posts}", textAlign: TextAlign.center),
                        Text("Followers\n${totals.barbary_followers}", textAlign: TextAlign.center),
                        Text("Following\n${totals.barbary_following}", textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context.read<TotalsProvider>().increment_barbary_followers();
                        },
                        child: const Text("+ Follow"),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () {
                          context.read<TotalsProvider>().increment_barbary_posts();
                        },
                        child: const Text("+ Create Post"),
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
