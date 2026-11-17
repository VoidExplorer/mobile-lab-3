import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobile_lab_3/totals_provider.dart';
import 'package:mobile_lab_3/widgets/like_button.dart';

class FaresProfile extends StatelessWidget {
  const FaresProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final totals = context.watch<TotalsProvider>();

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: theme.colorScheme.inversePrimary,
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Return"),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 180,
            pinned: true,
            backgroundColor: theme.colorScheme.inversePrimary,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text("Fares's Profile"),
              background: Center(
                child: Hero(
                  tag: 'avatar-fares',
                  child: const CircleAvatar(
                    radius: 44,
                    backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1553279768-865429fa0078?w=300&auto=format&fit=crop&q=80',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Posts: ${totals.fares_posts}"),
                      Text("Followers: ${totals.fares_followers}"),
                      Text("Following: ${totals.fares_following}"),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context.read<TotalsProvider>().increment_fares_followers();
                        },
                        child: const Text("Follow"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.read<TotalsProvider>().increment_fares_posts();
                        },
                        child: const Text("Post"),
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
