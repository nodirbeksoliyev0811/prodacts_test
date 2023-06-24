import 'package:flutter/material.dart';
import 'package:n8_default_project/local/storage_repository.dart';

import '../models/list_model.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  late int index;

  Future<void> _init()async{
    index= StorageRepository.getInt("index");
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
        title: Text("Market",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white),),
        actions: [IconButton(onPressed: (){
          setState(() {
            _saveInt();
            _init();
          });
        }, icon: Icon(Icons.delete,color: Colors.red,))],
      ),
      body: index<0 ?Column():Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child:  SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                productModels[index].img,
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * .5,
              ),
              SizedBox(
                height: 18,
              ),
              RichText(
                text: TextSpan(
                  text: "Nomi",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.blue),
                  children: [
                    TextSpan(
                      text: "\n${productModels[index].title}",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    TextSpan(
                      text: "\nBa'tafsil",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.blue),
                    ),
                    TextSpan(
                        text:
                        "\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w500))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _saveInt()async{
    await StorageRepository.putInt("index", -1);
  }
}
