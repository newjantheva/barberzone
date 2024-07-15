import 'package:barbers_app/blocs/barber_bloc/barber_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BarberListContent extends StatelessWidget {
  final String text;
  final VoidCallback? previousPage;
  final VoidCallback? nextPage;

  const BarberListContent({
    super.key,
    required this.text,
    this.previousPage,
    this.nextPage,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BarberBloc, BarberState>(
      builder: (context, state) {
        switch (state) {
          case BarberSuccess():
            return Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: SizedBox(
                        child: GridView.builder(
                          itemCount: state.barbers.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (context, index) {
                            var item = state.barbers[index];
                            if (nextPage != null) {
                              return GestureDetector(
                                onTap: nextPage,
                                child: GridTile(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            width: 0.5,
                                            style: BorderStyle.solid),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const SizedBox(
                                            height: 45,
                                            width: 45,
                                            child: CircleAvatar(),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            item.name,
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Divider(
                                            indent: 75,
                                            endIndent: 75,
                                            thickness: 2,
                                          ),
                                          TextButton(
                                            onPressed: () {},
                                            child: const Text('About'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          default:
            return Container();
        }
      },
    );
  }
}
