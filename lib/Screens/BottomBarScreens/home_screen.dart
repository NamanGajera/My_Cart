import 'dart:async';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:my_cart/Screens/OtherScreens/product_details_screen.dart';
import 'package:my_cart/Utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// Variables---------------
  int bannerIndex = 0;
  late Timer progressTimer;
  double progressValue = 0; // Value to track progress (0.0 to 1.0)

  @override
  void initState() {
    super.initState();
    startProgressTimer();
  }

  /// Functions-----------------

  void startProgressTimer() {
    progressTimer = Timer.periodic(Duration(milliseconds: 20), (timer) {
      setState(() {
        progressValue += 0.01;
        if (progressValue >= 1) {
          progressValue = 0;
          bannerIndex = (bannerIndex + 1) % bannerTitles.length;
          _carouselController.nextPage();
        }
      });
    });
  }

  void resetProgress() {
    setState(() {
      progressValue = 0;
    });
  }

  @override
  void dispose() {
    progressTimer.cancel();
    super.dispose();
  }

  /// Controllers----------------
  TextEditingController _serachController = TextEditingController();
  final CarouselSliderController _carouselController =
      CarouselSliderController(); // Controller for CarouselSlider

  /// Lists And Maps-----------------
  final List<String> categories = [
    'Beauty',
    'Fashion',
    'Footwear',
    'Home',
    'Electronics',
    'Sports',
  ];

  final List<String> categoriesImages = [
    'assets/images/beauty_icon.png',
    'assets/images/fashion_icon.png',
    'assets/images/footwear_icon.png',
    'assets/images/home1.png',
    'assets/images/electronic.jpg',
    'assets/images/sports.webp',
  ];

  final List<String> bannerImages = [
    'assets/images/banner_img1.png',
    'assets/images/banner_img2.png',
    'assets/images/banner_img2.png'
  ];

  List<String> bannerTitles = [
    "Flash Deals Up to 50% Off!",
    "Festive Season Specials!",
    "New Arrivals with Special Discounts!",
  ];

  List<String> bannerDescriptions = [
    "Shop now and save up to 50% off on exclusive items for a limited time!",
    "Celebrate with huge\ndiscounts on all\ncategories this season, don’t miss out!",
    "Shop new trends and\nenjoy fantastic savings\nwith our exclusive offers today!",
  ];

  List bannerColors = [
    Color(0xffAAD7D9),
    Color(0xffC9E9D2),
    Color(0xffFFC96F),
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

  @override
  Widget build(BuildContext context) {
    double main_width = MediaQuery.of(context).size.width;
    double main_height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),

                /// App Bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ' Hey, Naman Gajera',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                size: 20,
                              ),
                              Flexible(
                                child: Text(
                                  'Ahmedabad, Gujarat',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/svg/profile_icon.svg',
                      height: 38,
                      width: 38,
                    ),
                  ],
                ),

                /// Search Bar
                SizedBox(height: 24),
                SizedBox(
                  height: 36,
                  child: TextFormField(
                    controller: _serachController,
                    cursorColor: primaryGreenColor,
                    cursorHeight: 22,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: primaryGreenColor,
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        size: 21,
                        color: greyBackgroundColor,
                      ),
                      suffixIcon: Icon(
                        Icons.mic,
                        size: 21,
                        color: greyBackgroundColor,
                      ),
                    ),
                  ),
                ),

                /// Category
                SizedBox(height: 12),
                Text(
                  'Shop by Category',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      categories.length,
                      (index) {
                        return Padding(
                          padding: EdgeInsets.only(right: 18),
                          child: Column(
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                    color: primaryYellowColor,
                                    // color: Color(0xffffaa7b),
                                    shape: BoxShape.circle,
                                    border:
                                        Border.all(color: primaryGreenColor)),
                                child: ClipOval(
                                    child: Image.asset(
                                  '${categoriesImages[index]}',
                                  fit: BoxFit.cover,
                                )),
                              ),
                              SizedBox(height: 6),
                              Text(
                                '${categories[index]}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),

                /// Banners
                Stack(
                  children: [
                    CarouselSlider(
                      carouselController: _carouselController,
                      items: List.generate(bannerTitles.length, (index) {
                        return Container(
                          height: 190,
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: bannerColors[index],
                              borderRadius: BorderRadius.circular(10)),
                          child: Stack(
                            children: [
                              Positioned(
                                right: 0,
                                bottom: 0,
                                child: Image.asset(
                                  '${bannerImages[index]}',
                                  height: 180,
                                  width: 130,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 24,
                                left: 20,
                                child: SizedBox(
                                  width: main_width - 165,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${bannerTitles[index]}',
                                        maxLines: 2,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                        '${bannerDescriptions[index]}',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                      options: CarouselOptions(
                          viewportFraction: 1,
                          height: 190,
                          autoPlay: false,
                          onPageChanged: (index, reason) {
                            setState(() {
                              bannerIndex = index;
                              resetProgress();
                            });
                          }),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 0,
                      left: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          bannerTitles.length,
                          (index) {
                            return Container(
                              margin: EdgeInsets.only(right: 7),
                              child: Stack(
                                children: [
                                  Container(
                                    height: 6,
                                    width: 24,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  // Animated progress bar for the current active item
                                  if (index == bannerIndex)
                                    AnimatedContainer(
                                      duration: Duration(
                                          milliseconds: 20), // 10ms update
                                      height: 6,
                                      width: 24 * progressValue,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),

                /// Suggested Products
                SizedBox(height: 12),
                Text(
                  'Suggested for you',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 12),

                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: productImageList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    mainAxisExtent: 228,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetailsScreen(index: index,)));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(10)),
                            child: Stack(
                              children: [
                                Hero(
                                  tag: 'product${index}',
                                  transitionOnUserGestures: true,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      '${productImageList[index]}',
                                      fit: BoxFit.contain,
                                      height: 130,
                                      width: double.infinity,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.favorite_outline),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 6),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.transparent,
                                          Colors.black.withOpacity(0.6),
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                    child: Text(
                                      '${productBrandName[index]}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        shadows: [
                                          Shadow(
                                            color: Colors.black26,
                                            blurRadius: 4,
                                            offset: Offset(1, 1),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                if (productOffList[index] != null)
                                  Positioned(
                                    right: 0,
                                    bottom: 0,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 1),
                                      decoration: BoxDecoration(
                                        color: primaryGreenColor,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                      ),
                                      child: Text(
                                        '${productOffList[index]}% off',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          SizedBox(height: 6),
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              '${NumberFormat.currency(locale: 'en_IN', symbol: '₹').format(int.parse('${productPriceList[index]}'))}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              '${productNameList[index]}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          IntrinsicWidth(
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 2),
                                decoration: BoxDecoration(
                                  color: greyBackgroundColor,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(width: 5),
                                    Text(
                                      '${productRattingList[index]}',
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
                        ],
                      ),
                    );
                  },
                ),
                // Column(
                //   children: List.generate((productNameList.length / 2).ceil(), (index){
                //     final firstIndex = index * 2;
                //     final secondIndex = firstIndex + 1;
                //     return Padding(
                //       padding:  EdgeInsets.only(bottom: 15),
                //       child: Row(
                //         children: [
                //           Expanded(
                //             child: Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 Container(
                //                   decoration: BoxDecoration(
                //                       color: Colors.grey.shade100,
                //                       borderRadius: BorderRadius.circular(10)),
                //                   child: Stack(
                //                     children: [
                //                       ClipRRect(
                //                         borderRadius: BorderRadius.circular(10),
                //                         child: Image.asset(
                //                           '${productImageList[firstIndex]}',
                //                           fit: BoxFit.contain,
                //                           height: 130,
                //                           width: double.infinity,
                //                         ),
                //                       ),
                //                       Positioned(
                //                         right: 0,
                //                         child: IconButton(
                //                           onPressed: () {},
                //                           icon: Icon(Icons.favorite_outline),
                //                         ),
                //                       ),
                //                       Positioned(
                //                         bottom: 0,
                //                         left: 0,
                //                         right: 0,
                //                         child: Container(
                //                           padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                //                           decoration: BoxDecoration(
                //                             gradient: LinearGradient(
                //                               colors: [
                //                                 Colors.transparent,
                //                                 Colors.black.withOpacity(0.6),
                //                               ],
                //                               begin: Alignment.topCenter,
                //                               end: Alignment.bottomCenter,
                //                             ),
                //                             borderRadius: BorderRadius.only(
                //                               bottomLeft: Radius.circular(10),
                //                               bottomRight: Radius.circular(10),
                //                             ),
                //                           ),
                //                           child: Text(
                //                             '${productBrandName[firstIndex]}',
                //                             style: TextStyle(
                //                               color: Colors.white,
                //                               fontWeight: FontWeight.bold,
                //                               fontSize: 14,
                //                               shadows: [
                //                                 Shadow(
                //                                   color: Colors.black26,
                //                                   blurRadius: 4,
                //                                   offset: Offset(1, 1),
                //                                 ),
                //                               ],
                //                             ),
                //                           ),
                //                         ),
                //                       ),
                //                       if(productOffList[firstIndex] != null)
                //                       Positioned(
                //                         right: 0,
                //                         bottom: 0,
                //                         child: Container(
                //                           padding: EdgeInsets.symmetric(
                //                               horizontal: 15, vertical: 1),
                //                           decoration: BoxDecoration(
                //                             color: primaryGreenColor,
                //                             borderRadius: BorderRadius.only(
                //                               topLeft: Radius.circular(10),
                //                               topRight: Radius.circular(10),
                //                             ),
                //                           ),
                //                           child: Text(
                //                             '${productOffList[firstIndex]}% off',
                //                             style: TextStyle(
                //                               color: Colors.white,
                //                               fontSize: 10,
                //                             ),
                //                           ),
                //                         ),),
                //                     ],
                //                   ),
                //                 ),
                //                 SizedBox(height: 6),
                //                 Padding(
                //                   padding: EdgeInsets.only(left: 5),
                //                   child: Text(
                //                     '${NumberFormat.currency(locale: 'en_IN', symbol: '₹').format(int.parse('${productPriceList[firstIndex]}'))}',
                //                     maxLines: 1,
                //                     overflow: TextOverflow.ellipsis,
                //                     style: TextStyle(
                //                       color: Colors.black,
                //                       fontSize: 14,
                //                       fontWeight: FontWeight.w500,
                //                     ),
                //                   ),
                //                 ),
                //                 Padding(
                //                   padding: EdgeInsets.only(left: 5),
                //                   child: Text(
                //                     '${productNameList[firstIndex]}',
                //                     maxLines: 1,
                //                     overflow: TextOverflow.ellipsis,
                //                     style: TextStyle(
                //                       color: Colors.black,
                //                       fontSize: 14,
                //                       fontWeight: FontWeight.w500,
                //                     ),
                //                   ),
                //                 ),
                //                 SizedBox(height: 8),
                //                 IntrinsicWidth(
                //                   child: Container(
                //                       padding: EdgeInsets.symmetric(
                //                           horizontal: 5, vertical: 2),
                //                       decoration: BoxDecoration(
                //                         color: greyBackgroundColor,
                //                         borderRadius: BorderRadius.circular(6),
                //                       ),
                //                       child: Row(
                //                         children: [
                //                           SizedBox(width: 5),
                //                           Text(
                //                             '${productRattingList[firstIndex]}',
                //                             style: TextStyle(
                //                               fontSize: 12,
                //                               fontWeight: FontWeight.w500,
                //                               color: Colors.black,
                //                             ),
                //                           ),
                //                           SizedBox(width: 5),
                //                           Icon(
                //                             Icons.star,
                //                             color: Colors.amber,
                //                             size: 14,
                //                           ),
                //                         ],
                //                       )),
                //                 ),
                //               ],
                //             ),
                //           ),
                //           SizedBox(width: 10),
                //           Expanded(
                //             child: Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 Container(
                //                   decoration: BoxDecoration(
                //                       color: Colors.grey.shade100,
                //                       borderRadius: BorderRadius.circular(10)),
                //                   child: Stack(
                //                     children: [
                //                       ClipRRect(
                //                         borderRadius: BorderRadius.circular(10),
                //                         child: Image.asset(
                //                           '${productImageList[secondIndex]}',
                //                           fit: BoxFit.contain,
                //                           height: 130,
                //                           width: double.infinity,
                //                         ),
                //                       ),
                //                       Positioned(
                //                         right: 0,
                //                         child: IconButton(
                //                           onPressed: () {},
                //                           icon: Icon(Icons.favorite_outline),
                //                         ),
                //                       ),
                //                       Positioned(
                //                         bottom: 0,
                //                         left: 0,
                //                         right: 0,
                //                         child: Container(
                //                           padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                //                           decoration: BoxDecoration(
                //                             gradient: LinearGradient(
                //                               colors: [
                //                                 Colors.transparent,
                //                                 Colors.black.withOpacity(0.6),
                //                               ],
                //                               begin: Alignment.topCenter,
                //                               end: Alignment.bottomCenter,
                //                             ),
                //                             borderRadius: BorderRadius.only(
                //                               bottomLeft: Radius.circular(10),
                //                               bottomRight: Radius.circular(10),
                //                             ),
                //                           ),
                //                           child: Text(
                //                             '${productBrandName[secondIndex]}',
                //                             style: TextStyle(
                //                               color: Colors.white,
                //                               fontWeight: FontWeight.bold,
                //                               fontSize: 14,
                //                               shadows: [
                //                                 Shadow(
                //                                   color: Colors.black26,
                //                                   blurRadius: 4,
                //                                   offset: Offset(1, 1),
                //                                 ),
                //                               ],
                //                             ),
                //                           ),
                //                         ),
                //                       ),
                //                       if(productOffList[secondIndex] != null)
                //                         Positioned(
                //                           right: 0,
                //                           bottom: 0,
                //                           child: Container(
                //                             padding: EdgeInsets.symmetric(
                //                                 horizontal: 15, vertical: 1),
                //                             decoration: BoxDecoration(
                //                               color: primaryGreenColor,
                //                               borderRadius: BorderRadius.only(
                //                                 topLeft: Radius.circular(10),
                //                                 topRight: Radius.circular(10),
                //                               ),
                //                             ),
                //                             child: Text(
                //                               '${productOffList[secondIndex]}% off',
                //                               style: TextStyle(
                //                                 color: Colors.white,
                //                                 fontSize: 10,
                //                               ),
                //                             ),
                //                           ),),
                //                     ],
                //                   ),
                //                 ),
                //                 SizedBox(height: 6),
                //                 Padding(
                //                   padding: EdgeInsets.only(left: 5),
                //                   child: Text(
                //                     '${NumberFormat.currency(locale: 'en_IN', symbol: '₹').format(int.parse('${productPriceList[secondIndex]}'))}',
                //                     maxLines: 1,
                //                     overflow: TextOverflow.ellipsis,
                //                     style: TextStyle(
                //                       color: Colors.black,
                //                       fontSize: 14,
                //                       fontWeight: FontWeight.w500,
                //                     ),
                //                   ),
                //                 ),
                //                 Padding(
                //                   padding: EdgeInsets.only(left: 5),
                //                   child: Text(
                //                     '${productNameList[secondIndex]}',
                //                     maxLines: 1,
                //                     overflow: TextOverflow.ellipsis,
                //                     style: TextStyle(
                //                       color: Colors.black,
                //                       fontSize: 14,
                //                       fontWeight: FontWeight.w500,
                //                     ),
                //                   ),
                //                 ),
                //                 SizedBox(height: 8),
                //                 IntrinsicWidth(
                //                   child: Container(
                //                       padding: EdgeInsets.symmetric(
                //                           horizontal: 5, vertical: 2),
                //                       decoration: BoxDecoration(
                //                         color: greyBackgroundColor,
                //                         borderRadius: BorderRadius.circular(6),
                //                       ),
                //                       child: Row(
                //                         children: [
                //                           SizedBox(width: 5),
                //                           Text(
                //                             '${productRattingList[secondIndex]}',
                //                             style: TextStyle(
                //                               fontSize: 12,
                //                               fontWeight: FontWeight.w500,
                //                               color: Colors.black,
                //                             ),
                //                           ),
                //                           SizedBox(width: 5),
                //                           Icon(
                //                             Icons.star,
                //                             color: Colors.amber,
                //                             size: 14,
                //                           ),
                //                         ],
                //                       )),
                //                 ),
                //               ],
                //             ),
                //           ),
                //         ],
                //       ),
                //     );
                //   },),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RadialPageRoute extends PageRouteBuilder {
  final Widget child;
  final Offset center;

  RadialPageRoute({required this.child, required this.center})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // Create a circular reveal effect
      var curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOut,
      );

      // Use the radial effect for transition
      return ClipPath(
        clipper: CircularRevealClipper(center: center, animation: curvedAnimation),
        child: child,
      );
    },
  );
}
class CircularRevealClipper extends CustomClipper<Path> {
  final Offset center;
  final Animation<double> animation;

  CircularRevealClipper({required this.center, required this.animation}) : super(reclip: animation);

  @override
  Path getClip(Size size) {
    final radius = animation.value * (size.width + size.height);
    return Path()..addOval(Rect.fromCircle(center: center, radius: radius));
  }

  @override
  bool shouldReclip(CircularRevealClipper oldClipper) => true;
}
