import 'package:barbers_app/repositories/barber_repository.dart';
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
      // final barberRepository =
      //     Provider.of<BarberRepository>(context, listen: false);
      // barberRepository.createBarber(
      //     _nameController.text, _descriptionController.text);
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
      appBar: AppBar(
        title: const Text(
          'Create Barber',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                hintText: 'Name',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                hintText: 'Description',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _createBarber,
              child: const Text(
                'Create Barber',
                style: TextStyle(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
