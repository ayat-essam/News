import 'package:flutter/material.dart';
import 'package:news/news/news_list.dart';
import 'package:news/tabs/tab_item.dart';

import '../models/SourcesResponse.dart';

class sourceTab extends StatefulWidget {
  const sourceTab(this.sources, {super.key});

  final List<Sources> sources;

  @override
  State<sourceTab> createState() => _SourceTabState();
}

class _SourceTabState extends State<sourceTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
            isScrollable: true,
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            tabAlignment: TabAlignment.start,
            onTap: (index) => setState(() => selectedIndex = index),
            tabs: widget.sources.map(
                  (source) => TabItem(
                    source: source.name ?? '',
                isSelected: source == widget.sources[selectedIndex],
              ),
            ).toList(),
          ),
        ),
        Expanded(
          child: NewsList(widget.sources [selectedIndex].id ??  ''),
        ),
      ],
    );
  }
}
