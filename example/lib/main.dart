import 'package:flutter/material.dart';
import 'package:wx_badge/wx_badge.dart';
import 'package:wx_avatar/wx_avatar.dart';
import 'package:wx_anchor/wx_anchor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WxBadge Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int count = 0;

  void decrement() {
    setState(() {
      if (count > 0) count -= 1;
    });
  }

  void increment() {
    setState(() {
      count += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Wrap(
          spacing: 25,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            WxAnchor.circle(
              radius: 20,
              onTap: decrement,
              child: const Icon(Icons.remove_circle_outline),
            ),
            WxBadge(
              hidden: count == 0,
              position: WxBadgePosition.topRight,
              offset: const Offset(8, -8),
              style: WxBadgeStyle.stadium(
                borderWidth: 2,
                borderStyle: BorderStyle.solid,
                borderColor: Theme.of(context).colorScheme.surface,
                backgroundColor: Colors.red,
              ),
              content: Text(count.toString()),
              transition: WxBadgeTransition.scale,
              child: const WxAvatar(
                image: NetworkImage('https://i.pravatar.cc/50?u=2'),
                elevation: 3.0,
                backgroundColor: Colors.red,
                child: Text('Wx'),
              ),
            ),
            WxAnchor.circle(
              radius: 20,
              onTap: increment,
              child: const Icon(Icons.add_circle_outline),
            ),
          ],
        ),
      ),
    );
  }
}
