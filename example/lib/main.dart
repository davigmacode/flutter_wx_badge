import 'package:flutter/material.dart';
import 'package:wx_badge/wx_badge.dart';
import 'package:wx_avatar/wx_avatar.dart';
import 'package:wx_anchor/wx_anchor.dart';
import 'package:wx_text/wx_text.dart';
import 'package:animated_switcher_transitions/animated_switcher_transitions.dart';

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
  bool online = false;

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

  void toggleOnline() {
    setState(() {
      online = !online;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 40),
              const WxText.displayMedium('WxBadge'),
              const SizedBox(height: 40),
              Wrapper(
                title: 'Label',
                child: Wrap(
                  spacing: 35,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    WxBadge(
                      position: WxBadgePosition.bottomRight,
                      offset: const Offset(16, 8),
                      style: WxBadgeStyle(
                        borderWidth: 2,
                        borderStyle: BorderStyle.solid,
                        borderColor: Theme.of(context).colorScheme.surface,
                        backgroundColor: Colors.amber,
                        foregroundStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 2,
                        ),
                      ),
                      content: const Text(
                        'NEW',
                        style: TextStyle(height: 1.2),
                      ),
                      child: const PhysicalModel(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: Icon(
                            Icons.music_note_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    WxBadge(
                      position: WxBadgePosition.bottomRight,
                      offset: const Offset(3, 1),
                      style: WxBadgeStyle(
                        width: 20,
                        height: 20,
                        border: const StarBorder(
                          points: 8,
                          pointRounding: .8,
                          innerRadiusRatio: .7,
                        ),
                        borderWidth: 3,
                        borderStyle: BorderStyle.solid,
                        borderColor: Theme.of(context).colorScheme.surface,
                        backgroundColor: Colors.blue,
                      ),
                      content: const Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                      child: const WxAvatar.circle(
                        radius: 30,
                        image: NetworkImage('https://i.pravatar.cc/100?u=6'),
                        elevation: 3.0,
                        backgroundColor: Colors.red,
                        child: Text('Wx'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Wrapper(
                title: 'Counter',
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
                      style: WxBadgeStyle.circle(
                        borderWidth: 2,
                        borderStyle: BorderStyle.solid,
                        borderColor: Theme.of(context).colorScheme.surface,
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.all(6),
                      ),
                      content: Text(
                        count.toString(),
                        key: ValueKey(count),
                        style: const TextStyle(height: 1.15),
                      ),
                      transition: AnimatedSwitcherTransitions.zoomOut,
                      child: const WxAvatar(
                        image: NetworkImage('https://i.pravatar.cc/50?u=2'),
                        elevation: 3.0,
                        backgroundColor: Colors.red,
                        child: Text('Wx'),
                      ),
                    ),
                    WxBadge(
                      hidden: count == 0,
                      position: WxBadgePosition.topRight,
                      offset: count < 10
                          ? Offset.fromDirection(-.8, 10)
                          : Offset.fromDirection(-.5, 14),
                      style: const WxBadgeStyle.stadium(
                        elevation: 2,
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 2,
                        ),
                      ),
                      transition: AnimatedSwitcherTransitions.slide(
                        115,
                        scaleFactor: .9,
                      ),
                      content: Text(
                        count.toString(),
                        key: ValueKey(count),
                        style: const TextStyle(height: 1.15),
                      ),
                      child: const Icon(Icons.shopping_cart),
                    ),
                    WxAnchor.circle(
                      radius: 20,
                      onTap: increment,
                      child: const Icon(Icons.add_circle_outline),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Wrapper(
                title: 'Status',
                child: Wrap(
                  spacing: 25,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    WxBadge(
                      animated: true,
                      position: WxBadgePosition.bottomRight,
                      offset: const Offset(3, 1),
                      style: WxBadgeStyle(
                        width: 12,
                        height: 12,
                        border: online
                            ? const StarBorder(
                                points: 6,
                                innerRadiusRatio: .7,
                              )
                            : const CircleBorder(),
                        borderWidth: 2,
                        borderStyle: BorderStyle.solid,
                        borderColor: Theme.of(context).colorScheme.surface,
                        backgroundColor: online ? Colors.green : Colors.red,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 2,
                        ),
                      ),
                      child: const WxAvatar.circle(
                        image: NetworkImage('https://i.pravatar.cc/50?u=20'),
                        borderWidth: 2,
                        borderAlign: 3,
                        borderStyle: BorderStyle.solid,
                        borderColor: Colors.blue,
                        backgroundColor: Colors.red,
                        child: Text('Wx'),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: toggleOnline,
                      child: const Text('Toggle Status'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class Wrapper extends StatelessWidget {
  const Wrapper({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: WxText.labelLarge(title),
        ),
        SizedBox(
          width: 300,
          height: 100,
          child: Card.outlined(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(child: child),
            ),
          ),
        ),
      ],
    );
  }
}
