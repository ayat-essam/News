import 'package:flutter/material.dart';
import 'package:news/api_manger.dart';
import 'package:news/news/articale.dart';
import '../widget/loading_indicator.dart';
import 'news_item.dart';

class NewsList extends StatefulWidget {
  const NewsList(this.newsId, {super.key});

  final String newsId;

  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  TextEditingController _searchController = TextEditingController();
  List<dynamic> _newsList = [];
  List<dynamic> _filteredNewsList = [];

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  void _fetchNews() async {
    final response = await apiManger.getNews(widget.newsId);
    if (response.status == 'ok') {
      setState(() {
        _newsList = response.articles;
        _filteredNewsList = _newsList;
      });
    } else {
      setState(() {
        _newsList = [];
        _filteredNewsList = [];
      });
    }
  }

  void _filterNews(String query) {
    setState(() {
      _filteredNewsList = _newsList
          .where((article) =>
      article.title.toLowerCase().contains(query.toLowerCase()) ||
          article.description.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search Articles',
            border: InputBorder.none,
          ),
          onChanged: _filterNews,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Focus on the search field
              FocusScope.of(context).requestFocus(FocusNode());
            },
          ),
        ],
      ),
      body: _filteredNewsList.isEmpty
          ? _newsList.isEmpty
          ? const loadingIndicator()
          : const Center(child: Text('No articles match your search.'))
          : ListView.builder(
        itemCount: _filteredNewsList.length,
        itemBuilder: (context, index) {
          final article = _filteredNewsList[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => articleImage( article),
                ),
              );
            },
            child: newsItem(article),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
