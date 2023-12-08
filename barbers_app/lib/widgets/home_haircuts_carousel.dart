import 'package:flutter/material.dart';

class HomeHaircutsCarousel extends StatefulWidget {
  const HomeHaircutsCarousel({super.key});

  @override
  _HomeHaircutsCarouselState createState() => _HomeHaircutsCarouselState();
}

class _HomeHaircutsCarouselState extends State<HomeHaircutsCarousel> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(width: 10),
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      itemCount: 10, // Set the number of items in your carousel
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            debugPrint("tap");
          },
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              border: Border.all(
                color: Colors.white60,
                style: BorderStyle.solid,
                width: 2,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.room_service,
                  color: Colors.white,
                ),
                Text('Item $index',
                    style: const TextStyle(color: Colors.white)),
              ],
            ),
          ),
        );
      },
    );
  }
}
