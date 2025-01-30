import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BEMA HNG'),
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
  final Uri hng = Uri.parse('https://hng.tech/hire/mobile-ui-ux-developers');
  final Uri gitHub = Uri.parse('https://github.com/bema-fabiyi/bema-hng.git');

  Future<void> openGit() async {
    try {
      await launchUrl(gitHub);
    } catch (e) {
      print('git link error: $e');
    }
  }

  Future<void> openHng() async {
    try {
      await launchUrl(hng);
    } catch (e) {
      print('hng link error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                openHng();
              },
              child: Text('Open HNG link'),
            ),
            ElevatedButton(
              onPressed: () {
                openGit();
              },
              child: Text('Open GitHub link'),
            ),
          ],
        ),
      ),
    );
  }
}
