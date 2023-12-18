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
  String? religion;
  String? education;
  String? gender;
  bool? isChecked = false;
  List<String> religionOptions = [
    'Islam',
    'Kristen',
    'Katolik',
    'Hindu',
    'Buddha',
    'Konghucu'
  ];
  List<String> educationOptions = ['SD', 'SMP', 'SMA', 'S1', 'S2', 'S3'];

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        result =
            "Nama : $nama\nJenis Kelamin : $gender\nAgama : $religion\nPendidikan : $education\nSetuju : $isChecked";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Form Input'),
        ),
        body: SingleChildScrollView(
          child: Form(
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
                Text(
                  result,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Agama',
                  ),
                  value: religion,
                  items: religionOptions.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      religion = newValue;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Pendidikan',
                  ),
                  value: education,
                  items: educationOptions.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      education = newValue;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Jenis Kelamin",
                  style: TextStyle(fontSize: 12),
                ),
                RadioListTile(
                  title: const Text("Laki-Laki"),
                  value: "Laki-Laki",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: const Text("Perempuan"),
                  value: "Perempuan",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value;
                        });
                      },
                    ),
                    const Text('Setuju'),
                  ],
                ),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ));
  }
}
