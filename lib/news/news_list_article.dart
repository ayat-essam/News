import 'package:flutter/material.dart';
import 'package:news/api_manger.dart';
import 'package:news/news/articale.dart';
import 'news_item.dart';

class NewsListArticle extends StatefulWidget {
  const NewsListArticle(this.newsId, {super.key});

  final String newsId;

  @override
  _NewsListState createState() => _NewsListState();
}
class _NewsListState extends State<NewsListArticle> {

  TextEditingController searchController = TextEditingController();
  List newsList = [];
  List filteredNewsList = [];
  bool isLoading = true;
  int currentPage = 1;
  bool isLoadingMore = false;
  final ScrollController scrollController = ScrollController();


  @override
  void initState() {
    super.initState();
    searchAboutNews();
    scrollController.addListener(scrollListener);
  }
  @override
  void dispose(){
    super.dispose();
    scrollController.dispose();
  }

  void searchAboutNews({int page = 1}) async {
    final response = await apiManger.getNews(widget.newsId);
    if (response.status == 'ok') {
      setState(() {
        newsList.addAll(response.articles);
        filteredNewsList = newsList;
        isLoading = false;
        isLoadingMore = false;
      });
    } else {
      setState(() {
        newsList = [];
        filteredNewsList = [];
        isLoading = false;
      });
    }
  }

  void filterNews(String query) {
    setState(() {
      filteredNewsList = newsList
          .where((article) =>
      article.title.toLowerCase().contains(query.toLowerCase()) ||
          article.description.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }
  void scrollListener(){
    if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
      if(isLoadingMore){
        setState(() {
          isLoadingMore = true;
          currentPage++;
        });
        searchAboutNews(page: currentPage);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: searchController,
          decoration: const InputDecoration(

            hintText: 'Search Articles',
            border: InputBorder.none,
          ),
          onChanged: filterNews,
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
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : filteredNewsList.isEmpty
          ? const Center(child: Text('No articles match your search.'))
          : ListView.builder(
        itemCount: filteredNewsList.length,
        itemBuilder: (context, index) {
          final article = filteredNewsList[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => articleImage(article),
                ),
              );
            },
            child: newsItem(article),
          );
        },
      ),
    );
  }
}


