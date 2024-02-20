//code without refactored


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.teal[500],
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal, // Set the default button color
          ),
        ),

        //textTheme
        textTheme:
            GoogleFonts.latoTextTheme(Theme.of(context).textTheme).copyWith(
          // Use Google Fonts for your text styles
          displayLarge: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          bodyLarge: const TextStyle(
            fontSize: 16.0,
            color: Colors.white,
          ),
          // Add more text styles as needed
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final List<Tab> _tabs = [
    const Tab(text: 'Residential'),
    const Tab(text: 'Commercial'),
    const Tab(text: 'Lease'),
    const Tab(text: 'Plot'),
  ];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the TabController
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double ScreenWidth = MediaQuery.of(context).size.width * 0.9;
    return DefaultTabController(
      length: _tabs.length,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.message,
                ),
                onPressed: () {
                  // Handle heart icon press
                },
              ),
            ],
            centerTitle: true,
            title: Text(
              'EazyRenter',
              style: GoogleFonts.quicksand(),
              // style: TextStyle(
              //   // color: Colors.white,
              //   // fontWeight: FontWeight.bold,

              //   fontSize: 19,
              // ),
            ),
          ),
          drawer: const Drawer(),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: 190.0,
                  height: 80.0,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 30, bottom: 10),
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle white button press
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: const BorderSide(
                                  color: Colors.teal, width: 1.0),
                            ),
                            child: const Text(
                              "                  Rent",
                              style: TextStyle(
                                color: Colors.teal,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ),

                      // Green button - Buy
                      Positioned(
                        bottom: 10.0,
                        // right: 0,
                        left: 0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 11, bottom: 5),
                          child: SizedBox(
                            height: 38.0,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                // backgroundColor: Colors.teal,
                                side: const BorderSide(
                                    color: Colors.white, width: 1.0),
                              ),
                              child: const Text(
                                " Buy ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //TextField section
                const SizedBox(height: 10.0),
                SizedBox(
                  height: 45,
                  width: ScreenWidth,
                  child: const TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                      hintText: 'Search',
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      suffixIcon: Icon(
                        Icons.business,
                        color: Colors.grey,
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                    ),
                  ),
                ),
                //TabBar----------
                const SizedBox(height: 10.0),
                TabBar(
                  controller: _tabController,
                  tabs: _tabs,
                  labelStyle: const TextStyle(fontSize: 10.0),
                ),
                SizedBox(
                  height: 500,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _buildResidentialTab(),
                      const Text('Commercial Content'),
                      const Text('Lease Content'),
                      const Text('Plot Content'),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildResidentialTab() {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Stack(
                  children: [
                    // Container with image
                    Container(
                      width: 380,
                      height: 200,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        image: DecorationImage(
                          image: AssetImage('assets/images/img.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // Trailing icon (adjust padding and icon as needed)
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        padding: const EdgeInsets.all(5.0),
                        child: const Icon(
                          Icons.favorite_border_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    // Transparent text section
                    Positioned(
                      bottom: 20,
                      left: 20,
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: const Text(
                          '     2000 Sq. Feet      \t  \t  \t      Semi Furnished',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                const Padding(
                  padding: EdgeInsets.only(top: 10, right: 30, left: 30),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check_circle_sharp,
                        color: Colors.green,
                        size: 20.0,
                      ),
                      Text(
                        '3 BHK flat in Koramangala',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                const Padding(
                  padding: EdgeInsets.only(top: 10, right: 30, left: 30),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.grey,
                        size: 25.0,
                      ),
                      Text('226, 10th Cross Road, 4th Block, \n Koramangala'),
                    ],
                  ),
                ),
                // const SizedBox(height: 10.0),
                SizedBox(
                  height: 50,
                  // width: 0,
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        const Text('Deposit\n₹8,00,000'),
                        VerticalDivider(
                          color: Colors.teal[200],
                          thickness: 2,
                        ),
                        const Text('Rent\n₹80,000'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),

                const SizedBox(height: 10.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                    child: const Text(
                      "Call Owner",
                      style: TextStyle(
                        fontSize: 19.0,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
