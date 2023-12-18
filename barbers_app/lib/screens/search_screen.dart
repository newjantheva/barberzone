import 'package:barbers_app/models/barber_model.dart';
import 'package:barbers_app/repo/barber_repository.dart';
import 'package:barbers_app/service/barber_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isActive = false;
  final FocusNode _focusNode = FocusNode();
  final IBarberRepository _repository = BarberRepository(BarberService());
  final TextEditingController _searchController = TextEditingController();
  List<Barber> barbers = [];
  List<Barber> filteredBarbers = [];

  @override
  void initState() {
    super.initState();
    barbers = _repository.fetchBarbers();
  }

  void _filterBarbers(String query) {
    debugPrint(query);
    List<Barber> results = [];
    if (query.isNotEmpty) {
      results = barbers
          .where((barber) =>
              barber.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    setState(() {
      filteredBarbers = results;
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.centerRight,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    focusNode: _focusNode,
                    controller: _searchController,
                    onChanged: _filterBarbers,
                    onTap: () {
                      setState(() {
                        isActive = true;
                      });
                    },
                    style: const TextStyle(color: Colors.white),
                    cursorColor: const Color.fromARGB(255, 255, 98, 7),
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 25),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 255, 98, 7)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 255, 98, 7)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            if (isActive)
              Positioned(
                right: 10,
                child: InkWell(
                  onTap: () {
                    _focusNode.unfocus();
                    SystemChannels.textInput.invokeMethod('TextInput.hide');
                    setState(() {
                      isActive = false;
                      _searchController.clear();
                      _filterBarbers('');
                    });
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredBarbers.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  filteredBarbers[index].name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
                subtitle: Text(
                  filteredBarbers[index].description,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
