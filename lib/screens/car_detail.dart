import 'package:flutter/material.dart';
import 'package:aldo_garage/models/car_entry.dart'; 
import 'package:aldo_garage/screens/list_carentry.dart';

class CarDetailPage extends StatelessWidget {
  final CarEntry car;

  const CarDetailPage(this.car, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const CarEntryPage()),
          ),
        ),
        title: const Text("Car Detail"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Name: ${car.fields.name}",  // Updated to match the form's variable
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Price: ${car.fields.price}",  // Updated to show price
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 18.0,
                ),
              ),
              Text(
                "Quantity: ${car.fields.carHorsepower}",  // Updated to show quantity
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 18.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "Description: ${car.fields.description}",  // Updated to show description
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 18.0,
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