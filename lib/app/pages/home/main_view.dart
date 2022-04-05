import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goob_by_me/app/components/indication/waiting_indicator.dart'
    as wi;
import 'package:goob_by_me/app/components/separation/separation.dart';

import 'package:goob_by_me/app/routes/app_router.dart';
import 'package:goob_by_me/app/utils/utils.dart';

class MainView extends StatefulWidget {
  MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView>
    with AutomaticKeepAliveClientMixin {
  NavigatorState get _navigator => GlobalKeys.appNavigator.currentState!;

  @override
  void initState() {
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    print('Home - Main');

    Media media = Media(context);
    double r = media.ratio;

    super.build(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          // Thời tiết & Tìm kiếm
          Container(
            padding: EdgeInsets.only(bottom: r * 6),
            //color: Color.fromRGBO(60, 180, 80, 1.0),
            decoration: BoxDecoration(
              color: Color.fromRGBO(70, 120, 150, 1.0), //Xanh xám
              // color: Color.fromRGBO(60, 180, 80, 1.0), //Xanh
              image: DecorationImage(
                image: Images.homeSearchBg,
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      top: r * 4, right: r * 4, bottom: r * 2, left: r * 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: r * 12),
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 18.0,
                              height: 16.0,
                              child: SvgPicture.asset(LightIcons.sunCloud,
                                  color: Colors.white),
                            ),
                            Text(" Nắng đẹp, ",
                                style: TextStyle(
                                    fontSize: r * 15, color: Colors.white)),
                            Text("36ºC",
                                style: TextStyle(
                                    fontSize: r * 15, color: Colors.white)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: r * 12),
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 14.0,
                              height: 14.0,
                              child: SvgPicture.asset(LightIcons.mapMarkerAlt,
                                  color: Colors.white),
                            ),
                            Text(" Cầu Giấy, Hà Nội",
                                style: TextStyle(
                                    fontSize: r * 15, color: Colors.white)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: r * 12, right: r * 12, bottom: r * 8, left: r * 12),
                  child: Column(
                    children: [
                      TextField(
                        style:
                            TextStyle(fontSize: r * 18, color: Colors.black87),
                        decoration: InputDecoration(
                          filled: true,
                          isDense: true,
                          fillColor: Color.fromRGBO(255, 255, 255, 0.9),
                          focusColor: Color.fromRGBO(255, 255, 255, 1.0),
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(r * 30)),
                            borderSide:
                                BorderSide(width: 0.3, color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(r * 30)),
                            borderSide:
                                BorderSide(width: 0.3, color: Colors.black87),
                          ),
                          contentPadding: EdgeInsets.all(r * 16),
                          hintText: 'Tìm kiếm trên Gobid...',
                          suffixIcon: Icon(Icons.search,
                              color: Colors.black45, size: r * 28),
                          suffixIconConstraints: BoxConstraints(
                              minWidth: r * 48, minHeight: r * 48),
                        ),
                      ),
                      Separator(height: r * 10),
                      SizedBox(
                        height: r * 28,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ButtonTheme(
                              minWidth: r * 28,
                              padding: const EdgeInsets.all(0.0),
                              child: OutlineButton(
                                padding: EdgeInsets.symmetric(
                                    vertical: 0.0, horizontal: r * 8),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(r * 14)),
                                borderSide:
                                    BorderSide(width: 0.5, color: Colors.white),
                                child: Text('144 Xuân Thủy...',
                                    style: TextStyle(
                                        fontSize: r * 14, color: Colors.white),
                                    overflow: TextOverflow.ellipsis),
                                onPressed: () {},
                              ),
                            ),
                            Separator(width: r * 8),
                            ButtonTheme(
                              minWidth: r * 28,
                              padding: const EdgeInsets.all(0.0),
                              child: OutlineButton(
                                padding: EdgeInsets.symmetric(
                                    vertical: 0.0, horizontal: r * 8),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(r * 14)),
                                borderSide:
                                    BorderSide(width: 0.5, color: Colors.white),
                                child: Text('Sữa tắm trẻ em',
                                    style: TextStyle(
                                        fontSize: r * 14, color: Colors.white),
                                    overflow: TextOverflow.ellipsis),
                                onPressed: () {},
                              ),
                            ),
                            Separator(width: r * 8),
                            ButtonTheme(
                              minWidth: r * 28,
                              padding: const EdgeInsets.all(0.0),
                              child: OutlineButton(
                                padding: EdgeInsets.symmetric(
                                    vertical: 0.0, horizontal: r * 8),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(r * 14)),
                                borderSide:
                                    BorderSide(width: 0.5, color: Colors.white),
                                child: Text('Lego',
                                    style: TextStyle(
                                        fontSize: r * 14, color: Colors.white),
                                    overflow: TextOverflow.ellipsis),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Slider thông tin khuyến mại
          Container(
            padding: EdgeInsets.only(top: r * 10, bottom: r * 10),
            child: CarouselSlider(
              options: CarouselOptions(
                height: r * 60,
                autoPlay: true,
                enableInfiniteScroll: true,
                scrollDirection: Axis.horizontal,
                viewportFraction: 1.0,
                autoPlayInterval: const Duration(seconds: 30),
              ),
              items: [3, 2, 1].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width - r * 24,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage('assets/images/ads/slider_' +
                                i.toString() +
                                '.jpg'),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.all(Radius.circular(2.0)),
                      ),
                      //child: Image(image: AssetImage('assets/images/ads/hot-sale-samsung-galaxy.jpg')),
                    );
                  },
                );
              }).toList(),
            ),
          ),

          // Dịch vụ
          Container(
            color: const Color.fromRGBO(250, 250, 250, 1.0),
            margin: const EdgeInsets.only(top: 0.0),
            padding: EdgeInsets.only(top: r * 6, bottom: r * 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: r * 8, horizontal: r * 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('LỰA CHỌN DỊCH VỤ',
                          style: TextStyle(
                              fontSize: r * 20,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(0, 0, 0, 0.7))),
                      // xem thêm button
                      SizedBox(
                        width: r * 76,
                        height: r * 24,
                        child: OutlinedButton(
                          onPressed: (null),
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(r * 12),
                            )),
                          ),
                          child: Text(
                            'Xem thêm',
                            style: TextStyle(
                                fontSize: r * 14, color: Colors.black45),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GridView.count(
                  primary: false,
                  padding:
                      EdgeInsets.symmetric(vertical: r * 8, horizontal: r * 12),
                  crossAxisSpacing: r * 12,
                  mainAxisSpacing: r * 12,
                  crossAxisCount:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? 3
                          : 6,
                  childAspectRatio: 1.1,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: <Widget>[
                    Material(
                      color: const Color.fromRGBO(0, 140, 220, 0.8),
                      borderRadius: BorderRadius.all(Radius.circular(r * 10)),
                      child: InkWell(
                        borderRadius: BorderRadius.all(Radius.circular(r * 10)),
                        child: Container(
                          padding: EdgeInsets.all(r * 8),
                          child: Column(
                            children: [
                              Separator(height: r * 10),
                              // Icon(Icons.local_taxi, size: r * 54, color: Colors.white),
                              SizedBox(
                                width: r * 50,
                                height: r * 50,
                                child: SvgPicture.asset(LightIcons.taxi,
                                    color: const Color.fromRGBO(
                                        255, 255, 255, 0.9)),
                              ),
                              Separator(height: r * 12),
                              Text("ĐẶT XE",
                                  style: TextStyle(
                                      fontSize: r * 15,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white)),
                            ],
                          ),
                          // decoration: BoxDecoration(
                          //   border: Border.all(width: 2, color: Colors.white54),
                          //   borderRadius: BorderRadius.all(Radius.circular(r * 10)),
                          // ),
                        ),
                        onTap: () {
                          //Navigator.pushNamed(context, AppRoute.carBooking);
                          _navigator.pushNamed(AppRoute.goNowPage);
                        },
                      ),
                    ),
                    Material(
                      color: const Color.fromRGBO(240, 158, 0, 0.8),
                      borderRadius: BorderRadius.all(Radius.circular(r * 10)),
                      child: InkWell(
                        borderRadius: BorderRadius.all(Radius.circular(r * 10)),
                        child: Container(
                          padding: EdgeInsets.all(r * 8),
                          child: Column(
                            children: [
                              Separator(height: r * 10),
                              // Icon(Icons.shopping_cart_outlined, size: r * 54, color: Colors.white),
                              SizedBox(
                                width: r * 50,
                                height: r * 50,
                                child: SvgPicture.asset(LightIcons.bagsShopping,
                                    color: const Color.fromRGBO(
                                        255, 255, 255, 0.9)),
                              ),
                              Separator(height: r * 12),
                              Text("MUA BÁN",
                                  style: TextStyle(
                                      fontSize: r * 15,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white)),
                            ],
                          ),
                          // decoration: BoxDecoration(
                          //   border: Border.all(width: 2, color: Colors.white54),
                          //   borderRadius: BorderRadius.all(Radius.circular(r * 10)),
                          // ),
                        ),
                        onTap: () {},
                      ),
                    ),
                    Material(
                      color: const Color.fromRGBO(0, 150, 136, 0.8),
                      borderRadius: BorderRadius.all(Radius.circular(r * 10)),
                      child: InkWell(
                        borderRadius: BorderRadius.all(Radius.circular(r * 10)),
                        child: Container(
                          padding: EdgeInsets.all(r * 8),
                          child: Column(
                            children: [
                              Separator(height: r * 10),
                              // Icon(Icons.location_on_outlined, size: r * 54, color: Colors.white),
                              SizedBox(
                                width: r * 50,
                                height: r * 50,
                                child: SvgPicture.asset(
                                    LightIcons.searchLocation,
                                    color: const Color.fromRGBO(
                                        255, 255, 255, 0.9)),
                              ),
                              Separator(height: r * 12),
                              Text("ĐỊA ĐIỂM",
                                  style: TextStyle(
                                      fontSize: r * 15,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white)),
                            ],
                          ),
                          // decoration: BoxDecoration(
                          //   border: Border.all(width: 2, color: Colors.white54),
                          //   borderRadius: BorderRadius.all(Radius.circular(r * 10)),
                          // ),
                        ),
                        onTap: () {},
                      ),
                    ),
                    Material(
                      color: const Color.fromRGBO(76, 126, 156, 0.8),
                      borderRadius: BorderRadius.all(Radius.circular(r * 10)),
                      child: InkWell(
                        borderRadius: BorderRadius.all(Radius.circular(r * 10)),
                        child: Container(
                          padding: EdgeInsets.all(r * 8),
                          child: Column(
                            children: [
                              Separator(height: r * 10),
                              // Icon(Icons.weekend_outlined, size: r * 54, color: Colors.white),
                              SizedBox(
                                width: r * 50,
                                height: r * 50,
                                child: SvgPicture.asset(LightIcons.shippingFast,
                                    color: const Color.fromRGBO(
                                        255, 255, 255, 0.9)),
                              ),
                              Separator(height: r * 12),
                              Text("VẬN CHUYỂN",
                                  style: TextStyle(
                                      fontSize: r * 15,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white)),
                            ],
                          ),
                          // decoration: BoxDecoration(
                          //   border: Border.all(width: 2, color: Colors.white54),
                          //   borderRadius: BorderRadius.all(Radius.circular(r * 10)),
                          // ),
                        ),
                        onTap: () {},
                      ),
                    ),
                    // Material(
                    //   color: const Color.fromRGBO(125, 190, 48, 0.8),
                    //   borderRadius: BorderRadius.all(Radius.circular(r * 10)),
                    //   child: InkWell(
                    //     borderRadius: BorderRadius.all(Radius.circular(r * 10)),
                    //     child: Container(
                    //       padding: EdgeInsets.all(r * 8),
                    //       child: Column(
                    //         children: [
                    //           Separator(height: r * 10),
                    //           // Icon(Icons.assignment_ind_outlined, size: r * 54, color: Colors.white),
                    //           SizedBox(
                    //             width: r * 50,
                    //             height: r * 50,
                    //             child: SvgPicture.asset(LightIcons.clipboardUser, color: const Color.fromRGBO(255, 255, 255, 0.9)),
                    //           ),
                    //           Separator(height: r * 12),
                    //           Text("VIỆC LÀM", style: TextStyle(fontSize: r * 15, fontWeight: FontWeight.w700, color: Colors.white)),
                    //         ],
                    //       ),
                    //       // decoration: BoxDecoration(
                    //       //   border: Border.all(width: 2, color: Colors.white54),
                    //       //   borderRadius: BorderRadius.all(Radius.circular(r * 10)),
                    //       // ),
                    //     ),
                    //     onTap: () {},
                    //   ),
                    // ),
                    Material(
                      color: const Color.fromRGBO(110, 109, 104, 0.8),
                      borderRadius: BorderRadius.all(Radius.circular(r * 10)),
                      child: InkWell(
                        borderRadius: BorderRadius.all(Radius.circular(r * 10)),
                        child: Container(
                          padding: EdgeInsets.all(r * 8),
                          child: Column(
                            children: [
                              Separator(height: r * 10),
                              // Icon(Icons.weekend_outlined, size: r * 54, color: Colors.white),
                              SizedBox(
                                width: r * 50,
                                height: r * 50,
                                child: SvgPicture.asset(
                                    LightIcons.creditCardFront,
                                    color: const Color.fromRGBO(
                                        255, 255, 255, 0.9)),
                              ),
                              Separator(height: r * 12),
                              Text(
                                "THANH TOÁN",
                                style: TextStyle(
                                    fontSize: r * 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                    Material(
                      color: const Color.fromRGBO(125, 190, 48, 0.8),
                      borderRadius: BorderRadius.all(Radius.circular(r * 10)),
                      child: InkWell(
                        borderRadius: BorderRadius.all(Radius.circular(r * 10)),
                        child: Container(
                          padding: EdgeInsets.all(r * 8),
                          child: Column(
                            children: [
                              Separator(height: r * 10),
                              // Icon(Icons.assignment_ind_outlined, size: r * 54, color: Colors.white),
                              SizedBox(
                                width: r * 50,
                                height: r * 50,
                                child: SvgPicture.asset(LightIcons.userCircle,
                                    color: const Color.fromRGBO(
                                        255, 255, 255, 0.9)),
                              ),
                              Separator(height: r * 12),
                              Text("CÁ NHÂN",
                                  style: TextStyle(
                                      fontSize: r * 15,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white)),
                            ],
                          ),
                          // decoration: BoxDecoration(
                          //   border: Border.all(width: 2, color: Colors.white54),
                          //   borderRadius: BorderRadius.all(Radius.circular(r * 10)),
                          // ),
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Địa điểm
          Container(
            color: const Color.fromRGBO(250, 250, 250, 1.0),
            margin: EdgeInsets.only(top: r * 10),
            padding: EdgeInsets.only(top: r * 6, bottom: r * 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: r * 8, horizontal: r * 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('ĐỊA ĐIỂM QUEN THUỘC',
                          style: TextStyle(
                              fontSize: r * 20,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(0, 0, 0, 0.7))),
                      SizedBox(
                        width: r * 76,
                        height: r * 24,
                        child: OutlineButton(
                          padding: const EdgeInsets.all(0.0),
                          borderSide:
                              BorderSide(width: 0.5, color: Colors.black45),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(r * 12)),
                          child: Text('Xem thêm',
                              style: TextStyle(
                                  fontSize: r * 14, color: Colors.black45),
                              overflow: TextOverflow.ellipsis),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  //height: r * 280,
                  constraints:
                      BoxConstraints(minHeight: r * 250, maxHeight: r * 280),
                  padding:
                      EdgeInsets.symmetric(vertical: r * 8, horizontal: r * 12),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: r * 220,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: r * 220,
                              height: r * 180,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                        'assets/images/ads/diadiem.jpg')),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(2.0),
                                    topRight: Radius.circular(2.0)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: r * 8.0,
                                  right: r * 8.0,
                                  bottom: r * 3.0,
                                  left: r * 8.0),
                              child: Text('Bún chả Hàng Quạt',
                                  style: TextStyle(
                                      fontSize: r * 16,
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: r * 3.0,
                                  right: r * 8.0,
                                  bottom: r * 3.0,
                                  left: r * 8.0),
                              child: Text(
                                  '208 Hàng Quạt, Hai Bà Trưng, Hà Nội, Việt Nam',
                                  style: TextStyle(
                                      fontSize: r * 14, color: Colors.teal),
                                  overflow: TextOverflow.ellipsis),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: r * 3.0,
                                  right: r * 8.0,
                                  bottom: r * 8.0,
                                  left: r * 8.0),
                              child: Text('Mở cửa: 7h30 - 22h00 | T2 - CN',
                                  style: TextStyle(
                                      fontSize: r * 14, color: Colors.orange),
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 0.5,
                            color: Colors.black12,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(2.0)),
                          color: Colors.white,
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        Separator(width: r * 12),
                  ),
                ),
              ],
            ),
          ),

          // Quảng cáo
          Container(
            color: const Color.fromRGBO(250, 250, 250, 1.0),
            padding: EdgeInsets.symmetric(vertical: r * 10, horizontal: r * 12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(2.0),
              child: Stack(
                children: [
                  Image(
                      image: AssetImage(
                          'assets/images/ads/Banner-Giay-Dr-Martens-1290x800.png')),
                  Positioned(
                    top: r * 6,
                    right: r * 10,
                    child: SizedBox(
                      width: r * 24,
                      height: r * 24,
                      child: SvgPicture.asset(LightIcons.ad,
                          color: Colors.white54),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Sản phẩm
          Container(
            color: const Color.fromRGBO(250, 250, 250, 1.0),
            // margin: EdgeInsets.only(top: r * 10),
            padding: EdgeInsets.only(top: r * 6, bottom: r * 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: r * 8, horizontal: r * 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('MẶT HÀNG NỔI BẬT',
                          style: TextStyle(
                              fontSize: r * 20,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(0, 0, 0, 0.7))),
                      SizedBox(
                        width: r * 76,
                        height: r * 24,
                        child: OutlinedButton(
                          onPressed: (null),
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(r * 12),
                            )),
                          ),
                          child: Text(
                            'Xem thêm',
                            style: TextStyle(
                                fontSize: r * 14, color: Colors.black45),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: r * 260,
                  padding:
                      EdgeInsets.symmetric(vertical: r * 8, horizontal: r * 12),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        width: r * 220,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: r * 220,
                              height: r * 180,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                      'assets/images/ads/sanpham1.jpg'),
                                ),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(2.0),
                                    topRight: Radius.circular(2.0)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: r * 8,
                                  right: r * 8,
                                  bottom: r * 3,
                                  left: r * 8),
                              child: Text('Ohui Age Recovery 5 trong 1',
                                  style: TextStyle(
                                      fontSize: r * 16,
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: r * 3,
                                  right: r * 8,
                                  bottom: r * 8,
                                  left: r * 8),
                              child: Text('500,000 VNĐ/Set',
                                  style: TextStyle(
                                      fontSize: r * 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.red),
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 0.5,
                            color: Colors.black12,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(2.0)),
                          color: Colors.white,
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        Separator(width: r * 12),
                  ),
                ),
              ],
            ),
          ),

          // Bài đăng
          Container(
            color: const Color.fromRGBO(250, 250, 250, 1.0),
            margin: EdgeInsets.only(top: r * 10),
            padding: EdgeInsets.only(top: r * 6, bottom: r * 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: r * 8, horizontal: r * 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('HOẠT ĐỘNG MỚI NHẤT',
                          style: TextStyle(
                              fontSize: r * 20,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(0, 0, 0, 0.7))),
                      // SizedBox(
                      //   width: r * 76,
                      //   height: r * 24,
                      //   child: OutlineButton(
                      //     padding: const EdgeInsets.all(0.0),
                      //     borderSide: BorderSide(width: 0.5, color: Colors.black45),
                      //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(r * 12)),
                      //     child: Text('Xem thêm', style: TextStyle(fontSize: r * 14, color: Colors.black45), overflow: TextOverflow.ellipsis),
                      //     onPressed: () {},
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Container(
                  color: const Color.fromRGBO(250, 250, 250, 1.0),
                  padding:
                      EdgeInsets.symmetric(vertical: r * 6, horizontal: r * 12),
                  child: Center(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side:
                            const BorderSide(color: Colors.black12, width: 0.5),
                        borderRadius: BorderRadius.circular(r * 8),
                      ),
                      elevation: 0.0,
                      margin: const EdgeInsets.all(0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ListTile(
                            dense: true,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: r * 10),
                            visualDensity: const VisualDensity(
                                horizontal: -4, vertical: 0),
                            leading: IconButton(
                              icon: SizedBox(
                                width: r * 42,
                                height: r * 42,
                                child: SvgPicture.asset(LightIcons.grin,
                                    color: Colors.black54),
                              ),
                              tooltip: 'Vào trang riêng của Nguyen Van An',
                              padding: const EdgeInsets.all(0.0),
                              onPressed: () {},
                            ),
                            title: Text('Nguyen Van An',
                                style: TextStyle(
                                    fontSize: r * 17,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromRGBO(0, 0, 0, 0.7))),
                            subtitle: Text('Đăng bán mặt hàng mới.',
                                style: TextStyle(fontSize: r * 13)),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: r * 40,
                                  child: IconButton(
                                    icon: Icon(Icons.favorite_outline_outlined,
                                        size: r * 22),
                                    tooltip: 'Quan tâm',
                                    onPressed: () {},
                                  ),
                                ),
                                SizedBox(
                                  width: r * 40,
                                  child: IconButton(
                                    icon: Icon(Icons.more_vert, size: r * 22),
                                    tooltip: 'Tùy chọn',
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Image(
                                  image: AssetImage(
                                      'assets/images/ads/image001_korf.jpg')),
                            ),
                            onTap: () {},
                          ),
                          Container(
                            padding: EdgeInsets.all(r * 10),
                            child: Text("Sản phẩm không phải là thuốc...",
                                style: TextStyle(fontSize: r * 17)),
                          ),
                          const Divider(height: 0),
                          Container(
                            padding:
                                EdgeInsets.only(left: r * 16.0, right: r * 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 15,
                                      height: 15,
                                      child: SvgPicture.asset(SolidIcons.tags,
                                          color: Colors.blue),
                                    ),
                                    Separator(width: r * 5),
                                    Text('1,800,000 VNĐ/SP',
                                        style: TextStyle(
                                            fontSize: r * 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.blue)),
                                  ],
                                ),
                                ButtonTheme(
                                  minWidth: r * 50,
                                  height: r * 30,
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(r * 15)),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 0.0, horizontal: r * 10),
                                    child: Row(
                                      children: [
                                        Text('CHI TIẾT',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: r * 16)),
                                        Icon(Icons.arrow_forward_ios_sharp,
                                            size: 12, color: Colors.black54),
                                      ],
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  color: const Color.fromRGBO(250, 250, 250, 1.0),
                  padding:
                      EdgeInsets.symmetric(vertical: r * 6, horizontal: r * 12),
                  child: Center(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side:
                            const BorderSide(color: Colors.black12, width: 0.5),
                        borderRadius: BorderRadius.circular(r * 8),
                      ),
                      elevation: 0.0,
                      margin: const EdgeInsets.all(0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ListTile(
                            dense: true,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: r * 10),
                            visualDensity: const VisualDensity(
                                horizontal: -4, vertical: 0),
                            leading: IconButton(
                              icon: SizedBox(
                                width: r * 42,
                                height: r * 42,
                                child: SvgPicture.asset(LightIcons.grin,
                                    color: Colors.black54),
                              ),
                              tooltip: 'Vào trang riêng của Nguyen Van An',
                              padding: const EdgeInsets.all(0.0),
                              onPressed: () {},
                            ),
                            title: Text('Nguyen Van An',
                                style: TextStyle(
                                    fontSize: r * 17,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromRGBO(0, 0, 0, 0.7))),
                            subtitle: Text('Đăng bán mặt hàng mới.',
                                style: TextStyle(fontSize: r * 13)),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: r * 40,
                                  child: IconButton(
                                    icon: Icon(Icons.favorite_outline_outlined,
                                        size: r * 22),
                                    tooltip: 'Quan tâm',
                                    onPressed: () {},
                                  ),
                                ),
                                SizedBox(
                                  width: r * 40,
                                  child: IconButton(
                                    icon: Icon(Icons.more_vert, size: r * 22),
                                    tooltip: 'Tùy chọn',
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Image(
                                  image: AssetImage(
                                      'assets/images/ads/image001_korf.jpg')),
                            ),
                            onTap: () {},
                          ),
                          Container(
                            padding: EdgeInsets.all(r * 10),
                            child: Text("Sản phẩm không phải là thuốc...",
                                style: TextStyle(fontSize: r * 17)),
                          ),
                          const Divider(height: 0),
                          Container(
                            padding:
                                EdgeInsets.only(left: r * 16.0, right: r * 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 15,
                                      height: 15,
                                      child: SvgPicture.asset(SolidIcons.tags,
                                          color: Colors.blue),
                                    ),
                                    Separator(width: r * 5),
                                    Text('1,800,000 VNĐ/SP',
                                        style: TextStyle(
                                            fontSize: r * 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.blue)),
                                  ],
                                ),
                                ButtonTheme(
                                  minWidth: r * 50,
                                  height: r * 30,
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(r * 15)),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 0.0, horizontal: r * 10),
                                    child: Row(
                                      children: [
                                        Text('CHI TIẾT',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: r * 16)),
                                        Icon(Icons.arrow_forward_ios_sharp,
                                            size: 12, color: Colors.black54),
                                      ],
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  color: const Color.fromRGBO(250, 250, 250, 1.0),
                  padding:
                      EdgeInsets.symmetric(vertical: r * 6, horizontal: r * 12),
                  child: Center(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side:
                            const BorderSide(color: Colors.black12, width: 0.5),
                        borderRadius: BorderRadius.circular(r * 8),
                      ),
                      elevation: 0.0,
                      margin: const EdgeInsets.all(0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ListTile(
                            dense: true,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: r * 10),
                            visualDensity: const VisualDensity(
                                horizontal: -4, vertical: 0),
                            leading: IconButton(
                              icon: SizedBox(
                                width: r * 42,
                                height: r * 42,
                                child: SvgPicture.asset(LightIcons.grin,
                                    color: Colors.black54),
                              ),
                              tooltip: 'Vào trang riêng của Nguyen Van An',
                              padding: const EdgeInsets.all(0.0),
                              onPressed: () {},
                            ),
                            title: Text('Nguyen Van An',
                                style: TextStyle(
                                    fontSize: r * 17,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromRGBO(0, 0, 0, 0.7))),
                            subtitle: Text('Đăng bán mặt hàng mới.',
                                style: TextStyle(fontSize: r * 13)),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: r * 40,
                                  child: IconButton(
                                    icon: Icon(Icons.favorite_outline_outlined,
                                        size: r * 22),
                                    tooltip: 'Quan tâm',
                                    onPressed: () {},
                                  ),
                                ),
                                SizedBox(
                                  width: r * 40,
                                  child: IconButton(
                                    icon: Icon(Icons.more_vert, size: r * 22),
                                    tooltip: 'Tùy chọn',
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Image(
                                  image: AssetImage(
                                      'assets/images/ads/image001_korf.jpg')),
                            ),
                            onTap: () {},
                          ),
                          Container(
                            padding: EdgeInsets.all(r * 10),
                            child: Text("Sản phẩm không phải là thuốc...",
                                style: TextStyle(fontSize: r * 17)),
                          ),
                          const Divider(height: 0),
                          Container(
                            padding:
                                EdgeInsets.only(left: r * 16.0, right: r * 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 15,
                                      height: 15,
                                      child: SvgPicture.asset(SolidIcons.tags,
                                          color: Colors.blue),
                                    ),
                                    Separator(width: r * 5),
                                    Text('1,800,000 VNĐ/SP',
                                        style: TextStyle(
                                            fontSize: r * 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.blue)),
                                  ],
                                ),
                                ButtonTheme(
                                  minWidth: r * 50,
                                  height: r * 30,
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(r * 15)),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 0.0, horizontal: r * 10),
                                    child: Row(
                                      children: [
                                        Text('CHI TIẾT',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: r * 16)),
                                        Icon(Icons.arrow_forward_ios_sharp,
                                            size: 12, color: Colors.black54),
                                      ],
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  color: const Color.fromRGBO(250, 250, 250, 1.0),
                  padding:
                      EdgeInsets.symmetric(vertical: r * 6, horizontal: r * 12),
                  child: Center(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side:
                            const BorderSide(color: Colors.black12, width: 0.5),
                        borderRadius: BorderRadius.circular(r * 8),
                      ),
                      elevation: 0.0,
                      margin: const EdgeInsets.all(0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ListTile(
                            dense: true,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: r * 10),
                            visualDensity: const VisualDensity(
                                horizontal: -4, vertical: 0),
                            leading: IconButton(
                              icon: SizedBox(
                                width: r * 42,
                                height: r * 42,
                                child: SvgPicture.asset(LightIcons.grin,
                                    color: Colors.black54),
                              ),
                              tooltip: 'Vào trang riêng của Nguyen Van An',
                              padding: const EdgeInsets.all(0.0),
                              onPressed: () {},
                            ),
                            title: Text('Nguyen Van An',
                                style: TextStyle(
                                    fontSize: r * 17,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromRGBO(0, 0, 0, 0.7))),
                            subtitle: Text('Đăng bán mặt hàng mới.',
                                style: TextStyle(fontSize: r * 13)),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: r * 40,
                                  child: IconButton(
                                    icon: Icon(Icons.favorite_outline_outlined,
                                        size: r * 22),
                                    tooltip: 'Quan tâm',
                                    onPressed: () {},
                                  ),
                                ),
                                SizedBox(
                                  width: r * 40,
                                  child: IconButton(
                                    icon: Icon(Icons.more_vert, size: r * 22),
                                    tooltip: 'Tùy chọn',
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Image(
                                  image: AssetImage(
                                      'assets/images/ads/image001_korf.jpg')),
                            ),
                            onTap: () {},
                          ),
                          Container(
                            padding: EdgeInsets.all(r * 10),
                            child: Text("Sản phẩm không phải là thuốc...",
                                style: TextStyle(fontSize: r * 17)),
                          ),
                          const Divider(height: 0),
                          Container(
                            padding:
                                EdgeInsets.only(left: r * 16.0, right: r * 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 15,
                                      height: 15,
                                      child: SvgPicture.asset(SolidIcons.tags,
                                          color: Colors.blue),
                                    ),
                                    Separator(width: r * 5),
                                    Text('1,800,000 VNĐ/SP',
                                        style: TextStyle(
                                            fontSize: r * 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.blue)),
                                  ],
                                ),
                                ButtonTheme(
                                  minWidth: r * 50,
                                  height: r * 30,
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(r * 15)),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 0.0, horizontal: r * 10),
                                    child: Row(
                                      children: [
                                        Text('CHI TIẾT',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: r * 16)),
                                        Icon(Icons.arrow_forward_ios_sharp,
                                            size: 12, color: Colors.black54),
                                      ],
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  color: const Color.fromRGBO(250, 250, 250, 1.0),
                  padding:
                      EdgeInsets.symmetric(vertical: r * 6, horizontal: r * 12),
                  child: Center(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side:
                            const BorderSide(color: Colors.black12, width: 0.5),
                        borderRadius: BorderRadius.circular(r * 8),
                      ),
                      elevation: 0.0,
                      margin: const EdgeInsets.all(0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ListTile(
                            dense: true,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: r * 10),
                            visualDensity: const VisualDensity(
                                horizontal: -4, vertical: 0),
                            leading: IconButton(
                              icon: SizedBox(
                                width: r * 42,
                                height: r * 42,
                                child: SvgPicture.asset(LightIcons.grin,
                                    color: Colors.black54),
                              ),
                              tooltip: 'Vào trang riêng của Nguyen Van An',
                              padding: const EdgeInsets.all(0.0),
                              onPressed: () {},
                            ),
                            title: Text('Nguyen Van An',
                                style: TextStyle(
                                    fontSize: r * 17,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromRGBO(0, 0, 0, 0.7))),
                            subtitle: Text('Đăng bán mặt hàng mới.',
                                style: TextStyle(fontSize: r * 13)),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: r * 40,
                                  child: IconButton(
                                    icon: Icon(Icons.favorite_outline_outlined,
                                        size: r * 22),
                                    tooltip: 'Quan tâm',
                                    onPressed: () {},
                                  ),
                                ),
                                SizedBox(
                                  width: r * 40,
                                  child: IconButton(
                                    icon: Icon(Icons.more_vert, size: r * 22),
                                    tooltip: 'Tùy chọn',
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Image(
                                  image: AssetImage(
                                      'assets/images/ads/image001_korf.jpg')),
                            ),
                            onTap: () {},
                          ),
                          Container(
                            padding: EdgeInsets.all(r * 10),
                            child: Text("Sản phẩm không phải là thuốc...",
                                style: TextStyle(fontSize: r * 17)),
                          ),
                          const Divider(height: 0),
                          Container(
                            padding:
                                EdgeInsets.only(left: r * 16.0, right: r * 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 15,
                                      height: 15,
                                      child: SvgPicture.asset(SolidIcons.tags,
                                          color: Colors.blue),
                                    ),
                                    Separator(width: r * 5),
                                    Text('1,800,000 VNĐ/SP',
                                        style: TextStyle(
                                            fontSize: r * 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.blue)),
                                  ],
                                ),
                                ButtonTheme(
                                  minWidth: r * 50,
                                  height: r * 30,
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(r * 15)),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 0.0, horizontal: r * 10),
                                    child: Row(
                                      children: [
                                        Text('CHI TIẾT',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: r * 16)),
                                        Icon(Icons.arrow_forward_ios_sharp,
                                            size: 12, color: Colors.black54),
                                      ],
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  color: const Color.fromRGBO(250, 250, 250, 1.0),
                  padding:
                      EdgeInsets.symmetric(vertical: r * 6, horizontal: r * 12),
                  child: Center(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side:
                            const BorderSide(color: Colors.black12, width: 0.5),
                        borderRadius: BorderRadius.circular(r * 8),
                      ),
                      elevation: 0.0,
                      margin: const EdgeInsets.all(0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ListTile(
                            dense: true,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: r * 10),
                            visualDensity: const VisualDensity(
                                horizontal: -4, vertical: 0),
                            leading: IconButton(
                              icon: SizedBox(
                                width: r * 42,
                                height: r * 42,
                                child: SvgPicture.asset(LightIcons.grin,
                                    color: Colors.black54),
                              ),
                              tooltip: 'Vào trang riêng của Nguyen Van An',
                              padding: const EdgeInsets.all(0.0),
                              onPressed: () {},
                            ),
                            title: Text('Nguyen Van An',
                                style: TextStyle(
                                    fontSize: r * 17,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromRGBO(0, 0, 0, 0.7))),
                            subtitle: Text('Đăng bán mặt hàng mới.',
                                style: TextStyle(fontSize: r * 13)),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: r * 40,
                                  child: IconButton(
                                    icon: Icon(Icons.favorite_outline_outlined,
                                        size: r * 22),
                                    tooltip: 'Quan tâm',
                                    onPressed: () {},
                                  ),
                                ),
                                SizedBox(
                                  width: r * 40,
                                  child: IconButton(
                                    icon: Icon(Icons.more_vert, size: r * 22),
                                    tooltip: 'Tùy chọn',
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Image(
                                  image: AssetImage(
                                      'assets/images/ads/image001_korf.jpg')),
                            ),
                            onTap: () {},
                          ),
                          Container(
                            padding: EdgeInsets.all(r * 10),
                            child: Text("Sản phẩm không phải là thuốc...",
                                style: TextStyle(fontSize: r * 17)),
                          ),
                          const Divider(height: 0),
                          Container(
                            padding:
                                EdgeInsets.only(left: r * 16.0, right: r * 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 15,
                                      height: 15,
                                      child: SvgPicture.asset(SolidIcons.tags,
                                          color: Colors.blue),
                                    ),
                                    Separator(width: r * 5),
                                    Text('1,800,000 VNĐ/SP',
                                        style: TextStyle(
                                            fontSize: r * 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.blue)),
                                  ],
                                ),
                                ButtonTheme(
                                  minWidth: r * 50,
                                  height: r * 30,
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(r * 15)),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 0.0, horizontal: r * 10),
                                    child: Row(
                                      children: [
                                        Text('CHI TIẾT',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: r * 16)),
                                        Icon(Icons.arrow_forward_ios_sharp,
                                            size: 12, color: Colors.black54),
                                      ],
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  color: const Color.fromRGBO(250, 250, 250, 1.0),
                  padding:
                      EdgeInsets.symmetric(vertical: r * 6, horizontal: r * 12),
                  child: Center(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side:
                            const BorderSide(color: Colors.black12, width: 0.5),
                        borderRadius: BorderRadius.circular(r * 8),
                      ),
                      elevation: 0.0,
                      margin: const EdgeInsets.all(0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ListTile(
                            dense: true,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: r * 10),
                            visualDensity: const VisualDensity(
                                horizontal: -4, vertical: 0),
                            leading: IconButton(
                              icon: SizedBox(
                                width: r * 42,
                                height: r * 42,
                                child: SvgPicture.asset(LightIcons.grin,
                                    color: Colors.black54),
                              ),
                              tooltip: 'Vào trang riêng của Nguyen Van An',
                              padding: const EdgeInsets.all(0.0),
                              onPressed: () {},
                            ),
                            title: Text('Nguyen Van An',
                                style: TextStyle(
                                    fontSize: r * 17,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromRGBO(0, 0, 0, 0.7))),
                            subtitle: Text('Đăng bán mặt hàng mới.',
                                style: TextStyle(fontSize: r * 13)),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: r * 40,
                                  child: IconButton(
                                    icon: Icon(Icons.favorite_outline_outlined,
                                        size: r * 22),
                                    tooltip: 'Quan tâm',
                                    onPressed: () {},
                                  ),
                                ),
                                SizedBox(
                                  width: r * 40,
                                  child: IconButton(
                                    icon: Icon(Icons.more_vert, size: r * 22),
                                    tooltip: 'Tùy chọn',
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Image(
                                  image: AssetImage(
                                      'assets/images/ads/image001_korf.jpg')),
                            ),
                            onTap: () {},
                          ),
                          Container(
                            padding: EdgeInsets.all(r * 10),
                            child: Text("Sản phẩm không phải là thuốc...",
                                style: TextStyle(fontSize: r * 17)),
                          ),
                          const Divider(height: 0),
                          Container(
                            padding:
                                EdgeInsets.only(left: r * 16.0, right: r * 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 15,
                                      height: 15,
                                      child: SvgPicture.asset(SolidIcons.tags,
                                          color: Colors.blue),
                                    ),
                                    Separator(width: r * 5),
                                    Text('1,800,000 VNĐ/SP',
                                        style: TextStyle(
                                            fontSize: r * 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.blue)),
                                  ],
                                ),
                                ButtonTheme(
                                  minWidth: r * 50,
                                  height: r * 30,
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(r * 15)),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 0.0, horizontal: r * 10),
                                    child: Row(
                                      children: [
                                        Text('CHI TIẾT',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: r * 16)),
                                        Icon(Icons.arrow_forward_ios_sharp,
                                            size: 12, color: Colors.black54),
                                      ],
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  color: const Color.fromRGBO(250, 250, 250, 1.0),
                  padding:
                      EdgeInsets.symmetric(vertical: r * 6, horizontal: r * 12),
                  child: Center(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side:
                            const BorderSide(color: Colors.black12, width: 0.5),
                        borderRadius: BorderRadius.circular(r * 8),
                      ),
                      elevation: 0.0,
                      margin: const EdgeInsets.all(0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ListTile(
                            dense: true,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: r * 10),
                            visualDensity: const VisualDensity(
                                horizontal: -4, vertical: 0),
                            leading: IconButton(
                              icon: SizedBox(
                                width: r * 42,
                                height: r * 42,
                                child: SvgPicture.asset(LightIcons.grin,
                                    color: Colors.black54),
                              ),
                              tooltip: 'Vào trang riêng của Nguyen Van An',
                              padding: const EdgeInsets.all(0.0),
                              onPressed: () {},
                            ),
                            title: Text('Nguyen Van An',
                                style: TextStyle(
                                    fontSize: r * 17,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromRGBO(0, 0, 0, 0.7))),
                            subtitle: Text('Đăng bán mặt hàng mới.',
                                style: TextStyle(fontSize: r * 13)),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: r * 40,
                                  child: IconButton(
                                    icon: Icon(Icons.favorite_outline_outlined,
                                        size: r * 22),
                                    tooltip: 'Quan tâm',
                                    onPressed: () {},
                                  ),
                                ),
                                SizedBox(
                                  width: r * 40,
                                  child: IconButton(
                                    icon: Icon(Icons.more_vert, size: r * 22),
                                    tooltip: 'Tùy chọn',
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Image(
                                  image: AssetImage(
                                      'assets/images/ads/image001_korf.jpg')),
                            ),
                            onTap: () {},
                          ),
                          Container(
                            padding: EdgeInsets.all(r * 10),
                            child: Text("Sản phẩm không phải là thuốc...",
                                style: TextStyle(fontSize: r * 17)),
                          ),
                          const Divider(height: 0),
                          Container(
                            padding:
                                EdgeInsets.only(left: r * 16.0, right: r * 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 15,
                                      height: 15,
                                      child: SvgPicture.asset(SolidIcons.tags,
                                          color: Colors.blue),
                                    ),
                                    Separator(width: r * 5),
                                    Text('1,800,000 VNĐ/SP',
                                        style: TextStyle(
                                            fontSize: r * 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.blue)),
                                  ],
                                ),
                                ButtonTheme(
                                  minWidth: r * 50,
                                  height: r * 30,
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(r * 15)),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 0.0, horizontal: r * 10),
                                    child: Row(
                                      children: [
                                        Text('CHI TIẾT',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: r * 16)),
                                        Icon(Icons.arrow_forward_ios_sharp,
                                            size: 12, color: Colors.black54),
                                      ],
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  color: const Color.fromRGBO(250, 250, 250, 1.0),
                  padding:
                      EdgeInsets.symmetric(vertical: r * 6, horizontal: r * 12),
                  child: Center(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side:
                            const BorderSide(color: Colors.black12, width: 0.5),
                        borderRadius: BorderRadius.circular(r * 8),
                      ),
                      elevation: 0.0,
                      margin: const EdgeInsets.all(0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ListTile(
                            dense: true,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: r * 10),
                            visualDensity: const VisualDensity(
                                horizontal: -4, vertical: 0),
                            leading: IconButton(
                              icon: SizedBox(
                                width: r * 42,
                                height: r * 42,
                                child: SvgPicture.asset(LightIcons.grin,
                                    color: Colors.black54),
                              ),
                              tooltip: 'Vào trang riêng của Nguyen Van An',
                              padding: const EdgeInsets.all(0.0),
                              onPressed: () {},
                            ),
                            title: Text('Nguyen Van An',
                                style: TextStyle(
                                    fontSize: r * 17,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromRGBO(0, 0, 0, 0.7))),
                            subtitle: Text('Đăng bán mặt hàng mới.',
                                style: TextStyle(fontSize: r * 13)),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: r * 40,
                                  child: IconButton(
                                    icon: Icon(Icons.favorite_outline_outlined,
                                        size: r * 22),
                                    tooltip: 'Quan tâm',
                                    onPressed: () {},
                                  ),
                                ),
                                SizedBox(
                                  width: r * 40,
                                  child: IconButton(
                                    icon: Icon(Icons.more_vert, size: r * 22),
                                    tooltip: 'Tùy chọn',
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Image(
                                  image: AssetImage(
                                      'assets/images/ads/image001_korf.jpg')),
                            ),
                            onTap: () {},
                          ),
                          Container(
                            padding: EdgeInsets.all(r * 10),
                            child: Text("Sản phẩm không phải là thuốc...",
                                style: TextStyle(fontSize: r * 17)),
                          ),
                          const Divider(height: 0),
                          Container(
                            padding:
                                EdgeInsets.only(left: r * 16.0, right: r * 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 15,
                                      height: 15,
                                      child: SvgPicture.asset(SolidIcons.tags,
                                          color: Colors.blue),
                                    ),
                                    Separator(width: r * 5),
                                    Text('1,800,000 VNĐ/SP',
                                        style: TextStyle(
                                            fontSize: r * 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.blue)),
                                  ],
                                ),
                                ButtonTheme(
                                  minWidth: r * 50,
                                  height: r * 30,
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(r * 15)),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 0.0, horizontal: r * 10),
                                    child: Row(
                                      children: [
                                        Text('CHI TIẾT',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: r * 16)),
                                        Icon(Icons.arrow_forward_ios_sharp,
                                            size: 12, color: Colors.black54),
                                      ],
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  color: const Color.fromRGBO(250, 250, 250, 1.0),
                  padding:
                      EdgeInsets.symmetric(vertical: r * 6, horizontal: r * 12),
                  child: Center(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side:
                            const BorderSide(color: Colors.black12, width: 0.5),
                        borderRadius: BorderRadius.circular(r * 8),
                      ),
                      elevation: 0.0,
                      margin: const EdgeInsets.all(0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ListTile(
                            dense: true,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: r * 10),
                            visualDensity: const VisualDensity(
                                horizontal: -4, vertical: 0),
                            leading: IconButton(
                              icon: SizedBox(
                                width: r * 42,
                                height: r * 42,
                                child: SvgPicture.asset(LightIcons.grin,
                                    color: Colors.black54),
                              ),
                              tooltip: 'Vào trang riêng của Nguyen Van An',
                              padding: const EdgeInsets.all(0.0),
                              onPressed: () {},
                            ),
                            title: Text('Nguyen Van An',
                                style: TextStyle(
                                    fontSize: r * 17,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromRGBO(0, 0, 0, 0.7))),
                            subtitle: Text('Đăng bán mặt hàng mới.',
                                style: TextStyle(fontSize: r * 13)),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: r * 40,
                                  child: IconButton(
                                    icon: Icon(Icons.favorite_outline_outlined,
                                        size: r * 22),
                                    tooltip: 'Quan tâm',
                                    onPressed: () {},
                                  ),
                                ),
                                SizedBox(
                                  width: r * 40,
                                  child: IconButton(
                                    icon: Icon(Icons.more_vert, size: r * 22),
                                    tooltip: 'Tùy chọn',
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Image(
                                  image: AssetImage(
                                      'assets/images/ads/image001_korf.jpg')),
                            ),
                            onTap: () {},
                          ),
                          Container(
                            padding: EdgeInsets.all(r * 10),
                            child: Text("Sản phẩm không phải là thuốc...",
                                style: TextStyle(fontSize: r * 17)),
                          ),
                          const Divider(height: 0),
                          Container(
                            padding:
                                EdgeInsets.only(left: r * 16.0, right: r * 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 15,
                                      height: 15,
                                      child: SvgPicture.asset(SolidIcons.tags,
                                          color: Colors.blue),
                                    ),
                                    Separator(width: r * 5),
                                    Text('1,800,000 VNĐ/SP',
                                        style: TextStyle(
                                            fontSize: r * 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.blue)),
                                  ],
                                ),
                                ButtonTheme(
                                  minWidth: r * 50,
                                  height: r * 30,
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(r * 15)),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 0.0, horizontal: r * 10),
                                    child: Row(
                                      children: [
                                        Text('CHI TIẾT',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: r * 16)),
                                        Icon(Icons.arrow_forward_ios_sharp,
                                            size: 12, color: Colors.black54),
                                      ],
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  color: const Color.fromRGBO(250, 250, 250, 1.0),
                  padding:
                      EdgeInsets.symmetric(vertical: r * 6, horizontal: r * 12),
                  child: Center(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side:
                            const BorderSide(color: Colors.black12, width: 0.5),
                        borderRadius: BorderRadius.circular(r * 8),
                      ),
                      elevation: 0.0,
                      margin: const EdgeInsets.all(0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ListTile(
                            dense: true,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: r * 10),
                            visualDensity: const VisualDensity(
                                horizontal: -4, vertical: 0),
                            leading: IconButton(
                              icon: SizedBox(
                                width: r * 42,
                                height: r * 42,
                                child: SvgPicture.asset(LightIcons.grinHearts,
                                    color: Colors.pinkAccent),
                              ),
                              tooltip: 'Vào trang riêng của Trần Thanh Hương',
                              padding: const EdgeInsets.all(0.0),
                              onPressed: () {},
                            ),
                            title: Text('Trần Thanh Hương',
                                style: TextStyle(
                                    fontSize: r * 17,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromRGBO(0, 0, 0, 0.7))),
                            subtitle: Text('Đăng đánh giá mới.',
                                style: TextStyle(fontSize: r * 13)),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: r * 40,
                                  child: IconButton(
                                    icon: Icon(Icons.favorite_outline_outlined,
                                        size: r * 22),
                                    tooltip: 'Quan tâm',
                                    onPressed: () {},
                                  ),
                                ),
                                SizedBox(
                                  width: r * 40,
                                  child: IconButton(
                                    icon: Icon(Icons.more_vert, size: r * 22),
                                    tooltip: 'Tùy chọn',
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Image(
                                  image: AssetImage(
                                      'assets/images/ads/muongthanh.jpg')),
                            ),
                            onTap: () {},
                          ),
                          Container(
                            padding: EdgeInsets.all(r * 10),
                            child: Text(
                                "Đánh giá 4.5 sao cho khách sạn Mường Thanh - Tây Hồ",
                                style: TextStyle(fontSize: r * 17)),
                          ),
                          const Divider(height: 0),
                          Container(
                            padding:
                                EdgeInsets.only(left: r * 16, right: r * 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                // Row(
                                //   children: [
                                //     SizedBox(
                                //       width: 15,
                                //       height: 15,
                                //       child: SvgPicture.asset(SolidIcons.tags, color: Colors.blue),
                                //     ),
                                //     Separator(width: r * 5),
                                //     Text('5,000,000 VNĐ/SP', style: TextStyle(fontSize: r * 16, fontWeight: FontWeight.w600, color: Colors.blue)),
                                //   ],
                                // ),
                                Row(children: <Widget>[
                                  Icon(Icons.star_rounded,
                                      size: r * 20, color: Colors.yellow),
                                  Icon(Icons.star_rounded,
                                      size: r * 20, color: Colors.yellow),
                                  Icon(Icons.star_rounded,
                                      size: r * 20, color: Colors.yellow),
                                  Icon(Icons.star_rounded,
                                      size: r * 20, color: Colors.yellow),
                                  Icon(Icons.star_half_rounded,
                                      size: r * 20, color: Colors.yellow)
                                ]),
                                ButtonTheme(
                                  minWidth: r * 50,
                                  height: r * 30,
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(r * 15)),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 0.0, horizontal: r * 10),
                                    child: Row(
                                      children: [
                                        Text('CHI TIẾT',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: r * 16)),
                                        Icon(Icons.arrow_forward_ios_sharp,
                                            size: 12, color: Colors.black54),
                                      ],
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  color: const Color.fromRGBO(250, 250, 250, 1.0),
                  padding:
                      EdgeInsets.symmetric(vertical: r * 6, horizontal: r * 12),
                  child: Center(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side:
                            const BorderSide(color: Colors.black12, width: 0.5),
                        borderRadius: BorderRadius.circular(r * 8),
                      ),
                      elevation: 0.0,
                      margin: const EdgeInsets.all(0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ListTile(
                            dense: true,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: r * 10),
                            visualDensity: const VisualDensity(
                                horizontal: -4, vertical: 0),
                            leading: IconButton(
                              icon: SizedBox(
                                width: r * 42,
                                height: r * 42,
                                child: SvgPicture.asset(LightIcons.grinTongue,
                                    color: Colors.orangeAccent),
                              ),
                              tooltip: 'Vào trang riêng của Lê Nguyễn Hoài Thu',
                              padding: const EdgeInsets.all(0.0),
                              onPressed: () {},
                            ),
                            title: Text('Lê Nguyễn Hoài Thu',
                                style: TextStyle(
                                    fontSize: r * 17,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromRGBO(0, 0, 0, 0.7))),
                            subtitle: Text('Đăng tìm mua sản phẩm.',
                                style: TextStyle(fontSize: r * 13)),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: r * 40,
                                  child: IconButton(
                                    icon: Icon(Icons.favorite_outline_outlined,
                                        size: r * 22.0),
                                    tooltip: 'Quan tâm',
                                    onPressed: () {},
                                  ),
                                ),
                                SizedBox(
                                  width: r * 40,
                                  child: IconButton(
                                    icon: Icon(Icons.more_vert, size: r * 22.0),
                                    tooltip: 'Tùy chọn',
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // InkWell(
                          //   child: Container(
                          //     width: MediaQuery.of(context).size.width,
                          //     child: Image(image: AssetImage('assets/images/ads/maylocnuoc.jpg')),
                          //   ),
                          //   onTap: () {},
                          // ),
                          Container(
                            padding: EdgeInsets.all(r * 10),
                            child: Text("Tìm mua tai nghe không dây",
                                style: TextStyle(fontSize: r * 17)),
                          ),
                          const Divider(height: 0),
                          Container(
                            padding:
                                EdgeInsets.only(left: r * 16, right: r * 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 15,
                                      height: 15,
                                      child: SvgPicture.asset(SolidIcons.tags,
                                          color: Colors.blue),
                                    ),
                                    Separator(width: r * 5),
                                    Text('5,000,000 VNĐ/SP',
                                        style: TextStyle(
                                            fontSize: r * 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.blue)),
                                  ],
                                ),
                                ButtonTheme(
                                  minWidth: r * 50,
                                  height: r * 30,
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(r * 15)),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 0.0, horizontal: r * 10),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 10,
                                          height: 10,
                                          child: SvgPicture.asset(
                                              RegularIcons.link,
                                              color: Colors.black54),
                                        ),
                                        Separator(width: r * 5),
                                        Text('GIỚI THIỆU',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: r * 16)),
                                      ],
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  color: const Color.fromRGBO(250, 250, 250, 1.0),
                  padding:
                      EdgeInsets.symmetric(vertical: r * 6, horizontal: r * 12),
                  child: Center(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side:
                            const BorderSide(color: Colors.black12, width: 0.5),
                        borderRadius: BorderRadius.circular(r * 8),
                      ),
                      elevation: 0.0,
                      margin: const EdgeInsets.all(0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ListTile(
                            dense: true,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: r * 10),
                            visualDensity: const VisualDensity(
                                horizontal: -4, vertical: 0),
                            leading: IconButton(
                              icon: SizedBox(
                                width: r * 42,
                                height: r * 42,
                                child: SvgPicture.asset(
                                    LightIcons.grinTongueWink,
                                    color: Colors.blueAccent),
                              ),
                              tooltip: 'Vào trang riêng của Phạm Hòa Trung',
                              padding: const EdgeInsets.all(0.0),
                              onPressed: () {},
                            ),
                            title: Text('Phạm Hòa Trung',
                                style: TextStyle(
                                    fontSize: r * 17,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromRGBO(0, 0, 0, 0.7))),
                            subtitle: Text('Đăng bán mặt hàng mới.',
                                style: TextStyle(fontSize: r * 13)),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: r * 40,
                                  child: IconButton(
                                    icon: Icon(Icons.favorite_outline_outlined,
                                        size: r * 22),
                                    tooltip: 'Quan tâm',
                                    onPressed: () {},
                                  ),
                                ),
                                SizedBox(
                                  width: r * 40,
                                  child: IconButton(
                                    icon: Icon(Icons.more_vert, size: r * 22),
                                    tooltip: 'Tùy chọn',
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            child: Container(
                              width: media.width,
                              child: Image(
                                  image: AssetImage(
                                      'assets/images/ads/sanpham.jpg')),
                            ),
                            onTap: () {},
                          ),
                          Container(
                            padding: EdgeInsets.all(r * 10),
                            child: Text(
                              "Giá sách gỗ với thiết kế trẻ chung, hiện đại nhiều màu sắc là sự kết hợp tinh tế của nhiều vật liệu như gỗ sồi tự nhiên, gỗ công nghiệp...",
                              style: TextStyle(fontSize: r * 17),
                            ),
                          ),
                          const Divider(height: 0),
                          Container(
                            padding:
                                EdgeInsets.only(left: r * 16, right: r * 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 15,
                                      height: 15,
                                      child: SvgPicture.asset(SolidIcons.tags,
                                          color: Colors.blue),
                                    ),
                                    Separator(width: r * 5),
                                    Text('2,200,000 VNĐ/SP',
                                        style: TextStyle(
                                            fontSize: r * 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.blue)),
                                  ],
                                ),
                                ButtonTheme(
                                  minWidth: r * 50,
                                  height: r * 30,
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(r * 15)),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 0.0, horizontal: r * 10),
                                    child: Row(
                                      children: [
                                        Text('CHI TIẾT',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: r * 16)),
                                        const Icon(
                                            Icons.arrow_forward_ios_sharp,
                                            size: 12.0,
                                            color: Colors.black54),
                                      ],
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  color: const Color.fromRGBO(250, 250, 250, 1.0),
                  padding:
                      EdgeInsets.symmetric(vertical: r * 6, horizontal: r * 12),
                  child: Center(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side:
                            const BorderSide(color: Colors.black12, width: 0.5),
                        borderRadius: BorderRadius.circular(r * 8),
                      ),
                      elevation: 0.0,
                      margin: const EdgeInsets.all(0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ListTile(
                            dense: true,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: r * 10),
                            visualDensity: const VisualDensity(
                                horizontal: -4, vertical: 0),
                            leading: IconButton(
                              icon: SizedBox(
                                width: r * 42,
                                height: r * 42,
                                child: SvgPicture.asset(LightIcons.grinBeam,
                                    color: Colors.black45),
                              ),
                              tooltip: 'Vào trang riêng của Tuấn Nguyễn',
                              padding: const EdgeInsets.all(0.0),
                              onPressed: () {},
                            ),
                            title: Text('Tuấn Nguyễn',
                                style: TextStyle(
                                    fontSize: r * 17,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromRGBO(0, 0, 0, 0.7))),
                            subtitle: Text('Đăng tìm mua sản phẩm.',
                                style: TextStyle(fontSize: r * 13)),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: r * 40,
                                  child: IconButton(
                                    icon: Icon(Icons.favorite_outline_outlined,
                                        size: r * 22),
                                    tooltip: 'Quan tâm',
                                    onPressed: () {},
                                  ),
                                ),
                                SizedBox(
                                  width: r * 40,
                                  child: IconButton(
                                    icon: Icon(Icons.more_vert, size: r * 22),
                                    tooltip: 'Tùy chọn',
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Image(
                                  image: AssetImage(
                                      'assets/images/ads/maylocnuoc.jpg')),
                            ),
                            onTap: () {},
                          ),
                          Container(
                            padding: EdgeInsets.all(r * 10),
                            child: Text(
                              "Mình đang tìm mua máy lọc nước Goodlive bản pro",
                              style: TextStyle(fontSize: r * 17),
                            ),
                          ),
                          const Divider(height: 0),
                          Container(
                            padding:
                                EdgeInsets.only(left: r * 16, right: r * 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 15,
                                      height: 15,
                                      child: SvgPicture.asset(SolidIcons.tags,
                                          color: Colors.blue),
                                    ),
                                    Separator(width: r * 5),
                                    Text('10,000,000 VNĐ/SP',
                                        style: TextStyle(
                                            fontSize: r * 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.blue)),
                                  ],
                                ),
                                ButtonTheme(
                                  minWidth: r * 50,
                                  height: r * 30,
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(r * 15)),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 0.0, horizontal: r * 10),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 10,
                                          height: 10,
                                          child: SvgPicture.asset(
                                              RegularIcons.link,
                                              color: Colors.black54),
                                        ),
                                        Separator(width: r * 5),
                                        Text('GIỚI THIỆU',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: r * 16)),
                                      ],
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          //Loading
          Container(
            padding: EdgeInsets.only(bottom: r * 20),
            color: const Color.fromRGBO(250, 250, 250, 1.0),
            child: Center(child: wi.WaitingIndicator()),
          )
        ],
      ),
    );
  }
}
