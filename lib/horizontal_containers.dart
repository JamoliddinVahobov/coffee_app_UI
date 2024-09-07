import 'package:exam/coffee_specific_info.dart';
import 'package:exam/main.dart';
import 'package:flutter/material.dart';

class HorizontalContainers extends StatefulWidget {
  const HorizontalContainers({super.key});

  @override
  State<HorizontalContainers> createState() => _HorizontalContainersState();
}

class _HorizontalContainersState extends State<HorizontalContainers> {
  final List<Map<String, dynamic>> coffeeItems = [
    {
      "name": "Cappucino",
      "description": "with Oat Milk",
      "image": "image/cappuc.jpg",
      "rating": "4.2",
      "price": "4.20",
    },
    {
      "name": "Espresso",
      "description": "with Chocolate",
      "image": "image/espres.jpg",
      "rating": "4.5",
      "price": "5.10",
    },
    {
      "name": "Red Eye",
      "description": "with White Milk",
      "image": "image/red.jpg",
      "rating": "4.1",
      "price": "2.86",
    },
    {
      "name": "Black Eye",
      "description": "with Oat Milk",
      "image": "image/black.jpeg",
      "rating": "4",
      "price": "7.56",
    },
    {
      "name": "Americano",
      "description": "with Chocolate",
      "image": "image/americano.jpeg",
      "rating": "2.2",
      "price": "1.14",
    },
    {
      "name": "Long Black",
      "description": "with White Milk",
      "image": "image/long.jpeg",
      "rating": "3.2",
      "price": "6.72",
    },
    {
      "name": "Machination",
      "description": "with Oat Milk",
      "image": "image/americano.jpeg",
      "rating": "1.2",
      "price": "2.66",
    },
    {
      "name": "Machchiato",
      "description": "with Chocolate",
      "image": "image/machchia.jpeg",
      "rating": "3.2",
      "price": "7.17",
    },
    {
      "name": "Double",
      "description": "with White Milk",
      "image": "image/double.jpg",
      "rating": "3.6",
      "price": "9.73",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 5, top: 10),
        child: Row(
          children: coffeeItems.map((item) => _buildCoffeeItem(item)).toList(),
        ),
      ),
    );
  }

  Widget _buildCoffeeItem(Map<String, dynamic> item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: 150,
        height: 245,
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CoffeeSpecificInfo(
                          index: item['image'],
                          yo: item['name'],
                          some: item["description"],
                          star: item['rating'],
                        ),
                      ));
                },
                child: Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(item['image']),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 27,
                        width: 55,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.orange,
                              size: 15,
                            ),
                            const SizedBox(width: 3),
                            Text(
                              item['rating'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(item['name'], style: still),
              const SizedBox(height: 2),
              Text(item['description'], style: so),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text(
                    "\$",
                    style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 3),
                  Text(item['price'], style: go),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
