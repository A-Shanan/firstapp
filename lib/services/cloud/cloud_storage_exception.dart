import 'package:flutter/foundation.dart';

@immutable
class CloudStorageExceprion implements Exception {
  const CloudStorageExceprion();
}

//C in CRUD
class CouldNotCreateNiteException extends CloudStorageExceprion {}

//R in CRUD
class CouldNotGetAllNotesException extends CloudStorageExceprion {}

//U in CRUD
class CouldNotUpdateNoteException extends CloudStorageExceprion {}

//D in CRUD
class CouldNotDeleteNoteException extends CloudStorageExceprion {}
