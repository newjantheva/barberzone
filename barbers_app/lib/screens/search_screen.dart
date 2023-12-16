import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 100,
          width:  isActive ? MediaQuery.of(context).size.width - 100 : MediaQuery.of(context).size.width -20,
          child:  TextField(
            onTap: () {
              setState(() {
                isActive = true;
                debugPrint(isActive.toString());
              });
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
            ),
          ),
        ),
        if(isActive) InkWell(
          onTap: () {
            setState(() {
            isActive = false;
              
            });
          },
          child: const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text('Cancel', style: TextStyle(color: Colors.white),),
          ),
        )
      ],

    );
  }
}
