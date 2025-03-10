import 'package:boiler_plate/pages/product_details_page.dart';
import 'package:flutter/material.dart';
import '../api/api_products.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';


class ProductPage extends StatefulWidget {
  final Category category; // Receive category from HomePage

  const ProductPage({Key? key, required this.category}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<Product> _products = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    print("Category ID before fetching: ${widget.category.id}"); // ✅ Debugging

    if (widget.category.id == 0) {
      print("⚠️ ERROR: Invalid category ID (0)");
      return;
    }

    try {
      final products = await ProductService.fetchProductsByCategory(widget.category.id);

      if (!mounted) return;

      setState(() {
        _products = products;
        _isLoading = false;
      });
    } catch (e) {
      print("Error fetching products: $e");
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.category.name)),
      body: RefreshIndicator(
        onRefresh: _fetchProducts,
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : _products.isEmpty
            ? const Center(child: Text("No products available"))
            : ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: _products.length,
          itemBuilder: (context, index) {
            final product = _products[index];

            return GestureDetector(
              onTap: () {
                // ✅ Navigate to Product Details Page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsPage(product: product),
                  ),
                );
              },
              child: Card(
                elevation: 3,
                margin: const EdgeInsets.only(bottom: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(10),
                  leading: product.imageUrl != null && product.imageUrl!.isNotEmpty
                      ? ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      product.imageUrl!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.image_not_supported, size: 70);
                      },
                    ),
                  )
                      : const Icon(Icons.image_not_supported, size: 70),
                  title: Text(
                    product.name.toUpperCase(),
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.description,
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "€ ${product.price.toStringAsFixed(2)}",
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.green),
                      ),
                    ],
                  ),
                  trailing: ElevatedButton(
                    onPressed: () {
                      print("BUY NOW clicked for ${product.name}");
                      // ✅ Implement Buy Now logic (e.g., Add to Cart)
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    ),
                    child: const Text("BUY NOW", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
