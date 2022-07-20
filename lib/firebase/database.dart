import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:freelance_fx_seller/model/service_model.dart';

Future<void> addService(ServiceModel service, FilePickerResult image) async {
  final FirebaseFirestore _DB = FirebaseFirestore.instance;
  final serviceDB = _DB.collection('services').doc();
  service.id = serviceDB.id;
  service.image = await imageUpload(image);
  serviceDB.set(service.toJason());
}

Future<String?> imageUpload(FilePickerResult image) async {
  final FirebaseStorage storage = FirebaseStorage.instance;
  final path = image.files.single.path;
  final fileName = image.files.single.name;
  File file = File(path!);
  String? imageurl;
  try {
    final ref = storage.ref('serviceImages/$fileName');
    final link = await ref.putFile(file).whenComplete(() => null);
    String imageUrl = await link.ref.getDownloadURL();
    imageurl= imageUrl;
  } on FirebaseException catch (e) {
    print(e);
  }
  return imageurl;
}
