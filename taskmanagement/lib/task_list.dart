import 'package:flutter/material.dart';

class TaskListPage extends StatelessWidget {
  final List<Map<String, String>> tasks = [
    {'title': 'Tâche 1', 'description': 'Description de la tâche 1'},
    {'title': 'Tâche 2', 'description': 'Description de la tâche 2'},
    {'title': 'Tâche 3', 'description': 'Description de la tâche 3'},
    {'title': 'Tâche 4', 'description': 'Description de la tâche 4'},
    {'title': 'Tâche 5', 'description': 'Description de la tâche 5'},
    {'title': 'Tâche 6', 'description': 'Description de la tâche 6'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Liste des Tâches',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
        elevation: 4.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 2.0,
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(12.0),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/taskDetails',
                    arguments: tasks[index],
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.teal.shade100,
                        child: Icon(Icons.task, color: Colors.teal),
                      ),
                      const SizedBox(width: 12.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tasks[index]['title']!,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal.shade700,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              tasks[index]['description']!,
                              style: TextStyle(fontSize: 14.0, color: Colors.grey.shade700),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios, size: 16.0, color: Colors.grey.shade400),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/taskForm'),
        backgroundColor: Colors.teal,
        child: Icon(Icons.add, color: Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: BorderSide(color: Colors.teal.shade200, width: 2.0),
        ),
      ),
    );
  }
}
