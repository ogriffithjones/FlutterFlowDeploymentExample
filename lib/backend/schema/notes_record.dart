import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'notes_record.g.dart';

abstract class NotesRecord implements Built<NotesRecord, NotesRecordBuilder> {
  static Serializer<NotesRecord> get serializer => _$notesRecordSerializer;

  @nullable
  String get content;

  @nullable
  DocumentReference get user;

  @nullable
  bool get done;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(NotesRecordBuilder builder) => builder
    ..content = ''
    ..done = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Notes');

  static Stream<NotesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  NotesRecord._();
  factory NotesRecord([void Function(NotesRecordBuilder) updates]) =
      _$NotesRecord;
}

Map<String, dynamic> createNotesRecordData({
  String content,
  DocumentReference user,
  bool done,
}) =>
    serializers.serializeWith(
        NotesRecord.serializer,
        NotesRecord((n) => n
          ..content = content
          ..user = user
          ..done = done));

NotesRecord get dummyNotesRecord {
  final builder = NotesRecordBuilder()
    ..content = dummyString
    ..done = dummyBoolean;
  return builder.build();
}

List<NotesRecord> createDummyNotesRecord({int count}) =>
    List.generate(count, (_) => dummyNotesRecord);
