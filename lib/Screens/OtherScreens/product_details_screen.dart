import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_cart/Utils/colors.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int index;
  const ProductDetailsScreen({super.key, required this.index});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int? productSizeIndex;

  List<String> productNameList = [
    'Galaxy Book4 Pro',
    'Samsung S24 Ultra',
    'JBL PartyBox Speaker',
    'Indoor Acer Shoes',
    'Men Colorblock Casual Jacket',
    'Apple Watch Series 9',
    'LG UR7500 108 cm',
    'Drogo Gaming Chair'
  ];

  List<String> productBrandName = [
    'Samsung',
    'Samsung',
    'JBL',
    'Adidas',
    'Killer',
    'Apple',
    'LG',
    'Drogo',
  ];
  List<String> productPriceList = [
    '64999',
    '117899',
    '2599',
    '1800',
    '1259',
    '31699',
    '26500',
    '7189',
  ];
  List<String> productRattingList = [
    '4.5',
    '4.5',
    '3.5',
    '3.5',
    '4.5',
    '4.5',
    '3.5',
    '3.5',
  ];
  List<String?> productOffList = [
    '10',
    '20',
    '16',
    '8',
    null,
    '15',
    '30',
    null,
  ];

  List<String> productImageList = [
    'assets/images/dell_leptop.webp',
    'assets/images/s24_img.webp',
    'assets/images/jbl_speaker.webp',
    'assets/images/adidas_shoes.webp',
    'assets/images/men_jacket.webp',
    'assets/images/apple_watch.webp',
    'assets/images/lg_tv.webp',
    'assets/images/gaming_chair.webp',
  ];

  List<String> productSizeList = ['S', 'M', 'L', 'XL', 'XXL'];

  @override
  Widget build(BuildContext context) {
    double main_width = MediaQuery.of(context).size.width;
    double main_height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomSheet: Material(
          color: Colors.white,
          child: Container(
            height: 65,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors
                  .transparent, // Make sure the main container is transparent
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: primaryGreenColor,
                  borderRadius:
                      BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'ADD TO CART',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Product Images
              Stack(
                children: [
                  Container(
                    height: 360,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // color: Color(0xffC8E8E1),
                    ),
                    child: Stack(
                      children: [
                        Hero(
                          tag: 'product${widget.index}',
                          transitionOnUserGestures: true,
                          child: Center(
                            child: Image.asset(
                              '${productImageList[widget.index]}',
                              height: 250,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          right: 0,
                          left: 0,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IntrinsicWidth(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 3),
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Row(
                                      children: List.generate(
                                        5,
                                        (index) {
                                          return Container(
                                            height: 55,
                                            width: 55,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 3, vertical: 5),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                color: primaryGreenColor
                                                    .withOpacity(0.5),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.asset(
                                                '${productImageList[widget.index]}',
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    left: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: primaryYellowColor,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.arrow_back,
                              size: 22,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: primaryYellowColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.favorite_border,
                            size: 22,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              /// Product Details
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  children: [
                    IntrinsicWidth(
                      child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                          decoration: BoxDecoration(
                            color: greyBackgroundColor,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 5),
                              Text(
                                '${productRattingList[widget.index]}',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 14,
                              ),
                            ],
                          )),
                    ),
                    SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        '(30 Ratings)',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '|',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: primaryGreenColor,
                      ),
                    ),
                    SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        '40 Review',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: Text(
                  '${productNameList[widget.index]}',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        '${NumberFormat.currency(locale: 'en_IN', symbol: '₹').format(int.parse('${productPriceList[widget.index]}'))}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          decoration: productOffList[widget.index] == null
                              ? null
                              : TextDecoration.lineThrough,
                          color: productOffList[widget.index] == null
                              ? Colors.black
                              : Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    if (productOffList[widget.index] != null)
                      Flexible(
                        child: Text(
                          '${NumberFormat.currency(locale: 'en_IN', symbol: '₹').format(int.parse('${productPriceList[widget.index]}'))}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    SizedBox(width: 10),
                    if (productOffList[widget.index] != null)
                      Text(
                        '${productOffList[widget.index]}% off',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: primaryGreenColor,
                        ),
                      ),
                  ],
                ),
              ),

              /// Color
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 14,
                ),
                child: Text(
                  'Color',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(1.4),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  ],
                ),
              ),

              /// Size
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 14,
                ),
                child: Text(
                  'Size',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(productSizeList.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            productSizeIndex = index;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: productSizeIndex == index
                                ? greyTextColor
                                : Colors.white,
                            border: Border.all(
                              color: greyTextColor,
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          margin: EdgeInsets.only(right: 10),
                          padding:
                              EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                          child: Text(
                            '${productSizeList[index]}',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: productSizeIndex == index ? 15 : 14,
                              fontWeight: productSizeIndex == index
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: Text(
                  'Rating & Reviews',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .center, // Align content to the start
                      children: [
                        Row(
                          children: [
                            Text(
                              '${productRattingList[widget.index]}',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(width: 5),
                            Icon(
                              Icons.star,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        Text(
                          '3000 Ratings',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      // Wrap the second column in Expanded
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                '5',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.black,
                                size: 14,
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: LinearProgressIndicator(
                                    value: 0.6,
                                    minHeight: 8,
                                    color: primaryGreenColor,
                                    backgroundColor: Colors.grey.shade300,
                                  ),
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                '30',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '4',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.black,
                                size: 14,
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: LinearProgressIndicator(
                                    value: 0.4,
                                    minHeight: 8,
                                    color: primaryGreenColor,
                                    backgroundColor: Colors.grey.shade300,
                                  ),
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                '16',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '3',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.black,
                                size: 14,
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: LinearProgressIndicator(
                                    value: 0.8,
                                    minHeight: 8,
                                    color: primaryGreenColor,
                                    backgroundColor: Colors.grey.shade300,
                                  ),
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                '40',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '2',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.black,
                                size: 14,
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: LinearProgressIndicator(
                                    value: 0.2,
                                    minHeight: 8,
                                    color: primaryGreenColor,
                                    backgroundColor: Colors.grey.shade300,
                                  ),
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                '10',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '1',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.black,
                                size: 14,
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: LinearProgressIndicator(
                                    value: 0.1,
                                    minHeight: 8,
                                    color: primaryGreenColor,
                                    backgroundColor: Colors.grey.shade300,
                                  ),
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                '05',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
