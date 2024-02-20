import 'package:flutter/material.dart';
import 'package:new_bussiness_app/widgets/custom_widgets/customGrid2/customgrid2.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: CustomGrid2());
  }
}
