import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../constants.dart';

class Barber {
  final String name;
  final String description;

  Barber({required this.name, required this.description});
}

class ProductService {
  final String name;
  final String description;

  ProductService({required this.name, required this.description});
}

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({super.key});

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  bool isBarberGridTileTapped = false;

  @override
  Widget build(BuildContext context) {
    List<Color> colorList = [
      Colors.green,
      Colors.red,
    ];

    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            title: const Text(
              'Barbers',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            expandedHeight: 275,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        'Velkommen til Barberzone, find en barbershop nær dig.',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 33,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey),
                    height: 310,
                    child: Column(
                      children: [
                        Container(
                          height: 150,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 150,
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            title: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 45,
                                      width: 45,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Item ${index + 1}',
                                            style:
                                                const TextStyle(fontSize: 18),
                                          ),
                                          Text(
                                            'Sub Item ${index + 1}',
                                            style:
                                                const TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                SizedBox(
                                  height: 50,
                                  width: 350,
                                  child: ElevatedButton(
                                    style: const ButtonStyle(
                                      shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                      ),
                                      overlayColor: MaterialStatePropertyAll(
                                          Colors.white),
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.white),
                                      elevation: MaterialStatePropertyAll(0),
                                    ),
                                    onPressed: () => _showModal(context),
                                    child: const Text(
                                      'Book',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            tileColor: Colors.black12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              childCount: 50,
            ),
          )
        ],
      ),
    );
  }

  Future<dynamic> _showModal(BuildContext context) {
    return showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return BottomSheet(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onClosing: () => null,
          builder: (context) {
            return Container(
              height: MediaQuery.of(context).size.height - 150,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: BottomSheetPageViewer(),
            );
          },
        );
      },
    );
  }
}

class BottomSheetPageViewer extends StatefulWidget {
  BottomSheetPageViewer({super.key});

  @override
  State<BottomSheetPageViewer> createState() => _BottomSheetPageViewerState();
}

class _BottomSheetPageViewerState extends State<BottomSheetPageViewer> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      children: <Widget>[
        // Page 1
        BarberListContent(
          text: 'Page 1',
          nextPage: () {
            _pageController.nextPage(
                duration: Duration(milliseconds: 300), curve: Curves.ease);
          },
        ),

        // Page 2
        ProductServiceListContent(
          text: 'Page 2',
          previousPage: () {
            _pageController.previousPage(
                duration: Duration(milliseconds: 300), curve: Curves.ease);
          },
          nextPage: () {
            _pageController.nextPage(
                duration: Duration(milliseconds: 300), curve: Curves.ease);
          },
        ),

        // Page 3
        BookingDateTimeContent(
          text: 'Page 3',
          previousPage: () {
            _pageController.previousPage(
                duration: Duration(milliseconds: 300), curve: Curves.ease);
          },
        ),
      ],
    );
  }
}

class BarberListContent extends StatefulWidget {
  final String text;
  final VoidCallback? previousPage;
  final VoidCallback? nextPage;

  BarberListContent({
    required this.text,
    this.previousPage,
    this.nextPage,
  });

  @override
  State<BarberListContent> createState() => _BarberListContentState();
}

class _BarberListContentState extends State<BarberListContent> {
  static List<Barber> barbers = [
    Barber(name: "John Doe", description: "description"),
    Barber(name: "John Doe", description: "description"),
    Barber(name: "John Doe", description: "description"),
    Barber(name: "John Doe", description: "description"),
    Barber(name: "John Doe", description: "description"),
    Barber(name: "John Doe", description: "description"),
    Barber(name: "John Doe", description: "description"),
    Barber(name: "John Doe", description: "description"),
  ];

  @override
  Widget build(BuildContext context) {
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
                  itemCount: barbers.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    var item = barbers[index];
                    if (widget.nextPage != null) {
                      return GestureDetector(
                        onTap: widget.nextPage,
                        child: GridTile(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: Colors.grey,
                                    width: 0.5,
                                    style: BorderStyle.solid),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
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
  }
}

class ProductServiceListContent extends StatefulWidget {
  final String text;
  final VoidCallback? previousPage;
  final VoidCallback? nextPage;

  const ProductServiceListContent({
    super.key,
    required this.text,
    this.previousPage,
    this.nextPage,
  });

  @override
  State<ProductServiceListContent> createState() =>
      _ProductServiceListContentState();
}

class _ProductServiceListContentState extends State<ProductServiceListContent> {
  static List<ProductService> productServices = [
    ProductService(
      name: "Men's clipper cut - 30 min",
      description: "description",
    ),
    ProductService(
      name: "Signature cut - 30 min",
      description: "description",
    ),
    ProductService(
      name: "Hot shave - 30 min",
      description: "description",
    ),
    ProductService(
      name: "Shape up - 15 min",
      description: "description",
    ),
    ProductService(
      name: "Kids cut - 30 min",
      description: "description",
    ),
    ProductService(
      name: "Beard trim - 30 min",
      description: "description",
    ),
  ];
  @override
  Widget build(BuildContext context) {
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
                child: ListView.builder(
                  itemCount: productServices.length,
                  itemBuilder: (context, index) {
                    var service = productServices[index];
                    if (widget.nextPage != null) {
                      return ExpansionTile(
                        title: Text(service.name),
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 4,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: const [
                                        Flexible(
                                          child: Text(
                                            'Service: ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            "Men's Clipper Cut - 30 min",
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: const [
                                        Flexible(
                                          child: Text(
                                            'Description: ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            "A popular grooming service for men offered by barbershops and salons.",
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            'Duration: ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            "Typically takes 30 minutes to complete.",
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            'Technique: ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            "Involves using clippers to trim and shape the hair to the desired length and style.",
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            'Clipper Guards: ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            "Different clipper guards may be used to achieve the preferred hair length.",
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            'Finishing Touches: ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            "May include edging around the hairline and neckline for a polished look.",
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            'Efficiency: ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            "A quick and efficient option for a clean and well-maintained haircut.",
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            'Styling: ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            " Ideal for those who prefer a neat and tidy haircut without intricate styling.",
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                      // return GestureDetector(
                      //   onTap: widget.nextPage,
                      //   child: Column(
                      //     children: [
                      //       ListTile(
                      //         title: Padding(
                      //           padding: const EdgeInsets.only(left: 8.0),
                      //           child: Row(
                      //             mainAxisAlignment: MainAxisAlignment.start,
                      //             children: [
                      //               Text(
                      //                 item.name,
                      //                 style: const TextStyle(
                      //                     fontSize: 18,
                      //                     fontWeight: FontWeight.bold),
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //         subtitle: Row(
                      //           mainAxisAlignment: MainAxisAlignment.start,
                      //           children: [
                      //             TextButton(
                      //               onPressed: () {},
                      //               child: const Text(
                      //                 'Service details',
                      //                 style: TextStyle(
                      //                   fontSize: 18,
                      //                 ),
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //       Divider(),
                      //     ],
                      //   ),
                      // );
                    }
                    return null;
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BookingDateTimeContent extends StatelessWidget {
  final String text;
  final VoidCallback? previousPage;
  final VoidCallback? nextPage;

  const BookingDateTimeContent({
    super.key,
    required this.text,
    this.previousPage,
    this.nextPage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (previousPage != null)
          ElevatedButton(
            onPressed: previousPage,
            child: Text('Previous Page'),
          ),
        if (nextPage != null)
          ElevatedButton(
            onPressed: nextPage,
            child: Text('Next Page'),
          ),
      ],
    );
  }
}
