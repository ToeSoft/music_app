import 'package:flutter/material.dart';

class CustomPagination extends StatefulWidget {
  final int totalPages; // 总页数
  final Function(int) onPageChanged; // 页码改变回调

  const CustomPagination({
    super.key,
    required this.totalPages,
    required this.onPageChanged,
  });

  @override
  _CustomPaginationState createState() => _CustomPaginationState();
}

class _CustomPaginationState extends State<CustomPagination> {
  int currentPage = 1;
  static const int maxVisiblePages = 5; // 固定显示的按钮数量

  void changePage(int page) {
    setState(() {
      currentPage = page;
    });
    widget.onPageChanged(page); // 通知外部页码更改
  }

  List<int> calculatePageRange() {
    if (widget.totalPages <= maxVisiblePages) {
      // 如果总页数小于等于固定显示数量，显示所有页码
      return List.generate(widget.totalPages, (index) => index + 1);
    }

    int startPage = currentPage - (maxVisiblePages ~/ 2);
    int endPage = currentPage + (maxVisiblePages ~/ 2);

    // 修正范围，确保不超出边界
    if (startPage < 1) {
      startPage = 1;
      endPage = maxVisiblePages;
    } else if (endPage > widget.totalPages) {
      endPage = widget.totalPages;
      startPage = widget.totalPages - maxVisiblePages + 1;
    }

    return List.generate(endPage - startPage + 1, (index) => startPage + index);
  }

  @override
  Widget build(BuildContext context) {
    List<int> pageRange = calculatePageRange();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // 首页按钮
        IconButton(
          onPressed: currentPage > 1 ? () => changePage(1) : null,
          icon: const Icon(Icons.first_page),
        ),
        // 上一页按钮
        IconButton(
          onPressed: currentPage > 1 ? () => changePage(currentPage - 1) : null,
          icon: const Icon(Icons.arrow_back_ios),
        ),
        // 页码按钮
        ...pageRange.map(
              (page) => InkWell(
            onTap: () => changePage(page),
            borderRadius: BorderRadius.circular(16),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 40, // 固定宽度
              margin: const EdgeInsets.symmetric(horizontal: 4),
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: page == currentPage
                    ? Theme.of(context).primaryColor
                    : Colors.grey[300],
                borderRadius: BorderRadius.circular(16),
                boxShadow: page == currentPage
                    ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ]
                    : [],
              ),
              child: Center(
                child: Text(
                  '$page',
                  style: TextStyle(
                    color: page == currentPage
                        ? Colors.white
                        : Theme.of(context).textTheme.bodyMedium?.color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        // 下一页按钮
        IconButton(
          onPressed: currentPage < widget.totalPages
              ? () => changePage(currentPage + 1)
              : null,
          icon: const Icon(Icons.arrow_forward_ios),
        ),
        // 尾页按钮
        IconButton(
          onPressed: currentPage < widget.totalPages
              ? () => changePage(widget.totalPages)
              : null,
          icon: const Icon(Icons.last_page),
        ),
      ],
    );
  }
}