import 'package:flutter/material.dart';
import 'package:masakankhas_indonesia/data/masakan_data.dart';
import '../models/masakan.dart';
import 'detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Masakan> _filteredMasakan = [];
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredMasakan = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pencarian Masakan'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.brown[50],
              ),
              child: TextField(
                controller: _searchController,
                onChanged: (query) {
                  // Call the search function whenever the text changes
                  _searchMasakan(query);
                },
                autofocus: false,
                decoration: InputDecoration(
                  hintText: 'Cari Masakan...',
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.brown),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredMasakan.length,
              itemBuilder: (context, index) {
                final masakan = _filteredMasakan[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: GestureDetector(
                    onTap: () {
                      _navigateToDetailScreen(masakan);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          width: 100,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              masakan.imageAsset,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              masakan.name,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(masakan.origin),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _searchMasakan(String query) {
    setState(() {
      _filteredMasakan = MasakanList
          .where((masakan) =>
          masakan.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }
  void _navigateToDetailScreen(Masakan masakan) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(masakan: masakan),
      ),
    );
  }

}