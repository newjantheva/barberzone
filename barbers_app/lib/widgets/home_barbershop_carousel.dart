import 'package:flutter/material.dart';

class HomeBarbershopCarousel extends StatefulWidget {
  const HomeBarbershopCarousel({super.key});

  @override
  _HomeBarbershopCarouselState createState() => _HomeBarbershopCarouselState();
}

class _HomeBarbershopCarouselState extends State<HomeBarbershopCarousel> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(width: 10),
      shrinkWrap: true,
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      itemCount: 10, // Set the number of items in your carousel
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () => Navigator.pushNamed(context, '/employees'),
          child: Stack(
            fit: StackFit.loose,
            children: [
              Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                  border: Border.all(
                    color: Colors.white60,
                    style: BorderStyle.solid,
                    width: 2,
                  ),
                ),
                child: Image.asset(
                  "assets/images/image.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 60, // Adjust the bottom position as needed
                left: 25, // Adjust the right position as needed
                child: Padding(
                  padding:
                      const EdgeInsets.all(8.0), // Adjust padding as needed
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Chop-Chop $index',
                        style: const TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Østergårds Allé $index',
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
