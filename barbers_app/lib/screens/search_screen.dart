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

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                focusNode: _focusNode,
                onTap: () {
                  setState(() {
                    isActive = true;
                  });
                },
                style: const TextStyle(color: Colors.white),
                cursorColor: const Color.fromARGB(255, 255, 98, 7),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 25),
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
    );
  }
}
