import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmailPage extends StatefulWidget {
  @override
  EmailPageState createState() => EmailPageState();
}

class EmailPageState extends State<EmailPage> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Book Study Room',
          style: TextStyle(
            fontWeight: FontWeight.normal,
          ),
        ),
        backgroundColor: colorScheme.primary.withOpacity(0.6),
      ),
      body: Container(
        decoration: BoxDecoration(

          gradient: LinearGradient(
            colors: [
              colorScheme.primary.withOpacity(0.1),
              colorScheme.primary.withOpacity(0.3),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Icon(
                Icons.meeting_room_outlined,
                size: 100,
                color: colorScheme.primary,
              ),
              SizedBox(height: 20),

              Text(
                'To book a study room, please send an email to the library with your request. Click the button below to draft an email.',
                style: TextStyle(
                  fontSize: 18,
                  color: colorScheme.onSurface, 
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40), 

              ElevatedButton.icon(
                icon: Icon(Icons.email_outlined, size: 24), 
                label: Text(
                  'Send Email',
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  backgroundColor: colorScheme.primary.withOpacity(0.8), 
                  foregroundColor: colorScheme.onPrimary, 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), 
                  ),
                ),
                onPressed: () async {
                  String? encodeQueryParameters(Map<String, String> params) {
                    return params.entries
                        .map((MapEntry<String, String> e) =>
                            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                        .join('&');
                  }

                  final Uri emailUri = Uri(
                    scheme: 'mailto',
                    path: 'library@curtin.edu.sg',
                    query: encodeQueryParameters(<String, String>{
                      'subject': 'Study Room Booking Request',
                      'body': 'Dear Library,\n\n'
                          'I would like to request a study room booking at the following time:\n\n'
                          'Date: [Insert Date]\n'
                          'Time: [Insert Time]\n'
                          'Room: [Insert Room Preference, if any]\n\n'
                          'Thank you.\n\n'
                          'Sincerely,\n[Your Name]\n[Your Student ID]'
                    }),
                  );

                  if (await canLaunchUrl(emailUri)) {
                    launchUrl(emailUri);
                  } else {
                    throw Exception('Could not launch $emailUri');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}