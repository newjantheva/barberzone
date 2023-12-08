import 'package:flutter/material.dart';

class EmployeesScreen extends StatefulWidget {
  const EmployeesScreen({super.key});

  @override
  State<EmployeesScreen> createState() => _EmployeesScreenState();
}

class _EmployeesScreenState extends State<EmployeesScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200),
        child: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.grey.withOpacity(0.1),
          flexibleSpace: const Padding(
            padding: EdgeInsets.only(top: 50.0, left: 15, bottom: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text(
                        "Vælg din favorit frisør",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: SizedBox(
        height: double.infinity,
        child: ListView.builder(
          shrinkWrap: true,
          controller: _scrollController,
          itemCount: 10, // Set the number of items in your carousel
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () => Navigator.pushNamed(context, '/booking'),
              child: Container(
                color: Colors.black,
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Item $index',
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      ColorFiltered(
                        colorFilter: const ColorFilter.mode(
                          Colors.grey, // Set the color to grayscale
                          BlendMode.saturation,
                        ),
                        child: Image.asset("assets/images/image.jpg"),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
