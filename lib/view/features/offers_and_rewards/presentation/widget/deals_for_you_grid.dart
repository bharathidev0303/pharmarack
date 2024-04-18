import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:pharmarack/view/features/offers_and_rewards/model/deals_for_you_model.dart';

class DealsForYouGrid extends StatefulWidget {
  const DealsForYouGrid({super.key, required this.json});

  final String json;

  @override
  State<DealsForYouGrid> createState() => _DealsForYouState();
}

class _DealsForYouState extends State<DealsForYouGrid> {
  List<DealsForYou> _availableProducts = [];
  @override
  void initState() {
    super.initState();
    loadDealsForYou();
  }

  void loadDealsForYou() async {
    final res = await rootBundle.loadString(widget.json);
    final productData =
        DealsForYouModel.fromJson(jsonDecode(res) as Map<String, dynamic>);
    setState(() {
      _availableProducts = productData.dealsForYou!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _availableProducts.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(top: 10.0),
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: (164 / 132),
            shrinkWrap: true,
            children:
                _availableProducts.map((product) => Deal(product)).toList());
  }
}

class Deal extends StatelessWidget {
  final DealsForYou product;
  const Deal(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: 164,
      height: 132,
      imageUrl: product.productUrl ?? "",
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
  }
}
