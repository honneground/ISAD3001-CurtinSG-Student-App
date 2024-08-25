import 'package:flutter/material.dart';
import 'package:cssa/pages/class_timetable.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';


void launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  await launchUrl(
    uri
  );

}

class PDFViewPage extends StatelessWidget {
  final String pdfUrl;
  final String title;

  PDFViewPage({required this.pdfUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.6),
      ),
      body: SfPdfViewer.network(pdfUrl),
    );
  }
}

class AcademicPage extends StatefulWidget {
  @override
  AcademicPageState createState() => AcademicPageState();
}

class AcademicPageState extends State<AcademicPage> {
  final double cardFontSize = 12.0;
  final double groupTitleFontSize = 18.0;
  final double iconSize = 40.0;
  final int crossAxisCount = 3;

  final List<Map<String, dynamic>> axitArray = [
    {'name': 'Timetable', 'url': 'https://learning.curtin.edu.sg/apps/timetable', 'icon': Icons.table_chart},
    {'name': 'Moodle', 'url': 'https://moodle.curtin.edu.sg/my/', 'icon': Icons.format_align_center},
    {'name': 'Enrolment', 'url': 'https://learning.curtin.edu.sg/apps/self-registration/course-period', 'icon': Icons.class_},
    {'name': 'Attendance', 'url': 'https://sas.curtin.edu.sg/', 'icon': Icons.event_seat},
  ];

  final List<Map<String, dynamic>> oasisArray = [
    {'name': 'Blackboard', 'url': 'https://oasis.curtin.edu.au/', 'icon': Icons.school},
    {'name': 'Academic Calendar', 'url': 'https://students.curtin.edu.sg/wp-content/uploads/sites/27/2024/05/Academic-Calendar-Trimester-2A-2024.pdf', 'icon': Icons.calendar_month},
    {'name': 'Class Timetables', 'url': '', 'icon': Icons.view_comfortable},
    {'name': 'Exam Timetable', 'url': 'https://students.curtin.edu.sg/wp-content/uploads/sites/27/2024/05/Academic-Calendar-Trimester-2A-2024.pdf', 'icon': Icons.edit_calendar},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Academic',
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
                  'Axis',
                  style: TextStyle(
                    fontSize: groupTitleFontSize,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            _buildGrid(axitArray),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.only(left: 6.0),
                child: Text(
                  'Oasis',
                  style: TextStyle(
                    fontSize: groupTitleFontSize,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            _buildGrid(oasisArray),
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
                    builder: (context) => ClassTimetableaPage(),
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
                if (item['url'].endsWith('.pdf')) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PDFViewPage(pdfUrl: item['url'], title: item['name'])
                    ),
                  );
                } else {
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
          }
        },
      ),
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
