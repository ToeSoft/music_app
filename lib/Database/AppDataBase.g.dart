// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppDataBase.dart';

// ignore_for_file: type=lint
class $PlayListDetailItemsTable extends PlayListDetailItems
    with TableInfo<$PlayListDetailItemsTable, PlayListDetailItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlayListDetailItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _netIdMeta = const VerificationMeta('netId');
  @override
  late final GeneratedColumn<int> netId = GeneratedColumn<int>(
      'net_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isNetMeta = const VerificationMeta('isNet');
  @override
  late final GeneratedColumn<bool> isNet = GeneratedColumn<bool>(
      'is_net', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_net" IN (0, 1))'),
      defaultValue: Constant(false));
  static const VerificationMeta _imgUrlMeta = const VerificationMeta('imgUrl');
  @override
  late final GeneratedColumn<String> imgUrl = GeneratedColumn<String>(
      'img_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
  @override
  List<GeneratedColumn> get $columns =>
      [id, netId, title, description, isNet, imgUrl, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'play_list_detail_items';
  @override
  VerificationContext validateIntegrity(Insertable<PlayListDetailItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('net_id')) {
      context.handle(
          _netIdMeta, netId.isAcceptableOrUnknown(data['net_id']!, _netIdMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('is_net')) {
      context.handle(
          _isNetMeta, isNet.isAcceptableOrUnknown(data['is_net']!, _isNetMeta));
    }
    if (data.containsKey('img_url')) {
      context.handle(_imgUrlMeta,
          imgUrl.isAcceptableOrUnknown(data['img_url']!, _imgUrlMeta));
    } else if (isInserting) {
      context.missing(_imgUrlMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlayListDetailItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlayListDetailItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      netId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}net_id']),
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      isNet: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_net'])!,
      imgUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}img_url'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $PlayListDetailItemsTable createAlias(String alias) {
    return $PlayListDetailItemsTable(attachedDatabase, alias);
  }
}

class PlayListDetailItem extends DataClass
    implements Insertable<PlayListDetailItem> {
  final int id;
  final int? netId;
  final String title;
  final String description;
  final bool isNet;
  final String imgUrl;
  final DateTime createdAt;
  const PlayListDetailItem(
      {required this.id,
      this.netId,
      required this.title,
      required this.description,
      required this.isNet,
      required this.imgUrl,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || netId != null) {
      map['net_id'] = Variable<int>(netId);
    }
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['is_net'] = Variable<bool>(isNet);
    map['img_url'] = Variable<String>(imgUrl);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  PlayListDetailItemsCompanion toCompanion(bool nullToAbsent) {
    return PlayListDetailItemsCompanion(
      id: Value(id),
      netId:
          netId == null && nullToAbsent ? const Value.absent() : Value(netId),
      title: Value(title),
      description: Value(description),
      isNet: Value(isNet),
      imgUrl: Value(imgUrl),
      createdAt: Value(createdAt),
    );
  }

  factory PlayListDetailItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlayListDetailItem(
      id: serializer.fromJson<int>(json['id']),
      netId: serializer.fromJson<int?>(json['netId']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      isNet: serializer.fromJson<bool>(json['isNet']),
      imgUrl: serializer.fromJson<String>(json['imgUrl']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'netId': serializer.toJson<int?>(netId),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'isNet': serializer.toJson<bool>(isNet),
      'imgUrl': serializer.toJson<String>(imgUrl),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  PlayListDetailItem copyWith(
          {int? id,
          Value<int?> netId = const Value.absent(),
          String? title,
          String? description,
          bool? isNet,
          String? imgUrl,
          DateTime? createdAt}) =>
      PlayListDetailItem(
        id: id ?? this.id,
        netId: netId.present ? netId.value : this.netId,
        title: title ?? this.title,
        description: description ?? this.description,
        isNet: isNet ?? this.isNet,
        imgUrl: imgUrl ?? this.imgUrl,
        createdAt: createdAt ?? this.createdAt,
      );
  PlayListDetailItem copyWithCompanion(PlayListDetailItemsCompanion data) {
    return PlayListDetailItem(
      id: data.id.present ? data.id.value : this.id,
      netId: data.netId.present ? data.netId.value : this.netId,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      isNet: data.isNet.present ? data.isNet.value : this.isNet,
      imgUrl: data.imgUrl.present ? data.imgUrl.value : this.imgUrl,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlayListDetailItem(')
          ..write('id: $id, ')
          ..write('netId: $netId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('isNet: $isNet, ')
          ..write('imgUrl: $imgUrl, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, netId, title, description, isNet, imgUrl, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlayListDetailItem &&
          other.id == this.id &&
          other.netId == this.netId &&
          other.title == this.title &&
          other.description == this.description &&
          other.isNet == this.isNet &&
          other.imgUrl == this.imgUrl &&
          other.createdAt == this.createdAt);
}

class PlayListDetailItemsCompanion extends UpdateCompanion<PlayListDetailItem> {
  final Value<int> id;
  final Value<int?> netId;
  final Value<String> title;
  final Value<String> description;
  final Value<bool> isNet;
  final Value<String> imgUrl;
  final Value<DateTime> createdAt;
  const PlayListDetailItemsCompanion({
    this.id = const Value.absent(),
    this.netId = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.isNet = const Value.absent(),
    this.imgUrl = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  PlayListDetailItemsCompanion.insert({
    this.id = const Value.absent(),
    this.netId = const Value.absent(),
    required String title,
    required String description,
    this.isNet = const Value.absent(),
    required String imgUrl,
    this.createdAt = const Value.absent(),
  })  : title = Value(title),
        description = Value(description),
        imgUrl = Value(imgUrl);
  static Insertable<PlayListDetailItem> custom({
    Expression<int>? id,
    Expression<int>? netId,
    Expression<String>? title,
    Expression<String>? description,
    Expression<bool>? isNet,
    Expression<String>? imgUrl,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (netId != null) 'net_id': netId,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (isNet != null) 'is_net': isNet,
      if (imgUrl != null) 'img_url': imgUrl,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  PlayListDetailItemsCompanion copyWith(
      {Value<int>? id,
      Value<int?>? netId,
      Value<String>? title,
      Value<String>? description,
      Value<bool>? isNet,
      Value<String>? imgUrl,
      Value<DateTime>? createdAt}) {
    return PlayListDetailItemsCompanion(
      id: id ?? this.id,
      netId: netId ?? this.netId,
      title: title ?? this.title,
      description: description ?? this.description,
      isNet: isNet ?? this.isNet,
      imgUrl: imgUrl ?? this.imgUrl,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (netId.present) {
      map['net_id'] = Variable<int>(netId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (isNet.present) {
      map['is_net'] = Variable<bool>(isNet.value);
    }
    if (imgUrl.present) {
      map['img_url'] = Variable<String>(imgUrl.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlayListDetailItemsCompanion(')
          ..write('id: $id, ')
          ..write('netId: $netId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('isNet: $isNet, ')
          ..write('imgUrl: $imgUrl, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $PlayListItemTable extends PlayListItem
    with TableInfo<$PlayListItemTable, PlayListItemData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlayListItemTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _listIdMeta = const VerificationMeta('listId');
  @override
  late final GeneratedColumn<int> listId = GeneratedColumn<int>(
      'list_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _netIdMeta = const VerificationMeta('netId');
  @override
  late final GeneratedColumn<int> netId = GeneratedColumn<int>(
      'net_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _imgUrlMeta = const VerificationMeta('imgUrl');
  @override
  late final GeneratedColumn<String> imgUrl = GeneratedColumn<String>(
      'img_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
  @override
  List<GeneratedColumn> get $columns =>
      [id, listId, netId, imgUrl, title, description, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'play_list_item';
  @override
  VerificationContext validateIntegrity(Insertable<PlayListItemData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('list_id')) {
      context.handle(_listIdMeta,
          listId.isAcceptableOrUnknown(data['list_id']!, _listIdMeta));
    }
    if (data.containsKey('net_id')) {
      context.handle(
          _netIdMeta, netId.isAcceptableOrUnknown(data['net_id']!, _netIdMeta));
    }
    if (data.containsKey('img_url')) {
      context.handle(_imgUrlMeta,
          imgUrl.isAcceptableOrUnknown(data['img_url']!, _imgUrlMeta));
    } else if (isInserting) {
      context.missing(_imgUrlMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlayListItemData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlayListItemData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      listId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}list_id']),
      netId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}net_id']),
      imgUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}img_url'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $PlayListItemTable createAlias(String alias) {
    return $PlayListItemTable(attachedDatabase, alias);
  }
}

class PlayListItemData extends DataClass
    implements Insertable<PlayListItemData> {
  final int id;
  final int? listId;
  final int? netId;
  final String imgUrl;
  final String title;
  final String description;
  final DateTime createdAt;
  const PlayListItemData(
      {required this.id,
      this.listId,
      this.netId,
      required this.imgUrl,
      required this.title,
      required this.description,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || listId != null) {
      map['list_id'] = Variable<int>(listId);
    }
    if (!nullToAbsent || netId != null) {
      map['net_id'] = Variable<int>(netId);
    }
    map['img_url'] = Variable<String>(imgUrl);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  PlayListItemCompanion toCompanion(bool nullToAbsent) {
    return PlayListItemCompanion(
      id: Value(id),
      listId:
          listId == null && nullToAbsent ? const Value.absent() : Value(listId),
      netId:
          netId == null && nullToAbsent ? const Value.absent() : Value(netId),
      imgUrl: Value(imgUrl),
      title: Value(title),
      description: Value(description),
      createdAt: Value(createdAt),
    );
  }

  factory PlayListItemData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlayListItemData(
      id: serializer.fromJson<int>(json['id']),
      listId: serializer.fromJson<int?>(json['listId']),
      netId: serializer.fromJson<int?>(json['netId']),
      imgUrl: serializer.fromJson<String>(json['imgUrl']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'listId': serializer.toJson<int?>(listId),
      'netId': serializer.toJson<int?>(netId),
      'imgUrl': serializer.toJson<String>(imgUrl),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  PlayListItemData copyWith(
          {int? id,
          Value<int?> listId = const Value.absent(),
          Value<int?> netId = const Value.absent(),
          String? imgUrl,
          String? title,
          String? description,
          DateTime? createdAt}) =>
      PlayListItemData(
        id: id ?? this.id,
        listId: listId.present ? listId.value : this.listId,
        netId: netId.present ? netId.value : this.netId,
        imgUrl: imgUrl ?? this.imgUrl,
        title: title ?? this.title,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
      );
  PlayListItemData copyWithCompanion(PlayListItemCompanion data) {
    return PlayListItemData(
      id: data.id.present ? data.id.value : this.id,
      listId: data.listId.present ? data.listId.value : this.listId,
      netId: data.netId.present ? data.netId.value : this.netId,
      imgUrl: data.imgUrl.present ? data.imgUrl.value : this.imgUrl,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlayListItemData(')
          ..write('id: $id, ')
          ..write('listId: $listId, ')
          ..write('netId: $netId, ')
          ..write('imgUrl: $imgUrl, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, listId, netId, imgUrl, title, description, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlayListItemData &&
          other.id == this.id &&
          other.listId == this.listId &&
          other.netId == this.netId &&
          other.imgUrl == this.imgUrl &&
          other.title == this.title &&
          other.description == this.description &&
          other.createdAt == this.createdAt);
}

class PlayListItemCompanion extends UpdateCompanion<PlayListItemData> {
  final Value<int> id;
  final Value<int?> listId;
  final Value<int?> netId;
  final Value<String> imgUrl;
  final Value<String> title;
  final Value<String> description;
  final Value<DateTime> createdAt;
  const PlayListItemCompanion({
    this.id = const Value.absent(),
    this.listId = const Value.absent(),
    this.netId = const Value.absent(),
    this.imgUrl = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  PlayListItemCompanion.insert({
    this.id = const Value.absent(),
    this.listId = const Value.absent(),
    this.netId = const Value.absent(),
    required String imgUrl,
    required String title,
    required String description,
    this.createdAt = const Value.absent(),
  })  : imgUrl = Value(imgUrl),
        title = Value(title),
        description = Value(description);
  static Insertable<PlayListItemData> custom({
    Expression<int>? id,
    Expression<int>? listId,
    Expression<int>? netId,
    Expression<String>? imgUrl,
    Expression<String>? title,
    Expression<String>? description,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (listId != null) 'list_id': listId,
      if (netId != null) 'net_id': netId,
      if (imgUrl != null) 'img_url': imgUrl,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  PlayListItemCompanion copyWith(
      {Value<int>? id,
      Value<int?>? listId,
      Value<int?>? netId,
      Value<String>? imgUrl,
      Value<String>? title,
      Value<String>? description,
      Value<DateTime>? createdAt}) {
    return PlayListItemCompanion(
      id: id ?? this.id,
      listId: listId ?? this.listId,
      netId: netId ?? this.netId,
      imgUrl: imgUrl ?? this.imgUrl,
      title: title ?? this.title,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (listId.present) {
      map['list_id'] = Variable<int>(listId.value);
    }
    if (netId.present) {
      map['net_id'] = Variable<int>(netId.value);
    }
    if (imgUrl.present) {
      map['img_url'] = Variable<String>(imgUrl.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlayListItemCompanion(')
          ..write('id: $id, ')
          ..write('listId: $listId, ')
          ..write('netId: $netId, ')
          ..write('imgUrl: $imgUrl, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PlayListDetailItemsTable playListDetailItems =
      $PlayListDetailItemsTable(this);
  late final $PlayListItemTable playListItem = $PlayListItemTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [playListDetailItems, playListItem];
}

typedef $$PlayListDetailItemsTableCreateCompanionBuilder
    = PlayListDetailItemsCompanion Function({
  Value<int> id,
  Value<int?> netId,
  required String title,
  required String description,
  Value<bool> isNet,
  required String imgUrl,
  Value<DateTime> createdAt,
});
typedef $$PlayListDetailItemsTableUpdateCompanionBuilder
    = PlayListDetailItemsCompanion Function({
  Value<int> id,
  Value<int?> netId,
  Value<String> title,
  Value<String> description,
  Value<bool> isNet,
  Value<String> imgUrl,
  Value<DateTime> createdAt,
});

class $$PlayListDetailItemsTableFilterComposer
    extends Composer<_$AppDatabase, $PlayListDetailItemsTable> {
  $$PlayListDetailItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get netId => $composableBuilder(
      column: $table.netId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isNet => $composableBuilder(
      column: $table.isNet, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imgUrl => $composableBuilder(
      column: $table.imgUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$PlayListDetailItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $PlayListDetailItemsTable> {
  $$PlayListDetailItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get netId => $composableBuilder(
      column: $table.netId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isNet => $composableBuilder(
      column: $table.isNet, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imgUrl => $composableBuilder(
      column: $table.imgUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$PlayListDetailItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlayListDetailItemsTable> {
  $$PlayListDetailItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get netId =>
      $composableBuilder(column: $table.netId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<bool> get isNet =>
      $composableBuilder(column: $table.isNet, builder: (column) => column);

  GeneratedColumn<String> get imgUrl =>
      $composableBuilder(column: $table.imgUrl, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$PlayListDetailItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PlayListDetailItemsTable,
    PlayListDetailItem,
    $$PlayListDetailItemsTableFilterComposer,
    $$PlayListDetailItemsTableOrderingComposer,
    $$PlayListDetailItemsTableAnnotationComposer,
    $$PlayListDetailItemsTableCreateCompanionBuilder,
    $$PlayListDetailItemsTableUpdateCompanionBuilder,
    (
      PlayListDetailItem,
      BaseReferences<_$AppDatabase, $PlayListDetailItemsTable,
          PlayListDetailItem>
    ),
    PlayListDetailItem,
    PrefetchHooks Function()> {
  $$PlayListDetailItemsTableTableManager(
      _$AppDatabase db, $PlayListDetailItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlayListDetailItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlayListDetailItemsTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlayListDetailItemsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> netId = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<bool> isNet = const Value.absent(),
            Value<String> imgUrl = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              PlayListDetailItemsCompanion(
            id: id,
            netId: netId,
            title: title,
            description: description,
            isNet: isNet,
            imgUrl: imgUrl,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> netId = const Value.absent(),
            required String title,
            required String description,
            Value<bool> isNet = const Value.absent(),
            required String imgUrl,
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              PlayListDetailItemsCompanion.insert(
            id: id,
            netId: netId,
            title: title,
            description: description,
            isNet: isNet,
            imgUrl: imgUrl,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PlayListDetailItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PlayListDetailItemsTable,
    PlayListDetailItem,
    $$PlayListDetailItemsTableFilterComposer,
    $$PlayListDetailItemsTableOrderingComposer,
    $$PlayListDetailItemsTableAnnotationComposer,
    $$PlayListDetailItemsTableCreateCompanionBuilder,
    $$PlayListDetailItemsTableUpdateCompanionBuilder,
    (
      PlayListDetailItem,
      BaseReferences<_$AppDatabase, $PlayListDetailItemsTable,
          PlayListDetailItem>
    ),
    PlayListDetailItem,
    PrefetchHooks Function()>;
typedef $$PlayListItemTableCreateCompanionBuilder = PlayListItemCompanion
    Function({
  Value<int> id,
  Value<int?> listId,
  Value<int?> netId,
  required String imgUrl,
  required String title,
  required String description,
  Value<DateTime> createdAt,
});
typedef $$PlayListItemTableUpdateCompanionBuilder = PlayListItemCompanion
    Function({
  Value<int> id,
  Value<int?> listId,
  Value<int?> netId,
  Value<String> imgUrl,
  Value<String> title,
  Value<String> description,
  Value<DateTime> createdAt,
});

class $$PlayListItemTableFilterComposer
    extends Composer<_$AppDatabase, $PlayListItemTable> {
  $$PlayListItemTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get listId => $composableBuilder(
      column: $table.listId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get netId => $composableBuilder(
      column: $table.netId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imgUrl => $composableBuilder(
      column: $table.imgUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$PlayListItemTableOrderingComposer
    extends Composer<_$AppDatabase, $PlayListItemTable> {
  $$PlayListItemTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get listId => $composableBuilder(
      column: $table.listId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get netId => $composableBuilder(
      column: $table.netId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imgUrl => $composableBuilder(
      column: $table.imgUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$PlayListItemTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlayListItemTable> {
  $$PlayListItemTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get listId =>
      $composableBuilder(column: $table.listId, builder: (column) => column);

  GeneratedColumn<int> get netId =>
      $composableBuilder(column: $table.netId, builder: (column) => column);

  GeneratedColumn<String> get imgUrl =>
      $composableBuilder(column: $table.imgUrl, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$PlayListItemTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PlayListItemTable,
    PlayListItemData,
    $$PlayListItemTableFilterComposer,
    $$PlayListItemTableOrderingComposer,
    $$PlayListItemTableAnnotationComposer,
    $$PlayListItemTableCreateCompanionBuilder,
    $$PlayListItemTableUpdateCompanionBuilder,
    (
      PlayListItemData,
      BaseReferences<_$AppDatabase, $PlayListItemTable, PlayListItemData>
    ),
    PlayListItemData,
    PrefetchHooks Function()> {
  $$PlayListItemTableTableManager(_$AppDatabase db, $PlayListItemTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlayListItemTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlayListItemTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlayListItemTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> listId = const Value.absent(),
            Value<int?> netId = const Value.absent(),
            Value<String> imgUrl = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              PlayListItemCompanion(
            id: id,
            listId: listId,
            netId: netId,
            imgUrl: imgUrl,
            title: title,
            description: description,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> listId = const Value.absent(),
            Value<int?> netId = const Value.absent(),
            required String imgUrl,
            required String title,
            required String description,
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              PlayListItemCompanion.insert(
            id: id,
            listId: listId,
            netId: netId,
            imgUrl: imgUrl,
            title: title,
            description: description,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PlayListItemTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PlayListItemTable,
    PlayListItemData,
    $$PlayListItemTableFilterComposer,
    $$PlayListItemTableOrderingComposer,
    $$PlayListItemTableAnnotationComposer,
    $$PlayListItemTableCreateCompanionBuilder,
    $$PlayListItemTableUpdateCompanionBuilder,
    (
      PlayListItemData,
      BaseReferences<_$AppDatabase, $PlayListItemTable, PlayListItemData>
    ),
    PlayListItemData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PlayListDetailItemsTableTableManager get playListDetailItems =>
      $$PlayListDetailItemsTableTableManager(_db, _db.playListDetailItems);
  $$PlayListItemTableTableManager get playListItem =>
      $$PlayListItemTableTableManager(_db, _db.playListItem);
}
