import 'package:flutter/material.dart';

class TaskFormPage extends StatefulWidget {
  @override
  _TaskFormPageState createState() => _TaskFormPageState();
}

class _TaskFormPageState extends State<TaskFormPage> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  DateTime? startDate;
  DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Créer une Tâche'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Titre
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Titre',
                        prefixIcon: Icon(Icons.title, color: Colors.teal),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal, width: 2.0),
                        ),
                      ),
                      onSaved: (value) => title = value ?? '',
                      validator: (value) =>
                          value!.isEmpty ? 'Veuillez entrer un titre' : null,
                    ),
                    SizedBox(height: 16.0),

                    // Description
                    TextFormField(
                      maxLines: 3,
                      decoration: InputDecoration(
                        labelText: 'Description',
                        prefixIcon: Icon(Icons.description, color: Colors.teal),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal, width: 2.0),
                        ),
                      ),
                      onSaved: (value) => description = value ?? '',
                    ),
                    SizedBox(height: 16.0),

                    // Date de début
                    ElevatedButton.icon(
                      onPressed: () async {
                        startDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        setState(() {});
                      },
                      icon: Icon(Icons.calendar_today),
                      label: Text(
                        startDate == null
                            ? 'Sélectionner la date de début'
                            : 'Date de début : ${startDate!.toLocal()}'.split(' ')[0],
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),

                    // Date de fin
                    ElevatedButton.icon(
                      onPressed: () async {
                        endDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        setState(() {});
                      },
                      icon: Icon(Icons.calendar_today),
                      label: Text(
                        endDate == null
                            ? 'Sélectionner la date de fin'
                            : 'Date de fin : ${endDate!.toLocal()}'.split(' ')[0],
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.0),

                    // Bouton Enregistrer
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            Navigator.pop(context, {
                              'title': title,
                              'description': description,
                              'startDate': startDate,
                              'endDate': endDate,
                            });
                          }
                        },
                        child: Text('Enregistrer'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: 32.0, vertical: 12.0),
                          textStyle: TextStyle(fontSize: 18.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
