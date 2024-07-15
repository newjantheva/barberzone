import 'package:barbers_app/models/product_service_model.dart';
import 'package:flutter/material.dart';

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
                            child: const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
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
                                      children: [
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
