import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FAQ Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
      home: const FaqScreen(),
    );
  }
}

class FaqItem {
  FaqItem({required this.question, required this.answer}) : isExpanded = false;

  final String question;
  final String answer;
  bool isExpanded;
}

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  // The list
  final List<FaqItem> _faqs = [
    FaqItem(
      question: 'How do I reset my password?',
      answer:
          'Go to Settings → Account → Reset Password. You will receive an email with a reset link within 2 minutes.',
    ),
    FaqItem(
      question: 'How do I cancel my subscription?',
      answer:
          'Navigate to Settings → Billing → Cancel Plan. Your access continues until the end of the billing period.',
    ),
    FaqItem(
      question: 'Is my data stored automatically?',
      answer:
          'Yes! We back up your data every 24 hours. You can also trigger it manually from Settings → Storage.',
    ),
    FaqItem(
      question: 'How do I contact support?',
      answer:
          'Use the in-app chat (bottom right icon) or email munyananakai@gmail.com. Response time is under 4 hours.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Help & FAQ'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Frequently Asked Questions',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  _faqs[index].isExpanded = isExpanded;
                });
              },

              elevation: 4,
              //expansion panels
              expandedHeaderPadding: const EdgeInsets.symmetric(vertical: 4),
              children: _faqs.map<ExpansionPanel>((FaqItem item) {
                return ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(title: Text(item.question));
                  },
                  body: ListTile(title: Text(item.answer)),
                  isExpanded: item.isExpanded,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
