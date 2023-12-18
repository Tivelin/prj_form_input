// ignore_for_file: unused_element

import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  String result = "";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? nama;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        result = "Nama : $nama";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Form Input'),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Nama",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Nama Tidak Boleh Kosong";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  nama = newValue;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: _submitForm, 
                child: const Text('Submit'),
              ),
              Text(
                result,
                style: const TextStyle(
                  fontSize: 18,
                ),
              )
            ],
          ),
        ));
  }
}
