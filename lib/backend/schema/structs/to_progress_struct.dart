// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ToProgressStruct extends FFFirebaseStruct {
  ToProgressStruct({
    double? progressValue,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _progressValue = progressValue,
        super(firestoreUtilData);

  // "progressValue" field.
  double? _progressValue;
  double get progressValue => _progressValue ?? 0.0;
  set progressValue(double? val) => _progressValue = val;

  void incrementProgressValue(double amount) =>
      progressValue = progressValue + amount;

  bool hasProgressValue() => _progressValue != null;

  static ToProgressStruct fromMap(Map<String, dynamic> data) =>
      ToProgressStruct(
        progressValue: castToType<double>(data['progressValue']),
      );

  static ToProgressStruct? maybeFromMap(dynamic data) => data is Map
      ? ToProgressStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'progressValue': _progressValue,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'progressValue': serializeParam(
          _progressValue,
          ParamType.double,
        ),
      }.withoutNulls;

  static ToProgressStruct fromSerializableMap(Map<String, dynamic> data) =>
      ToProgressStruct(
        progressValue: deserializeParam(
          data['progressValue'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'ToProgressStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ToProgressStruct && progressValue == other.progressValue;
  }

  @override
  int get hashCode => const ListEquality().hash([progressValue]);
}

ToProgressStruct createToProgressStruct({
  double? progressValue,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ToProgressStruct(
      progressValue: progressValue,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ToProgressStruct? updateToProgressStruct(
  ToProgressStruct? toProgress, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    toProgress
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addToProgressStructData(
  Map<String, dynamic> firestoreData,
  ToProgressStruct? toProgress,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (toProgress == null) {
    return;
  }
  if (toProgress.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && toProgress.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final toProgressData = getToProgressFirestoreData(toProgress, forFieldValue);
  final nestedData = toProgressData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = toProgress.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getToProgressFirestoreData(
  ToProgressStruct? toProgress, [
  bool forFieldValue = false,
]) {
  if (toProgress == null) {
    return {};
  }
  final firestoreData = mapToFirestore(toProgress.toMap());

  // Add any Firestore field values
  toProgress.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getToProgressListFirestoreData(
  List<ToProgressStruct>? toProgresss,
) =>
    toProgresss?.map((e) => getToProgressFirestoreData(e, true)).toList() ?? [];
