import 'dart:io';

import 'package:drift/drift.dart' show BooleanExpressionOperators, Value;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:music_app/Api/ResponseEntry/Song.dart';

import '../Api/HttpClient.dart';
import '../Database/AppDataBase.dart';
import '../component/CardMusicListItem.dart';
import '../component/ImageNet.dart';
import '../component/Toast.dart';
import '../generated/l10n.dart';
import '../main.dart';

void showCreatePlayListDialog(BuildContext context, VoidCallback onFinish) {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final uploadHttp = HTTP.getClient<SmmsClient>();

  String? uploadedImageUrl; // 保存上传成功的图片 URL

  showDialog(
    context: context,
    builder: (context) {
      final double screenWidth = MediaQuery.of(context).size.width;

      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: const Text('创建播放列表'),
            content: SizedBox(
              width: screenWidth > 600 ? 500 : screenWidth * 0.9,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '选择封面',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Center(
                      child: uploadedImageUrl == null
                          ? GestureDetector(
                              onTap: () async {
                                FilePickerResult? result =
                                    await FilePicker.platform.pickFiles(
                                  type: FileType.image,
                                  allowMultiple: false,
                                );

                                if (result != null) {
                                  File file = File(result.files.single.path!);
                                  try {
                                    final uploadResponse =
                                        await uploadHttp.upload(file);
                                    if (uploadResponse.code ==
                                        "image_repeated") {
                                      setState(() {
                                        uploadedImageUrl =
                                            uploadResponse.images;
                                      });
                                    } else {
                                      setState(() {
                                        uploadedImageUrl =
                                            uploadResponse.data?.url;
                                      });
                                    }
                                    Toast.show(context, '封面上传成功');
                                  } catch (e) {
                                    Toast.show(context, '封面上传失败');
                                  }
                                }
                              },
                              child: Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: const Center(
                                  child: Text(
                                    '点击选择封面',
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ),
                              ),
                            )
                          : Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    uploadedImageUrl!,
                                    width: 150,
                                    height: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: 4,
                                  right: 4,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        uploadedImageUrl = null;
                                      });
                                    },
                                    child: const Icon(
                                      Icons.close,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      '标题',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '请输入播放列表标题',
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      '简介',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: descriptionController,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '请输入播放列表简介',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('取消'),
              ),
              ElevatedButton(
                onPressed: () {
                  final title = titleController.text.trim();
                  final description = descriptionController.text.trim();
                  if (title.isEmpty) {
                    Toast.show(context, '标题不能为空');
                    return;
                  }
                  if (uploadedImageUrl == null) {
                    Toast.show(context, '请上传封面图片');
                    return;
                  }
                  database
                      .into(database.playListDetailItems)
                      .insert(PlayListDetailItemsCompanion(
                        title: Value(title),
                        description: Value(description),
                        imgUrl: Value(uploadedImageUrl!),
                        isNet: Value(false),
                      ))
                      .then((value) {
                    Toast.show(context, '创建成功');
                    onFinish();
                  });
                  Navigator.of(context).pop();
                },
                child: const Text('保存'),
              ),
            ],
          );
        },
      );
    },
  );
}

showDetailDialog(
    BuildContext context, String url, String title, String subtitle) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      double screenWidth = MediaQuery.of(context).size.width;
      double maxWidth = screenWidth > 600 ? 500 : screenWidth * 0.8;

      return Dialog(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: maxWidth,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0), // 增加一些内边距
            child: Column(
              mainAxisSize: MainAxisSize.min, // 根据内容调整高度
              children: [
                Text(
                  S.of(context).album_detail,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                ImageNet(
                  imageUrl: url,
                  width: 150,
                  height: 150,
                ),
                const SizedBox(height: 10),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(S.of(context).close),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

showCollectionDialog(BuildContext context, Song song) async {
  // 从数据库查询数据
  var query = database.select(database.playListDetailItems)
    ..where((tql) => tql.isNet.equals(false));
  List<PlayListDetailItem> allItems = await query.get();

  // 显示对话框
  showDialog(
    context: context,
    builder: (BuildContext context) {
      double screenWidth = MediaQuery.of(context).size.width;
      double maxWidth = screenWidth > 600 ? 500 : screenWidth * 0.8;

      return Dialog(
        child: Container(
          width: maxWidth,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '请选择收藏的歌单',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop(); // 关闭对话框
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: allItems.length,
                  itemBuilder: (context, index) {
                    final playlistItem = allItems[index];
                    return CardMusicListItem(
                      onTap: () async {
                        //先查询是否已经收藏
                        var query = database.select(database.playListItem)
                          ..where((t) =>
                              t.netId.equals(song.id!) &
                              t.listId.equals(playlistItem.id));
                        var result = await query.get();

                        if (result.isNotEmpty) {
                          Toast.show(context, '已经收藏过了');
                          return;
                        }

                        database
                            .into(database.playListItem)
                            .insert(PlayListItemCompanion.insert(
                              title: '${song.name}',
                              description:
                                  '${song.ar?.map((e) => e.name).join(' / ')} - ${song.al?.name}',
                              imgUrl: '${song.al?.picUrl}',
                              listId: Value(playlistItem.id),
                              netId: Value(song.id),
                            ));
                        Toast.show(context, '收藏成功');
                        Navigator.of(context).pop(); // 关闭对话框
                      },
                      imageUrl: playlistItem.imgUrl,
                      title: playlistItem.title,
                      description: playlistItem.description,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
