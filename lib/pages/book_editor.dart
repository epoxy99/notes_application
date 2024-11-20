import 'package:flutter/material.dart';

class BookEditor extends StatelessWidget {
  final String? initialJudul;
  final String? initialDeskripsi;
  final int? initialStok;
  final String? initialFotoBuku;
  final String? initialPenerbit;
  final String? initialPengarang;

  final Function(String, String, int, String, String, String) onSave;

  // Menambahkan parameter key ke konstruktor
  BookEditor({
    Key? key,
    this.initialJudul,
    this.initialDeskripsi,
    this.initialStok,
    this.initialFotoBuku,
    this.initialPenerbit,
    this.initialPengarang,
    required this.onSave,
  }) : super(key: key); // Panggil konstruktor superclass dengan key

  final TextEditingController _judulController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();
  final TextEditingController _stokController = TextEditingController();
  final TextEditingController _fotoBukuController = TextEditingController();
  final TextEditingController _penerbitController = TextEditingController();
  final TextEditingController _pengarangController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _judulController.text = initialJudul ?? '';
    _deskripsiController.text = initialDeskripsi ?? '';
    _stokController.text = initialStok?.toString() ?? '';
    _fotoBukuController.text = initialFotoBuku ?? '';
    _penerbitController.text = initialPenerbit ?? '';
    _pengarangController.text = initialPengarang ?? '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Book'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _judulController,
              decoration: const InputDecoration(labelText: 'Judul'),
            ),
            TextField(
              controller: _deskripsiController,
              decoration: const InputDecoration(labelText: 'Deskripsi'),
            ),
            TextField(
              controller: _stokController,
              decoration: const InputDecoration(labelText: 'Stok'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _fotoBukuController,
              decoration: const InputDecoration(labelText: 'URL Foto Buku'),
            ),
            TextField(
              controller: _penerbitController,
              decoration: const InputDecoration(labelText: 'Penerbit'),
            ),
            TextField(
              controller: _pengarangController,
              decoration: const InputDecoration(labelText: 'Pengarang'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                onSave(
                  _judulController.text,
                  _deskripsiController.text,
                  int.tryParse(_stokController.text) ?? 0,
                  _fotoBukuController.text,
                  _penerbitController.text,
                  _pengarangController.text,
                );
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
