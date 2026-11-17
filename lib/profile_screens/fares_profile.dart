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
      body: SafeArea(
        minimum: EdgeInsets.all(20),
        child: Center(
          child: Column(
            // mainAxisAlignment: .center,
            children: [
              const Icon(Icons.person),
              Row(
                mainAxisAlignment: .spaceAround,
                children: [
                  Text("Posts: ${_posts}"),
                  Text("Followers: ${_followers}"),
                  Text("Following: ${_following}"),
                ],
              ),
              ElevatedButton(
                  onPressed: () => Navigator.pop(context)
                  , child: Text("Return")
              )
            ],
          ),
        ),
      ),
    );
    throw UnimplementedError();
  }
}
