import 'package:flutter/material.dart';
import 'package:music_app/component/MobileSearchSuggestItem.dart';

import 'Api/HttpClient.dart';
import 'generated/l10n.dart';
import 'main.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  bool isLoading = false; // 控制加载状态的标志

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
        ),
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return SearchResultsPage(
      query: query,
      showAppBar: false,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var http = HTTP.getClient<RetrofitClient>();

    // 使用 FutureBuilder 来处理异步请求
    return FutureBuilder(
      future: http.suggestMobile(query, "mobile"), // 根据输入内容发起请求
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // 正在加载时显示加载指示器
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          // 请求错误时显示错误信息
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (snapshot.data?.result == null) {
          // 没有结果时显示提示信息
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(S.of(context).no_suggestions_available),
                if (query.isEmpty)
                  Text(S.of(context).please_input_search_content),
              ],
            ),
          );
        }

        var suggestions = snapshot.data; // 假设数据类型是 List 或类似结构
        var list = suggestions?.result?.allMatch ?? [];

        if (list.isEmpty) {
          // 如果没有建议项，显示提示信息
          return Center(child: Text(S.of(context).no_suggestions_available));
        }

        // 返回正常的列表
        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            var suggestion = list[index];
            var split = suggestion.keyword?.split(" ") ?? ["", ""];
            var type = getSuggestType(suggestion.alg);
            return MobileSearchSuggestItem(
              type: type,
              title: split[0],
              description: split.length > 1 ? split[1] : "",
              onTap: () {
                query = suggestion.keyword ?? "";
                showResults(context);
              },
            );
          },
        );
      },
    );
  }
}

getSuggestType(String? alg) {
  if (alg == null) {
    return 1;
  }
  if (alg.contains("alg_suggest_other_Song")) {
    return 1;
  }

  if (alg.contains("alg_suggest_other_Album")) {
    return 2;
  }
  if (alg.contains("alg_suggest_other_Artist")) {
    return 3;
  }

  if (alg.contains("alg_suggest_other_Consume")) {
    return 4;
  }
}
