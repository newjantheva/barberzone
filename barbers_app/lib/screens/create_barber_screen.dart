import 'package:barbers_app/repo/barber_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateBarberScreen extends StatefulWidget {
  static String route = '/createbarber';

  const CreateBarberScreen({super.key});

  @override
  _CreateBarberScreenState createState() => _CreateBarberScreenState();
}

class _CreateBarberScreenState extends State<CreateBarberScreen> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  void _createBarber() {
    if (_nameController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty) {
      final barberRepository =
          Provider.of<BarberRepository>(context, listen: false);
      barberRepository.createBarber(
          _nameController.text, _descriptionController.text);
      Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Create Barber',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              cursorColor: const Color.fromARGB(255, 255, 98, 7),
              controller: _nameController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: 'Name',
                hintStyle: TextStyle(color: Colors.white),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 255, 98, 7),
                  ),
                ),
              ),
            ),
            TextField(
              cursorColor: const Color.fromARGB(255, 255, 98, 7),
              controller: _descriptionController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: 'Description',
                hintStyle: TextStyle(color: Colors.white),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 255, 98, 7),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _createBarber,
              child: const Text(
                'Create Barber',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
