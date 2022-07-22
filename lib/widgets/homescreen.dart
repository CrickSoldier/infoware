import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
        bottomNavigationBar: Container(
          height: 50,
          decoration: const BoxDecoration(
            color: Colors.white,
            // borderRadius: const BorderRadius.only(
            //   topLeft: Radius.circular(20),
            //   topRight: Radius.circular(20),
            // ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {},
                icon: const Icon(
                  Icons.home,
                  color: Color.fromARGB(255, 13, 71, 161),
                  size: 24,
                ),
              ),
              IconButton(
                enableFeedback: false,
                onPressed: () {},
                icon: Icon(
                  Icons.pie_chart_outline_rounded,
                  color: Colors.black.withOpacity(.5),
                  size: 24,
                ),
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.green.shade600,
                child: IconButton(
                  enableFeedback: false,
                  onPressed: () {},
                  color: Colors.white,
                  icon: const Icon(
                    Icons.data_saver_on_rounded,
                    // color: Colors.black,
                    size: 24,
                  ),
                ),
              ),
              IconButton(
                enableFeedback: false,
                onPressed: () {},
                icon: Icon(
                  Icons.poll_outlined,
                  color: Colors.black.withOpacity(.5),
                  size: 24,
                ),
              ),
              IconButton(
                enableFeedback: false,
                onPressed: () {},
                icon: Icon(
                  Icons.account_circle_outlined,
                  color: Colors.black.withOpacity(.5),
                  size: 24,
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const AppBar(),
                const SizedBox(
                  height: 30,
                ),
                MainSection(screen: screen),
                const SizedBox(
                  height: 30,
                ),
                const WatchListDivider(),
                const SizedBox(
                  height: 20,
                ),
                WatchListScroll(screen: screen),
                const SizedBox(
                  height: 25,
                ),
                const StockActivityDivider(),
                const SizedBox(
                  height: 20,
                ),
                const StockSection(),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ));
  }
}

class StockSection extends StatelessWidget {
  const StockSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Icons.abc),
            const SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Text(
                  "NVDA",
                  style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Nvidia",
                  style: GoogleFonts.roboto(
                      color: Colors.black.withOpacity(.5), fontSize: 10),
                )
              ],
            ),
          ],
        ),
        Column(
          children: [
            Text(
              "25.94",
              style: GoogleFonts.roboto(color: Colors.green),
            ),
            Text(
              "↑0.14%",
              style: GoogleFonts.roboto(color: Colors.green, fontSize: 10),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              "\$227.26",
              style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
            ),
            Text(
              "10 Shares",
              style: GoogleFonts.roboto(
                  color: Colors.black.withOpacity(.5), fontSize: 10),
            ),
          ],
        )
      ],
    );
  }
}

class StockActivityDivider extends StatelessWidget {
  const StockActivityDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        "Stocks Activity",
        style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
      ),
    );
  }
}

class WatchListScroll extends StatelessWidget {
  const WatchListScroll({
    Key? key,
    required this.screen,
  }) : super(key: key);

  final Size screen;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          WatchList(
            screen: screen,
            name: "ABD",
            subname: "Adobe",
            price: "33.49",
            value: "643.58",
            trend: "5.49%",
          ),
          WatchList(
            screen: screen,
            name: "TSLA",
            subname: "Tesla",
            price: "25.68",
            value: "909.68",
            trend: "8.08%",
          ),
        ],
      ),
    );
  }
}

class WatchListDivider extends StatelessWidget {
  const WatchListDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Watchlist",
          style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
        ),
        Text(
          "See All",
          style: GoogleFonts.roboto(
              color: Colors.green, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class MainSection extends StatelessWidget {
  const MainSection({
    Key? key,
    required this.screen,
  }) : super(key: key);

  final Size screen;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: screen.height * .35,
          width: double.infinity,
        ),
        Positioned(
          bottom: 30,
          child: Transform.rotate(
            angle: 3 * math.pi / 180,
            child: Container(
              height: screen.height * .20,
              width: screen.width * 0.9,
              // padding: EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(50)),
            ),
          ),
        ),
        Container(
          height: screen.height * .29,
          // margin: EdgeInsets.all(5),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.blue.shade900,
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Portfolio value",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: const [
                    Text(
                      "\$15,136.32",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '2.11%↑',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.green,
                        fontFeatures: [FontFeature.superscripts()],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 7, horizontal: 13),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(5)),
                        child: const Text(
                          "Deposit",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () => {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 7, horizontal: 13),
                        decoration: BoxDecoration(
                            // color: Colors.green,
                            border: Border.all(color: Colors.green),
                            borderRadius: BorderRadius.circular(5)),
                        child: const Text(
                          "Withdraw",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 25,
          right: 30,
          child: Container(
            height: screen.height * .29,
            width: 60,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(Icons.apple),
                const Icon(Icons.abc),
                const Icon(Icons.account_balance_rounded),
                Icon(
                  Icons.arrow_drop_down_rounded,
                  color: Colors.black.withOpacity(.5),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(Icons.abc),
            const SizedBox(
              width: 10,
            ),
            Text("Alex Julia",
                style: GoogleFonts.roboto(
                    color: Colors.black, fontWeight: FontWeight.bold))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Icon(Icons.search),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.notifications_none_rounded)
          ],
        )
      ],
    );
  }
}

class WatchList extends StatelessWidget {
  const WatchList({
    Key? key,
    required this.screen,
    required this.name,
    required this.subname,
    required this.price,
    required this.value,
    required this.trend,
  }) : super(key: key);

  final Size screen;
  final String name, subname, price, value, trend;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: screen.width * .5,
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Icon(Icons.abc),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(subname,
                          style: GoogleFonts.roboto(
                              fontSize: 8,
                              color: Colors.black.withOpacity(.5))),
                    ],
                  ),
                ],
              ),
              Text("↑$trend",
                  style: GoogleFonts.roboto(color: Colors.green, fontSize: 12)),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    price,
                    style: GoogleFonts.roboto(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "\$$value",
                    style: GoogleFonts.roboto(
                        fontSize: 12, color: Colors.black.withOpacity(.5)),
                  ),
                ],
              ),
              const Icon(
                Icons.show_chart_rounded,
                size: 36,
              )
            ],
          )
        ]),
      ),
    );
  }
}
