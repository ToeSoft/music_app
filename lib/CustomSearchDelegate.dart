import 'package:flutter/material.dart';
import 'package:music_app/component/CardMusicListItem.dart';

import 'main.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = ''; // 清空搜索框内容
          },
        ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return InkWell(
        onTap: () {
          close(context, '');
        },
        child: Container(
            padding: const EdgeInsets.only(top: 10),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                close(context, '');
              },
            )));
  }

  @override
  Widget buildResults(BuildContext context) {
    return SearchResultsPage(query: query,showAppBar: false,);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView(
      children: List.generate(
          5,
          (index) => CardMusicListItem(
              imageUrl: "",
              description: "description $index",
              onFirstButtonPressed: () {},
              onSecondButtonPressed: () {},
              onTap: () {},
              isGrid: false)),
    );
  }
}
