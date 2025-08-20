import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:softair_assignment/model/store_model.dart';
import 'package:softair_assignment/screens/checkout_screen.dart';
import 'package:softair_assignment/widgets/flashCards.dart';
import 'package:softair_assignment/widgets/store_widget.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  List<String> categories = [
    'Antibiotics',
    'Treatment',
    'Ayurvedic',
    'General Care',
  ];
  List<StoreModel> stores = [
    StoreModel(
      image: 'assets/images/pharmacy1.png',
      name: 'Sharma Medical Store',
      address: 'Daultapura, Ghaziabad',
      available: true,
      medicine: 500,
      exp: 11,
    ),
    StoreModel(
      image: 'assets/images/pharmacy2.png',
      name: 'Goel Medical Store',
      address: 'Mohanagar, Ghaziabad',
      available: false,
      medicine: 500,
      exp: 11,
    ),
    StoreModel(
      image: 'assets/images/pharmacy1.png',
      name: 'Sharma Medical Store',
      address: 'Daultapura, Ghaziabad',
      available: true,
      medicine: 500,
      exp: 11,
    ),
  ];
  int start = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(360.w, 100.h),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.r),
              bottomRight: Radius.circular(30.r),
            ),
            color: Color(0xFF293543),
          ),
          padding: EdgeInsets.only(left: 16.w, top: 40.h, right: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // spacing: 10.h,
            children: [
              Text(
                "CityMeds",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              Text(
                "15 minutes delivery",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.location_pin, color: Colors.white, size: 12.sp),
                  Text(
                    "1st Floor Punjab Bagh",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  Badge(
                    backgroundColor: Colors.red,
                    child: Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 30.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10.sp),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Search Store and Health Products",
                    prefixIcon: Icon(Icons.search, color: Color(0xFF293543)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.r),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                height: 110.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Image.asset('assets/images/medicine1.png'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Image.asset('assets/images/products1.png'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Image.asset('assets/images/cosmetics.png'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                height: 25.h,
                child: ListView.builder(
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder:
                      (context, index) => Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 3.h,
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 8.w),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color:
                                start == index
                                    ? Color(0xFF31B682)
                                    : Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                        child: Text(
                          categories[index],
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color:
                                start == index
                                    ? Color(0xFF31B682)
                                    : Colors.black,
                          ),
                        ),
                      ),
                ),
              ),
              myCarousel(context),
              popularStores(context),
              referWidget(context),
              flashCards(context),
              memberShipCard(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: myNavBar(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CheckoutScreen()),
          );
        },
      ),
    );
  }

  Widget myCarousel(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: CarouselSliderController(),
          disableGesture: false,
          items: [
            Image.asset('assets/images/capsules1.png', fit: BoxFit.fill),
            Image.asset('assets/images/capsules1.png', fit: BoxFit.fill),
            Image.asset('assets/images/capsules1.png', fit: BoxFit.fill),
          ],
          options: CarouselOptions(
            height: 200.h,
            initialPage: 0,
            autoPlay: true,
            viewportFraction: 0.8,
            enlargeCenterPage: true,
          ),
        ),
        AnimatedSmoothIndicator(
          activeIndex: 1,
          count: 3,
          effect: ScrollingDotsEffect(
            dotHeight: 10,
            dotWidth: 10,
            activeDotColor: Colors.black,
            dotColor: Colors.grey.shade400,
          ),
          onDotClicked: (index) {},
        ),
      ],
    );
  }

  Widget popularStores(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Popular Store",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.sp),
            ),
            Spacer(),
            InkWell(
              child: Text(
                "See All",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF31B682),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 300.h,
          child: ListView.builder(
            itemBuilder:
                (context, index) => StoreWidget(storeModel: stores[index]),
            itemCount: stores.length,
          ),
        ),
      ],
    );
  }

  Widget referWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.h),
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFFFFFFF).withOpacity(0.25),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "REFER & EARN",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                "Invite friends and family to\nearn cashback on citymeds",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 20.h),
              InkWell(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 5.h,
                    horizontal: 21.w,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFF31B682),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Text(
                    "INVITE FRIENDS",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
          CircleAvatar(
            radius: 55.r,
            backgroundColor: Color(0xFFE6F8E8),
            backgroundImage: AssetImage('assets/images/refer1.png'),
          ),
        ],
      ),
    );
  }

  Widget flashCards(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Flash Cards",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.sp),
            ),
            Spacer(),
            InkWell(
              child: Text(
                "See All",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF31B682),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 170.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [Flashcards(), Flashcards(), Flashcards()],
          ),
        ),
      ],
    );
  }

  Widget memberShipCard(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.h),
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.black12),
        color: Color(0xFFFFE59C),
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFFFFFFF).withOpacity(0.25),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Take Membership",
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                "● Get Special discounts and offers on\nCitymeds services.",
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w400),
              ),
              Text(
                "● Get 5% NMS Cash on all orders.",
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 20.h),
              InkWell(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 5.h,
                    horizontal: 21.w,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFF31B682),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Text(
                    "Explore Plans",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 40.r,
                // backgroundColor: Color(0x9D9A9940),
                backgroundImage: AssetImage('assets/images/membership.png'),
              ),
              SizedBox(height: 10.h),
              InkWell(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF31B682)),
                    // color: Color(0xFF31B682),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Text(
                    "⚡ Starting at Rs. 99",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF31B682),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget myNavBar(BuildContext context) {
    return CurvedNavigationBar(
      // height: 70.h,
      buttonBackgroundColor: Color(0xFF69CEA4),
      backgroundColor: Colors.white,
      color: Color(0xFF293543),
      items: [
        Image.asset('assets/images/home_icon.png'),
        Image.asset('assets/images/shopping_icon.png'),
        Image.asset('assets/images/discount_icon.png'),
        Image.asset('assets/images/orders_icon.png'),
        Image.asset('assets/images/profile_icon.png'),
      ],
    );
  }
}
