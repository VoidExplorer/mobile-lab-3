import 'package:flutter/material.dart';
import 'package:mobile_lab_3/profile_screens/fares_profile.dart';
import 'package:mobile_lab_3/totals_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => TotalsProvider(),
      child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;


  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final totals_provider = context.watch<TotalsProvider>();

    final _total_followers = totals_provider.total_followers;
    final _total_posts = totals_provider.total_posts;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text("Total Followers: $_total_followers"),
            Text("Total posts: $_total_posts"),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => const FaresProfile()));
            },
                child: Text("Fares's Profile")),

            // ElevatedButton(
            //     onPressed: (){
            //       Navigator.push(context,
            //           MaterialPageRoute(builder: (context) => const YoussefProfile()));
            //     },
            //     child: Text("Youssef's Profile")),

            // ElevatedButton(
            //     onPressed: (){
            //       Navigator.push(context,
            //           MaterialPageRoute(builder: (context) => const BarbaryProfile()));
            //     },
            //     child: Text("Barbary's Profile")),

            Text('You have pushed the + button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
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
