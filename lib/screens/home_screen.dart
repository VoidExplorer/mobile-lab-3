import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobile_lab_3/screens/barbary_profile.dart';
import 'package:mobile_lab_3/screens/fares_profile.dart';
import 'package:mobile_lab_3/screens/youssef_profile.dart';
import 'package:mobile_lab_3/totals_provider.dart';

const String mangoImageUrl = 'https://images.unsplash.com/photo-1553279768-865429fa0078?w=300&auto=format&fit=crop&q=80';
const String coconutImageUrl = 'https://images.unsplash.com/photo-1546548970-71785318a17b?w=300&auto=format&fit=crop&q=80';
const String appleImageUrl = 'https://images.unsplash.com/photo-1560806887-1e4cd0b6cbd6?w=300&auto=format&fit=crop&q=80';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});
  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final totalsProvider = context.watch<TotalsProvider>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Total Followers: ${totalsProvider.total_followers}"),
                    Text("Total posts: ${totalsProvider.total_posts}"),
                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const FaresProfile()),
                          ),
                          child: Hero(
                            tag: 'avatar-fares',
                            child: const CircleAvatar(
                              radius: 24,
                              backgroundImage: NetworkImage(mangoImageUrl),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const FaresProfile()),
                            );
                          },
                          child: const Text("Fares's Profile"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const YoussefProfile()),
                          ),
                          child: Hero(
                            tag: 'avatar-youssef',
                            child: const CircleAvatar(
                              radius: 24,
                              backgroundImage: NetworkImage(coconutImageUrl),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const YoussefProfile()),
                            );
                          },
                          child: const Text("Youssef's Profile"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const BarbaryProfile()),
                          ),
                          child: Hero(
                            tag: 'avatar-barbary',
                            child: const CircleAvatar(
                              radius: 24,
                              backgroundImage: NetworkImage(appleImageUrl),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const BarbaryProfile()),
                            );
                          },
                          child: const Text("Barbary's Profile"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    const Text('You have pushed the + button this many times:'),
                    Text(
                      '$_counter',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
