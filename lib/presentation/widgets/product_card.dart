import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/data/models/product.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(20, 149, 157, 165),
            blurRadius: 24.0,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 220,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              // height: 200,
              alignment: Alignment.topCenter,
              width: double.infinity,
              imageUrl: widget.product.productUrl,
              placeholder: (context, url) => Container(
                color: Color(0xFFe2e2e2),
                width: double.maxFinite,
                height: double.maxFinite,
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Container(
            padding: EdgeInsets.all(25.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.product.productName,
                      style: GoogleFonts.ubuntu(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF25203E),
                      ),
                    ),
                    Chip(
                      backgroundColor: Color.fromARGB(255, 157, 11, 254),
                      label: Text(
                        widget.product.productRating.toString(),
                        style: GoogleFonts.ubuntu(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      avatar: Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 255, 230, 0),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  widget.product.productDescription,
                  style: GoogleFonts.ubuntu(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    color: Color(0xFF25203E),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
