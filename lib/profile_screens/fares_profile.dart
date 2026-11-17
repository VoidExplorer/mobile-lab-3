import 'package:flutter/material.dart';

class FaresProfile extends StatefulWidget {
  const FaresProfile({super.key});

  @override
  State<StatefulWidget> createState() => _FaresProfile();
}

class _FaresProfile extends State<FaresProfile> {
  int _posts = 0;
  int _followers = 0;
  int _following = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.inversePrimary,
        title: Text("Fares's Profile"),
      ),
      bottomNavigationBar: BottomAppBar(
        color: theme.colorScheme.inversePrimary,
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Return"),
        ),
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(20),
        child: Column(
          // mainAxisAlignment: .spaceBetween,
          crossAxisAlignment: .center,
          spacing: 20,
          children: [
            CircleAvatar(radius: 44, child: const Icon(Icons.person, size: 48)),
            SizedBox.fromSize(),
            Row(
              mainAxisAlignment: .spaceAround,
              children: [
                Text("Posts: ${_posts}"),
                Text("Followers: ${_followers}"),
                Text("Following: ${_following}"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
