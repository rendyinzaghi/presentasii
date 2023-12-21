import 'package:flutter/material.dart';
import 'package:masakankhas_indonesia/data/masakan_data.dart';
import 'package:masakankhas_indonesia/widgets/item_card.dart';

import '../models/masakan.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO : 1. Buat appBar dengan judul wisata candi
      appBar: AppBar(title: Text('Makanan Khas Indonesia'),),
      // TODO : 2. Body dengan gridview.builder
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2
          ),
          padding: EdgeInsets.all(8.0),
          itemCount: MasakanList.length,
          // TODO : 3. Buat Itemcard sebagai return dari gridview.builder
          itemBuilder: (context, index){
            Masakan masakan = MasakanList[index];
            return ItemCard(masakan: masakan);
          }),

    );
  }
}