import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProductController extends GetxController {
  //TODO: Implement UpdateProductController

  late TextEditingController cNama;
  late TextEditingController cHarga;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(String id) async {
    DocumentReference docRef = firestore.collection("mahasiswa").doc(id);

    return docRef.get();
  }

  void updateProduct(String nama, String harga, String id) async {
    DocumentReference productById = firestore.collection("mahasiswa").doc(id);
    try {
      await productById.update({
        "NPM": nama,
        "NAMA": nama,
        "ALAMAT": harga,

      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil mengubah data Product",
        onConfirm: () {
          cNama.clear();
          cHarga.clear();
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
        
      );
      
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Gagal menambahkan Product",
      );
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    cNama = TextEditingController();
    cHarga = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    cNama.dispose();
    cHarga.dispose();
    super.onClose();
  }
}