import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri)) {
    throw 'Could not launch $url';
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final double cardFontSize = 16.0;
  final double groupTitleFontSize = 18.0;
  final double iconSize = 50.0;
  final int crossAxisCount = 2;

  final List<Map<String, dynamic>> homeArray = [
    {
      'name': 'Events',
      'url':
          'https://students.curtin.edu.sg/curtin-experience/campus-events-and-activities/',
      'icon': Icons.event_available
    },
    {
      'name': 'Research Pulse',
      'url': 'https://curtin.edu.sg/research/research-pulse/',
      'icon': Icons.newspaper
    },
    {
      'name': 'Announcements',
      'url': 'https://curtin.edu.sg/curtin-college-announcements',
      'icon': Icons.announcement 
    },
    {
      'name': 'Student Stories',
      'url': 'https://www.curtin.edu.au/archives/stories/',
      'icon': Icons.emoji_events
    },
    {
      'name': 'Policy',
      'url': 'https://curtin.edu.sg/curtin-university/policy-governance/',
      'icon': Icons.policy_outlined
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.8),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            // Add the image here
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Image.network(
                'https://lh3.googleusercontent.com/p/AF1QipOvZ6H8CzarXCxVQsAoTCYrJdMWUeguBdGsVzqa=s1360-w1360-h1020', // Replace this with your image URL or asset
                height: 180.0, // Set your desired height
                fit: BoxFit.cover, // Adjust the image to cover the space
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.only(left: 6.0),
                child: Text(
                  'News',
                  style: TextStyle(
                    fontSize: groupTitleFontSize,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            _buildGrid(homeArray),
          ],
        ),
      ),
    );
  }

  Widget _buildGrid(List<Map<String, dynamic>> array) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 1.0,
          ),
          itemCount: array.length,
          itemBuilder: (context, index) {
            final item = array[index];
            final String cardName = item['name'].replaceAll(" ", "\n");

            return GestureDetector(
              onTap: () {
                if (item['name'] == 'Events') {
                  final controller = WebViewController()
                    ..setJavaScriptMode(JavaScriptMode.unrestricted)
                    ..loadRequest(Uri.parse(item['url']!));

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WebViewPage(
                        controller: controller,
                        title: item['name'],
                      ),
                    ),
                  );
                } else {
                  launchURL(item['url']);
                }
              },
              child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      item['icon'],
                      size: iconSize,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      cardName,
                      style: TextStyle(
                        fontSize: cardFontSize,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class WebViewPage extends StatelessWidget {
  final WebViewController controller;
  final String title;

  WebViewPage({required this.controller, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.6),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
