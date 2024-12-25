import 'package:flutter/material.dart';

import '../main.dart';

class MySearchBar extends StatefulWidget {
  final String hintText;
  final VoidCallback? onClickCreatePlayList;

  const MySearchBar(
      {super.key, required this.hintText, this.onClickCreatePlayList});

  @override
  MySearchBarState createState() => MySearchBarState();
}

class MySearchBarState extends State<MySearchBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end, // 使子组件靠右对齐
          children: [
            IconButton(
                icon: const Icon(Icons.playlist_add),
                onPressed: () => {
                      if (widget.onClickCreatePlayList != null)
                        {widget.onClickCreatePlayList!()}
                    }),
            const SizedBox(width: 8), // 图标和搜索框之间的间距
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300, maxHeight: 40),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _controller,
                  onChanged: (query) {
                    setState(() {});
                  },
                  onSubmitted: (query) {
                    if (query.isNotEmpty) {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 600),
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  SearchResultsPage(
                            showAppBar: true,
                            query: query,
                          ),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            const begin = Offset(0.0, 1.0);
                            const end = Offset.zero;
                            const curve = Curves.fastOutSlowIn;

                            var slideTween = Tween(begin: begin, end: end)
                                .chain(CurveTween(curve: curve));
                            var offsetAnimation = animation.drive(slideTween);

                            var fadeTween = Tween<double>(begin: 0.0, end: 1.0)
                                .chain(CurveTween(curve: curve));
                            var fadeAnimation = animation.drive(fadeTween);

                            var scaleTween = Tween<double>(begin: 0.9, end: 1.0)
                                .chain(CurveTween(curve: curve));
                            var scaleAnimation = animation.drive(scaleTween);

                            return SlideTransition(
                              position: offsetAnimation,
                              child: FadeTransition(
                                opacity: fadeAnimation,
                                child: ScaleTransition(
                                  scale: scaleAnimation,
                                  child: child,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                  },
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                  decoration: InputDecoration(
                    hintText: widget.hintText,
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 16,
                    ),
                    suffixIcon: _controller.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              _controller.clear();
                              setState(() {});
                            },
                          )
                        : const Icon(Icons.search),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
