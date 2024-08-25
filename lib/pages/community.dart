import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CommunityPage extends StatefulWidget {
  @override
  CommunityPageState createState() => CommunityPageState();
}

class CommunityPageState extends State<CommunityPage> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse("http://35.198.193.253/"))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            _setDarkMode();
          },
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            )),backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.8),
      ),
      body: WebViewWidget(controller: controller),
    );
  }

  void _setDarkMode() {
    if (MediaQuery.of(context).platformBrightness == Brightness.dark) {
      controller.runJavaScript(
        '''
        var style = document.createElement('style');
        style.innerHTML = `
        body {
          filter: invert(1) hue-rotate(180deg);
          background-color: #121212;
        }

        img{
            filter: invert(1) hue-rotate(180deg);
        }

        video, iframe {
          filter: invert(1) hue-rotate(180deg);
        }

        [class*="-backdrop"] {
          filter: invert(1) hue-rotate(180deg);
        }

        `;
        document.head.appendChild(style);

        ''',
      );
    } else {
      controller.runJavaScript(
        '''
        var style = document.head.querySelector('style');
        if (style) {
          document.head.removeChild(style);
        }
        ''',
      );
    }
  }
}
