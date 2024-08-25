import 'package:flutter/material.dart'; 
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

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

class ClassTimetableaPage extends StatefulWidget {
  @override
  ClassTimetableaPageState createState() => ClassTimetableaPageState();
}

class ClassTimetableaPageState extends State<ClassTimetableaPage> {

  final List<Map<String, dynamic>> timetableArray = [
    {
      'name': 'Bachelor of Communications',
      'url': 'https://students.curtin.edu.sg/wp-content/uploads/sites/27/2024/05/Academic-Calendar-Trimester-2A-2024.pdf',
      'icon': Icons.color_lens
    },
    {
      'name': 'Bachelor of Commerce',
      'url': 'https://students.curtin.edu.sg/wp-content/uploads/sites/27/2024/05/Academic-Calendar-Trimester-2A-2024.pdf',
      'icon': Icons.business
    },
    {
      'name': 'Bachelor of Information Technology',
      'url': 'https://students.curtin.edu.sg/wp-content/uploads/sites/27/2024/05/Academic-Calendar-Trimester-2A-2024.pdf',
      'icon': Icons.terminal
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Academic'),
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.6),
      ),
      body: Column(
        children: [

          SizedBox(height: 20.0), 
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, 
                  crossAxisSpacing: 10.0, 
                  mainAxisSpacing: 10.0, 
                  childAspectRatio: 1.0, 
                ),
                itemCount: timetableArray.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PDFViewPage(
                            pdfUrl: timetableArray[index]['url'],
                            title: timetableArray[index]['name'], 
                          ),
                        ),
                      );
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
                            timetableArray[index]['icon'], 
                            size: 50.0,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            timetableArray[index]['name']!,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}