import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsletterSeeker extends StatelessWidget {
  NewsletterSeeker({super.key});
  List newImages = [
    "assets/news/Image_1.jpg",
    "assets/news/Image_2.jpg",
    "assets/news/Image_3.jpg",
    "assets/news/Image_4.jpg",
    "assets/news/Image_5.jpg",
  ];
  List titles = [
    "1. Touchless Fixtures Are Growing in Popularity",
    "2. Smart Toilets Are Set To Flourish",
    "3. The Demand for Smart Water-Leak Sensors Will Surge",
    "4. Smart Irrigation Is Gaining Momentum",
    "5. Rising Customer Awareness on Greywater Plumbing",
  ];
  List info = [
    "The latest advancements in the plumbing industry are offering benefits like convenience, control,  Read More...",
    "Smart toilets are equipped with several functions like automatic flushing, overflow protection,  Read more...",
    "Whether it’s due to faulty pipes, a leaky washing machine, or water heater issues, leaks can,  Read more...",
    "In the year 2021, one of the key developments in the agricultural plumbing domain has been the, Read more...",
    "Greywater (wastewater from laundry, kitchen, and bathing) accounts for 75% of the wastewater, Read more...",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 100,
              width: double.infinity,
              child: Center(
                child: Text(
                  'News',
                  style: GoogleFonts.tinos(
                      fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 100),
                            child: Container(
                              alignment: Alignment.center,
                              height: 80,
                              width: 150,
                              child: Image.asset(
                                newImages[index].toString(),
                                width: 150,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              SizedBox(
                                // height: 100,
                                width: 180,
                                child: Text(
                                  titles[index],
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.tinos(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                // height: 100,
                                width: 180,
                                child: Text(
                                  info[index],
                                  style: GoogleFonts.tinos(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}