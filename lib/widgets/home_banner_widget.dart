import 'package:flutter/material.dart';
import 'package:flutter_yyts/models/ad_info.dart';
import 'package:flutter_yyts/pages/home_page.dart';

class HomeBannerView extends StatefulWidget {
  final List<AdVo> ads;

  const HomeBannerView({Key key, this.ads}) : super(key: key);

  @override
  _HomeBannerViewState createState() {
    return _HomeBannerViewState();
  }
}

class _HomeBannerViewState extends State<HomeBannerView> {
  int sliderIndex = 0;
  bool running = false;
  PageController controller;

  @override
  void initState() {
    controller = new PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Card(
          margin: EdgeInsets.zero,
          elevation: 0,
          child: AspectRatio(
            aspectRatio: 9.0 / 5.0,
            child: PageView(
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  sliderIndex = index;
                });
              },
              children: widget.ads
                  .map((ad) => GestureDetector(
                        onTap: () {
                          final id = Uri.parse(ad.click).queryParameters["id"];
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomePage()));
                        },
                        child: Image(
                          image: NetworkImage(
                            ad.pic ??
                                "http://renren2.maoyun.tv/apptu/1554741804331_7765.jpg",
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
//          child: SliderIndicator(),
        )
      ],
    );
  }
}
