import 'dart:convert';

import 'package:aldo_garage/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:aldo_garage/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class CarEntryFormPage extends StatefulWidget {
  const CarEntryFormPage({super.key});

  @override
  State<CarEntryFormPage> createState() => _CarEntryFormPageState();
}

class _CarEntryFormPageState extends State<CarEntryFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  String _description = "";
  int _price = 0;
  int _carHorsepower = 0;

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Form Tambah Produk Kamu ke Toko',
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Car",
                    labelText: "Car",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _name = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Produk tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Description",
                    labelText: "Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Descriptions tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Price",
                    labelText: "Price",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _price = int.tryParse(value!) ?? 0;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Field price tidak boleh kosong!";
                    }
                    if (int.tryParse(value) == null) {
                      return "Field price harus berupa angka!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Horsepower",
                    labelText: "Horsepower",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _carHorsepower = int.tryParse(value!) ?? 0;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Field horsepower tidak boleh kosong!";
                    }
                    if (int.tryParse(value) == null) {
                      return "Field horsepower harus berupa angka!";
                    }
                    return null;
                  },
                ),
              ),
               Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.brown.shade400),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // Prepare data to send
                        final response = await request.postJson(
                          "http://127.0.0.1:8000/create-flutter/", // Your API endpoint
                          jsonEncode(<String, String>{
                            'name': _name,
                            'price': _price.toString(),
                            'car_horsepower': _carHorsepower.toString(),
                            'description': _description,
                          }),
                        );
                        if (response['status'] == 'success') {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                            content: Text("Item baru berhasil disimpan!"),
                            ));
                            Navigator.pushReplacement(
                                // ignore: use_build_context_synchronously
                                context,
                                MaterialPageRoute(builder: (context) => MyHomePage()),
                            );
                        } else {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                                content:
                                    Text("Terdapat kesalahan, silakan coba lagi."),
                            ));
                        }
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}