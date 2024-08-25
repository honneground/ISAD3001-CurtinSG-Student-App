import 'package:flutter/material.dart';
import 'package:cssa/pages/email_lib.dart';
import 'package:url_launcher/url_launcher.dart';

void launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri)) {
    throw 'Could not launch $url';
  }
}

class CampusPage extends StatefulWidget {
  @override
  CampusPageState createState() => CampusPageState();
}

class CampusPageState extends State<CampusPage> {

  final double cardFontSize = 12.0;
  final double groupTitleFontSize = 18.0;
  final double iconSize = 40.0;
  final int crossAxisCount = 3;

  final List<Map<String, dynamic>> campusArray = [
    {
      'name': 'Library',
      'url': 'https://www.curtin.edu.au/library/',
      'icon': Icons.local_library
    },
    {
      'name': 'IT Support',
      'url': 'https://www.curtin.edu.au/students/essentials/it/',
      'icon': Icons.desktop_windows_rounded
    },
    {
      'name': 'Mental Health',
      'url': 'https://sas.curtin.edu.sg/',
      'icon': Icons.healing
    },
  ];

  final List<Map<String, dynamic>> anpArray = [
    {
      'name': 'Student Connect',
      'url': 'https://www.singaporeq.com/qreg/ke7af3',
      'icon': Icons.connect_without_contact
    },
    {
      'name': 'Documents Request',
      'url':
          'https://curtinuniversity.wufoo.com/forms/qboiwpx1e3wd9i/',
      'icon': Icons.file_copy
    },
    {
      'name': 'Study Rooms',
      'url': '',
      'icon': Icons.table_bar
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Campus',
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

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.only(left: 6.0),
                child: Text(
                  'Information', 
                  style: TextStyle(
                    fontSize: groupTitleFontSize,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            _buildGrid(campusArray), 

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.only(left: 6.0),
                child: Text(
                  'Request and Appointment', 
                  style: TextStyle(
                    fontSize: groupTitleFontSize,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            _buildGrid(anpArray), 
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
          if (item['url'] == '') {
            return GestureDetector(
              onTap: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EmailPage(), 
                  ),
                );
              },
              child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Container(
                  alignment: Alignment.center,
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
              ),
            );
          } else {
            return GestureDetector(
              onTap: () {
                launchURL(item['url']);
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
          }
        },
      ),
    );
  }
}