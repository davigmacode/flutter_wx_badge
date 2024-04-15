[![Pub Version](https://img.shields.io/pub/v/wx_badge)](https://pub.dev/packages/wx_badge) ![GitHub](https://img.shields.io/github/license/davigmacode/flutter_wx_badge) [![GitHub](https://badgen.net/badge/icon/buymeacoffee?icon=buymeacoffee&color=yellow&label)](https://www.buymeacoffee.com/davigmacode) [![GitHub](https://badgen.net/badge/icon/ko-fi?icon=kofi&color=red&label)](https://ko-fi.com/davigmacode)

Customizable badge widget to show notifications, shopping cart items, and more with ease.

[![Preview](https://github.com/davigmacode/flutter_wx_badge/raw/main/media/preview.gif)](https://davigmacode.github.io/flutter_wx_badge)

[Demo](https://davigmacode.github.io/flutter_wx_badge)

## Usage

To read more about classes and other references used by `wx_badge`, see the [API Reference](https://pub.dev/documentation/wx_badge/latest/).

```dart
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
)

WxBadge(
  animated: true,
  position: WxBadgePosition.bottomRight,
  offset: const Offset(1, 1),
  style: WxBadgeStyle.circle(
    radius: 5,
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
    borderOffset: 3,
    borderStyle: BorderStyle.solid,
    borderColor: Colors.blue,
    backgroundColor: Colors.red,
    child: Text('Wx'),
  ),
)
```

## Sponsoring

<a href="https://www.buymeacoffee.com/davigmacode" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" height="45"></a>
<a href="https://ko-fi.com/davigmacode" target="_blank"><img src="https://storage.ko-fi.com/cdn/brandasset/kofi_s_tag_white.png" alt="Ko-Fi" height="45"></a>

If this package or any other package I created is helping you, please consider to sponsor me so that I can take time to read the issues, fix bugs, merge pull requests and add features to these packages.