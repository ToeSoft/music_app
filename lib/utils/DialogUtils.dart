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
            title: Text(S.current.create_playlist),
            content: SizedBox(
              width: screenWidth > 600 ? 500 : screenWidth * 0.9,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.current.select_cover,
                      style: const TextStyle(fontWeight: FontWeight.bold),
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
                                    Toast.show(context,
                                        S.current.upload_cover_success);
                                  } catch (e) {
                                    Toast.show(
                                        context, S.current.upload_cover_fail);
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
                                child: Center(
                                  child: Text(
                                    S.current.tap_to_select_cover,
                                    style:
                                        const TextStyle(color: Colors.black54),
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
                    Text(
                      S.current.playlist_title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: S.current.pl_enter_title,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      S.current.playlist_description,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: descriptionController,
                      maxLines: 5,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: S.current.pl_enter_description,
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
                child: Text(S.current.cancel),
              ),
              ElevatedButton(
                onPressed: () {
                  final title = titleController.text.trim();
                  final description = descriptionController.text.trim();
                  if (title.isEmpty) {
                    Toast.show(context, S.current.title_cant_not_be_null);
                    return;
                  }
                  if (uploadedImageUrl == null) {
                    Toast.show(context, S.current.pl_upload_cover);
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
                    Toast.show(context, S.current.create_playlist_success);
                    onFinish();
                  });
                  Navigator.of(context).pop();
                },
                child: Text(S.current.save),
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
                  Text(
                    S.current.pl_select_playlist,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
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
                          Toast.show(context, S.current.already_collected);
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
                        Toast.show(context, S.current.collect_success);
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

getSnackBar(BuildContext context, String text) {
  final snackBar = SnackBar(
    content: Text(text),
    backgroundColor: Colors.black54,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );
  return snackBar;
}
