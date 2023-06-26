import 'package:flutter/material.dart';
import 'package:n8_default_project/models/list_model.dart';

import '../local/storage_repository.dart';

class ChangedScreen extends StatefulWidget {
  const ChangedScreen({super.key});

  @override
  State<ChangedScreen> createState() => _ChangedScreenState();
}

class _ChangedScreenState extends State<ChangedScreen> {

  late List<int> selectedProducts;
  late Set<int> newList;

  Future<void> _init() async {
    selectedProducts = StorageRepository.getList("favorites")
        .map((e) => int.parse(e))
        .toList();
    newList=selectedProducts.toSet();
    selectedProducts=newList.toList();
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text("Changed",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white),),
      ),
      body: Column(
        children: [Expanded(child: ListView(
          children: [...List.generate(selectedProducts.length, (index) => ListTile(
            title: Text(productModels[
            selectedProducts[index]]
                .title),
          ))],
        ))],
      ),
    );
  }
}
