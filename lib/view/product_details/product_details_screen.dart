import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop/model/product.dart';
import 'package:shop/view/product_details/components/product_carousel_slider.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product productt;
  const ProductDetailsScreen({super.key, required this.productt});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  NumberFormat formatter=NumberFormat('00');
  int _qty = 1;
  int _tagIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductCarouselSlider(
              images: widget.productt.image,
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                widget.productt.name,
                style: TextStyle(
                  fontSize: 24,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                '\₹${widget.productt.tags.first.price.toStringAsFixed(2)}',
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w400
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(8))
                    ),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: ( ) {
                            if(_tagIndex>0){
                              setState(() {
                                _tagIndex--;
                              });
                            }
                          },
                          child: Icon(
                            Icons.keyboard_arrow_left_sharp,
                            size: 32,
                            color: Colors.grey.shade800,
                          ),
                        ),
                        Text(
                          widget.productt.tags[_tagIndex].title,
                        style:TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade800
                        ) ,
                        ),
                        InkWell(
                          onTap: ( ) {
                            if(_tagIndex != (widget.productt.tags.length-1))
                            {
                              setState(() {
                                _tagIndex++;
                              });
                            }
                          },
                          child: Icon(
                            Icons.keyboard_arrow_right_sharp,
                            size: 32,
                            color: Colors.grey.shade800,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(8))
                    ),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: ( ) {
                            if(_qty>1){
                              setState(() {
                                _qty--;
                              });
                            }
                          },
                          child: Icon(
                            Icons.keyboard_arrow_left_sharp,
                            size: 32,
                            color: Colors.grey.shade800,
                          ),
                        ),
                        Text(
                          formatter.format(_qty),
                          style:TextStyle(
                              fontSize: 18,
                              color: Colors.grey.shade800
                          ) ,
                        ),
                        InkWell(
                          onTap: ( ) {
                            setState(() {
                              _qty++;
                            });
                          },
                          child: Icon(
                            Icons.keyboard_arrow_right_sharp,
                            size: 32,
                            color: Colors.grey.shade800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'About this Product:',
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w500
                ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                widget.productt.description,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade700,
                    //fontWeight: FontWeight.w500
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(
              Theme.of(context).primaryColor

            ),
          ),
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.all(6.0),
            child:  Text(
              'Add to Cart',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
