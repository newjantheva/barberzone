import 'package:barbers_app/blocs/barber_bloc/barber_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateBarberScreen extends StatefulWidget {
  static String route = '/createbarber';

  const CreateBarberScreen({super.key});

  @override
  _CreateBarberScreenState createState() => _CreateBarberScreenState();
}

class _CreateBarberScreenState extends State<CreateBarberScreen> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _createBarber() {
    BlocProvider.of<BarberBloc>(context).add(CreateBarberEvent(
        name: _nameController.text, description: _descriptionController.text));
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
            BlocBuilder<BarberBloc, BarberState>(
              builder: (context, state) {
                switch (state) {
                  case BarberEmpty():
                    return const Text(
                      "Empty",
                      style: TextStyle(color: Colors.white),
                    );
                  case BarberCreating():
                    return const CircularProgressIndicator();
                  case BarberCreated():
                    {
                      final statebarber = state.barber;
                      if (statebarber == null) {
                        return const Text("Something went wrong",
                            style: TextStyle(color: Colors.white));
                      } else {
                        return const Text("Created",
                            style: TextStyle(color: Colors.white));
                      }
                    }
                  case BarberFailure():
                    return const Text(
                      "Failure",
                      style: TextStyle(color: Colors.white),
                    );
                  default:
                    return Container();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
