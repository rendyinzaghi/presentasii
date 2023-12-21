import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/masakan_data.dart';
import '../models/masakan.dart';
import 'package:masakankhas_indonesia/screens/detail_screen.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<String> favorite = [];

  GlobalKey<AnimatedListState> listKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _loadFavoriteStatus();
  }

  Future<void> _loadFavoriteStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> _loadFavoriteStatus = prefs.getStringList('favorite') ?? [];
    setState(() {
      favorite = _loadFavoriteStatus;
    });
  }

  void _navigateToDetailScreen(String masakanName) {
    // Find the corresponding Masakan object based on the MasakanName
    Masakan masakan= MasakanList.firstWhere((masakan) => masakan.name == masakanName);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(masakan: masakan),
      ),
    );
  }

  void removeMasakanFromList(String masakanName) {
    int index = favorite.indexOf(masakanName);
    if (index != -1) {
      setState(() {
        favorite.removeAt(index);
        listKey.currentState?.removeItem(
          index,
              (context, animation) => buildItem(context, index, animation),
        );
      });
    }
  }

  Widget buildItem(BuildContext context, int index, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: ListTile(
        title: Text(favorite[index]),
        // Other ListTile properties
      ),
    );
  }

  Widget _buildMasakanCard(String masakanName) {
    // Find the corresponding Masakan object based on the masakanName
    Masakan masakan = MasakanList.firstWhere((masakan) => masakanName == masakanName);

    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        contentPadding: EdgeInsets.all(8),
        title: Text(masakan.name),
        subtitle: Text(masakan.origin),
        onTap: () {
          // Navigate to DetailScreen when tapped
          _navigateToDetailScreen(masakanName);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: favorite.length,
        itemBuilder: (context, index) {
          return _buildMasakanCard(favorite[index]);
        },
      ),
    );
  }
}