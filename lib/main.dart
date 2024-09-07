import 'package:exam/horizontal_containers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const style =
    TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold);
const still =
    TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500);
const so = TextStyle(color: Colors.grey, fontSize: 14);
const go =
    TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'My Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController value = TextEditingController();
  String name = "";
  List<Map<String, String>> coffeeList = [
    {'image': 'image/cappuc.jpg', 'title': '5 Coffee Beans You\nMust try!'},
    {'image': 'image/espres.jpg', 'title': '5 Coffee Beans You\nMust try!'},
    {'image': 'image/red.jpg', 'title': '5 Coffee Beans You\nMust try!'},
    {'image': 'image/black.jpeg', 'title': '5 Coffee Beans You\nMust try!'},
    {'image': 'image/so.jpg', 'title': '5 Coffee Beans You\nMust try!'},
    {'image': 'image/splash.png', 'title': '5 Coffee Beans You\nMust try!'},
    {'image': 'image/double.jpg', 'title': '5 Coffee Beans You\nMust try!'},
    {'image': 'image/americano.jpeg', 'title': '5 Coffee Beans You\nMust try!'},
    {'image': 'image/machchia.jpeg', 'title': '5 Coffee Beans You\nMust try!'},
    {'image': 'image/do.jpeg', 'title': '5 Coffee Beans You\nMust try!'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.black,
            pinned: true,
            expandedHeight: 280.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.only(
                    top: 30, bottom: 20, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 15),
                      child: Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.grey[800],
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Icon(
                              Icons.grid_view,
                              size: 18,
                              color: Colors.white.withAlpha(200),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.grey[800],
                              borderRadius: BorderRadius.circular(7),
                              image: const DecorationImage(
                                image: AssetImage("image/flutter.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (name.isNotEmpty)
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              name,
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        const Text(
                          'Coffee for you',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                name = value.text;
                                // ignore: avoid_print
                                print(name);
                              });
                            },
                            icon: const Icon(Icons.coffee, color: Colors.grey),
                          ),
                          Expanded(
                            child: TextField(
                              style: const TextStyle(
                                color:
                                    Colors.white, // Set the text color to white
                              ),
                              controller: value,
                              decoration: const InputDecoration(
                                hintText: 'Find Your Coffee...',
                                hintStyle:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                                border: InputBorder.none,
                              ),
                              onChanged: (value) {
                                // ignore: avoid_print
                                print(name);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(width: 5),
                          Text(
                            'Cappuccino',
                            style: TextStyle(
                                color: Colors.orange,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 15),
                          Text('Espresso', style: style),
                          SizedBox(width: 15),
                          Text('Red Eye', style: style),
                          SizedBox(width: 15),
                          Text('Black Eye', style: style),
                          SizedBox(width: 15),
                          Text('Americano', style: style),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: HorizontalContainers()),
          SliverToBoxAdapter(
            child: ListView.builder(
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(), // This prevents the inner list from scrolling separately
              itemCount: coffeeList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage(
                                coffeeList[index]['image']!,
                              ),
                              fit: BoxFit.cover,
                            )),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          coffeeList[index]['title']!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
