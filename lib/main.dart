import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:tekotest/services/api.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tekotest/shared/Text.dart';
import 'package:tekotest/util/util.dart';
import 'package:tekotest/widgets/SectionWid.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  dynamic product;
  dynamic prices;
  List<dynamic> images = [];
  List<String> colors = ["Green", "Blue", "Yellow", "Pink", "Black"];
  String pickedColr = "Black";
  List<String> roms = ["128GB", "256GB", "512GB"];
  String pickedRom = "128GB";

  bool isExpanded = false;
  @override
  void initState() {
    super.initState();
    getProduct().then((res) {
      setState(() {
        product = res['result']['product'];
        prices = res['result']['product']['prices'][0];
        images = res['result']['product']['productDetail']['images'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.white),
      home: Scaffold(
        body: SafeArea(
            child: ColoredBox(
          color: Colors.white,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Container(
              padding: const EdgeInsets.all(15),
              color: Colors.white,
              alignment: Alignment.center,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    size: 25,
                  ),
                  Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(Icons.shopping_cart, size: 25)),
                      Icon(Icons.more_horiz, size: 25)
                    ],
                  )
                ],
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Container(
                // padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: CarouselSlider(
                        items: images.map((img) {
                          return Builder(builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              child: Image.network(
                                img['url'],
                                fit: BoxFit.contain,
                              ),
                            );
                          });
                        }).toList(),
                        options: CarouselOptions(
                          height: 300.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextGray("MÀU SẮC ${pickedColr.toUpperCase()}"),
                          WrapList(colors, (c) {
                            setState(() {
                              pickedColr = c;
                            });
                          }, pickedColr),
                          TextGray("DUNG LƯỢNG ROM ${pickedRom.toUpperCase()}"),
                          WrapList(roms, (c) {
                            setState(() {
                              pickedRom = c;
                            });
                          }, pickedRom),
                          TextName(),
                          TextPrice(),
                          TextDiscount(),
                          DescriptionWid(product?['productDetail']
                                  ['shortDescription'] ??
                              "<div></div>"),
                          TextSection("Chi tiết sản phẩm"),
                        ],
                      ),
                    ),
                    SectionWidget(
                      attGr:
                          product?['productDetail']['attributeGroups'][0] ?? {},
                    ),
                    SectionWidget(
                      attGr:
                          product?['productDetail']['attributeGroups'][1] ?? {},
                      color: const Color.fromARGB(255, 241, 241, 241),
                    ),
                    SectionWidget(
                      attGr:
                          product?['productDetail']['attributeGroups'][2] ?? {},
                    ),
                    SectionWidget(
                      attGr:
                          product?['productDetail']['attributeGroups'][3] ?? {},
                      color: const Color.fromARGB(255, 241, 241, 241),
                    ),
                    SectionWidget(
                      attGr:
                          product?['productDetail']['attributeGroups'][4] ?? {},
                    ),
                    SectionWidget(
                      attGr:
                          product?['productDetail']['attributeGroups'][5] ?? {},
                      color: const Color.fromARGB(255, 241, 241, 241),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              isExpanded
                                  ? 'Thu gọn nội dung'
                                  : 'Xem thêm nội dung',
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                            Icon(
                              isExpanded
                                  ? Icons.arrow_drop_up
                                  : Icons.arrow_drop_down,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      height: isExpanded ? 500.0 : 0.0,
                      child: isExpanded
                          ? Column(
                              children: [
                                SectionWidget(
                                  attGr: product?['productDetail']
                                          ['attributeGroups'][6] ??
                                      {},
                                ),
                                SectionWidget(
                                  attGr: product?['productDetail']
                                          ['attributeGroups'][7] ??
                                      {},
                                  color:
                                      const Color.fromARGB(255, 241, 241, 241),
                                ),
                                SectionWidget(
                                  attGr: product?['productDetail']
                                          ['attributeGroups'][8] ??
                                      {},
                                ),
                                SectionWidget(
                                  attGr: product?['productDetail']
                                          ['attributeGroups'][9] ??
                                      {},
                                  color:
                                      const Color.fromARGB(255, 241, 241, 241),
                                ),
                                SectionWidget(
                                  attGr: product?['productDetail']
                                          ['attributeGroups'][10] ??
                                      {},
                                ),
                                SectionWidget(
                                  attGr: product?['productDetail']
                                          ['attributeGroups'][11] ??
                                      {},
                                  color:
                                      const Color.fromARGB(255, 241, 241, 241),
                                ),
                                SectionWidget(
                                  attGr: product?['productDetail']
                                          ['attributeGroups'][12] ??
                                      {},
                                ),
                                SectionWidget(
                                  attGr: product?['productDetail']
                                          ['attributeGroups'][13] ??
                                      {},
                                  color:
                                      const Color.fromARGB(255, 241, 241, 241),
                                ),
                                SectionWidget(
                                  attGr: product?['productDetail']
                                          ['attributeGroups'][14] ??
                                      {},
                                ),
                              ],
                            )
                          : Container(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextSection("Mô tả sản phẩm"),
                          DescriptionWid(product?['productDetail']
                                  ['description'] ??
                              "<div></div>"),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )),
            Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.white,
              alignment: Alignment.center,
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  color: const Color.fromARGB(255, 0, 56, 197),
                  width: double.infinity,
                  child: const Center(
                    child: Text(
                      "Liên hệ",
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
            ),
          ]),
        )),
      ),
    );
  }

  Padding DescriptionWid(String htmldes) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: HtmlWidget('''$htmldes'''),
    );
  }

  Wrap TextDiscount() {
    return Wrap(
      children: [
        Text(
          formatCurrency(prices?['sellPrice'] ?? "0"),
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
              decoration: TextDecoration.lineThrough),
        ),
        Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text("-${prices?['discountPercent'].toString() ?? "0"}%",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 32, 0, 177))))
      ],
    );
  }

  Text TextPrice() {
    return Text(formatCurrency(prices?['latestPrice'] ?? "0"),
        style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color.fromARGB(255, 32, 0, 177)));
  }

  Container TextName() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        product?['productInfo']['name'] ?? "",
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }

  Wrap WrapList(List<String> list, Function onTap, String picked) {
    return Wrap(
      children: list.map((c) {
        return InkWell(
          onTap: () {
            onTap(c);
          },
          child: Container(
            margin: const EdgeInsets.only(right: 10, bottom: 12),
            decoration: BoxDecoration(
                border: Border.all(
                    width: 2,
                    color: picked == c
                        ? Colors.blue
                        : const Color.fromARGB(255, 196, 196, 196))),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
            child: Text(
              c,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  color: picked == c ? Colors.blue : Colors.black),
            ),
          ),
        );
      }).toList(),
    );
  }
}
