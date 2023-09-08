import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ActionChip(
            label: const Text('Add Service'),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Center(
                    child: Card(
                        color: Colors.white,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.height / 2,
                        )),
                  );
                },
              );
            },
          )
        ],
      ),
      body: Center(
        child: Container(
          color: Colors.black,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
      ),
    );
  }
}
