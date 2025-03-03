import 'package:boiler_plate/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Category> categories = [
      Category(name: 'Hoodies', imagePath: 'assets/images/jjk_hoodie.jpeg', route: '/hoodies'),
      Category(name: 'Windbreakers', imagePath: 'assets/images/windbreaker.jpeg', route: '/windbreakers'),
      Category(name: 'Shorts', imagePath: 'assets/images/shorts.jpeg', route: '/shorts'),
      Category(name: 'Jackets', imagePath: 'assets/images/jacket.jpeg', route: '/jackets'),
      Category(name: 'Shoes', imagePath: 'assets/images/Shoes.jpeg', route: '/shoes'),
      Category(name: 'Accessories', imagePath: 'assets/images/bag.jpeg', route: '/accessories'),
    ];

    return Scaffold(
      appBar: appBar(context),
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        children: [
          const Text(
            'Shop by Category',
            style: TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 17),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7,
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, category.route, arguments: category.name);
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            category.imagePath,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        category.name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      title: const Text(
        'Welcome!',
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/login');
          },
          child: Container(
            margin: const EdgeInsets.all(12),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/icons/mdi_account-outline.svg',
              height: 28,
              width: 28,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
            ),
          ),
        ),
      ],
    );
  }
}
