import 'package:boiler_plate/models/product_model.dart';
import 'package:boiler_plate/pages/product_page.dart';
import 'package:flutter/material.dart';
import '../api/api_categories.dart';
import '../models/category_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Category>? _categories;
  bool _isLoading = true;


  @override
  void initState() {
    super.initState();
    _fetchCategories();
  }

  Future<void> _fetchCategories() async {
    try {
      print("Fetching categories from API...");
      final List<Category>? categoryList = await CategoryService.fetchCategories();
      print("Categories fetched: ${categoryList?.length}");

      if (!mounted) return;

      setState(() {
        _categories = categoryList ?? [];
        _isLoading = false;
      });
    } catch (e) {
      print("Error fetching categories: $e");
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: RefreshIndicator(
        onRefresh: _fetchCategories,
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : _categories == null || _categories!.isEmpty
            ? const Center(child: Text("No categories available"))
            : Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7,
            ),
            itemCount: _categories!.length,
            itemBuilder: (context, index) {
              final category = _categories![index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductPage(category: category),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color:Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      category.image.isNotEmpty
                          ? Image.network(
                        category.image,
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      )
                          : const Icon(Icons.image_not_supported, size: 80),
                      const SizedBox(height: 10),
                      Text(
                        category.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
