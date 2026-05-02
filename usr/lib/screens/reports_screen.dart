import 'package:flutter/material.dart';

class MedicalReport {
  final String id;
  final String title;
  final String date;
  final String doctorName;
  final String type;

  MedicalReport({
    required this.id,
    required this.title,
    required this.date,
    required this.doctorName,
    required this.type,
  });
}

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  final List<MedicalReport> _reports = [
    MedicalReport(
      id: 'r1',
      title: 'Blood Test Results',
      date: 'May 01, 2026',
      doctorName: 'Dr. Sarah Jenkins',
      type: 'Lab Result',
    ),
    MedicalReport(
      id: 'r2',
      title: 'MRI Scan - Brain',
      date: 'April 15, 2026',
      doctorName: 'Dr. Michael Chen',
      type: 'Imaging',
    ),
    MedicalReport(
      id: 'r3',
      title: 'General Prescription',
      date: 'March 20, 2026',
      doctorName: 'Dr. Emily Watson',
      type: 'Prescription',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('My Reports'),
        automaticallyImplyLeading: false,
      ),
      body: _reports.isEmpty
          ? const Center(child: Text('No reports available.'))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _reports.length,
              itemBuilder: (context, index) {
                final report = _reports[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        report.type == 'Lab Result'
                            ? Icons.science
                            : report.type == 'Imaging'
                                ? Icons.image
                                : Icons.receipt_long,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    title: Text(
                      report.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Text('Date: ${report.date}'),
                        Text('Doctor: ${report.doctorName}'),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            report.type,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[800],
                            ),
                          ),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.download),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Downloading ${report.title}...')),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
