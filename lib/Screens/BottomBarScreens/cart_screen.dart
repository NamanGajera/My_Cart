import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_cart/Utils/colors.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late List<int> _counts;

  @override
  void initState() {
    super.initState();
    _counts = List<int>.filled(productNameList.length, 1);
  }

  void _incrementCount(int index) {
    setState(() {
      _counts[index]++;
    });
  }

  void _decrementCount(int index) {
    if (_counts[index] > 1) {
      setState(() {
        _counts[index]--;
      });
    }
  }

  int _calculateTotalPrice(int index) {
    int productPrice = int.parse(productPriceList[index]);
    return productPrice * _counts[index];
  }

  int _calculateGrandTotal() {
    int grandTotal = 0;
    for (int i = 0; i < productPriceList.length; i++) {
      grandTotal += _calculateTotalPrice(i);
    }
    return grandTotal;
  }

  void _showRemoveBottomSheet(BuildContext context, String product) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Wrap(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Adjust the height to content
                children: [
                  Container(
                    height: 3,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Remove $product?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      'Are you sure you want to remove this item from your cart?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(0xffC8E8E1),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'CANCEL',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(0xffC8E8E1),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'REMOVE',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomSheet: Material(
        color: Colors.white,
        child: Container(
          height: 65,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                color: primaryGreenColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'CHECKOUT ${NumberFormat.currency(locale: 'en_IN', symbol: '₹').format(int.parse('${_calculateGrandTotal()}'))}',
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              Column(
                children: List.generate(
                  productNameList.length,
                  (index) {
                    return Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: primaryGreenColor),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  '${productImageList[index]}',
                                  height: 60,
                                  width: 60,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          '${productNameList[index]}',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          _showRemoveBottomSheet(
                                              context, productNameList[index]);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 2),
                                          decoration: BoxDecoration(
                                            color: Color(0xffffb3b3),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          child: Text(
                                            'Remove',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${NumberFormat.currency(locale: 'en_IN', symbol: '₹').format(int.parse('${_calculateTotalPrice(index)}'))}',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () => _decrementCount(index),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: primaryYellowColor,
                                                shape: BoxShape.circle,
                                              ),
                                              padding: EdgeInsets.all(3),
                                              child: Icon(
                                                Icons.remove,
                                                color: Colors.black,
                                                size: 18,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 14, vertical: 2),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              border: Border.all(
                                                color: primaryGreenColor,
                                              ),
                                            ),
                                            child: Text(
                                              '${_counts[index]}',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          GestureDetector(
                                            onTap: () => _incrementCount(index),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: primaryYellowColor,
                                                shape: BoxShape.circle,
                                              ),
                                              padding: EdgeInsets.all(3),
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.black,
                                                size: 18,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Divider(),
                        if (index == productPriceList.length - 1)
                          SizedBox(height: 50),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
