import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/pages/buyer/search_result.dart';
import 'package:xrpl2_plazaku/services/app_service.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = appService.userModel!;
    final searches = searchService.userSearchHistory(user.id);
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Color(0xFFF5F5F5),
        title: TextField(
          controller: search,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.black),
            ),
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            hint: Text(
              'Search',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (search.text.isEmpty) return;
              searchService.addSearchToHistory(user.id, search.text);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchResult(search: search.text),
                ),
              ).then((value) {
                setState(() {});
              });
            },
            child: Text('Search', style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
      body: searches.isEmpty
          ? Center(child: Text('No search history'))
          : ListView.builder(
              itemCount: searches.length,
              itemBuilder: (context, index) => ListTile(
                leading: Icon(CupertinoIcons.clock),
                title: Text(searches[index].search),
                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      searchService.removeSearchFromHistory(
                        searches[index],
                        user.id,
                      );
                    });
                  },
                  icon: Icon(CupertinoIcons.xmark_circle),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SearchResult(search: searches[index].search),
                    ),
                  ).then((value) {
                    setState(() {});
                  });
                  searchService.addSearchToHistory(
                    user.id,
                    searches[index].search,
                  );
                },
              ),
            ),
    );
  }
}
