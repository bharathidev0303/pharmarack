import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:pharmarack/view/features/offers_and_rewards/model/categories_model.dart';

class CategoriesGrid extends StatefulWidget {
  const CategoriesGrid({super.key, required this.json});

  final String json;

  @override
  State<CategoriesGrid> createState() => _CategoriesState();
}

class _CategoriesState extends State<CategoriesGrid> {
  List<Categories> _list = [];
  @override
  void initState() {
    super.initState();
    loadCategories();
  }

  void loadCategories() async {
    final res = await rootBundle.loadString(widget.json);
    final productData =
        CategoriesModel.fromJson(jsonDecode(res) as Map<String, dynamic>);
    setState(() {
      _list = productData.categories!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _list.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(top: 10.0),
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: (180 / 100),
            shrinkWrap: true,
            children: _list.map((product) => Category(product)).toList());
  }
}

class Category extends StatelessWidget {
  final Categories product;
  const Category(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: 180,
      height: 100,
      imageUrl: product.imageUrl ?? "",
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: imageProvider, fit: BoxFit.fill),
        ),
      ),
      placeholder: (context, url) => const SizedBox(
        width: 10,
        height: 20,
        child: Center(child: CircularProgressIndicator()),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
    //child: Category(product),
  }
}
