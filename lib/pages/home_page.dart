import 'package:flutter/material.dart';
import '../models/book.dart';
import '../controllers/book_controller.dart';
import 'book_editor.dart';

class BookHomePage extends StatefulWidget {
  const BookHomePage({super.key});

  @override
  State<BookHomePage> createState() => _BookHomePageState();
}

class _BookHomePageState extends State<BookHomePage> {
  final BookController _controller = BookController();

  void _addBook() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookEditor(
          onSave: (judul, deskripsi, stok, fotoBuku, penerbit, pengarang) {
            setState(() {
              _controller.addBook(judul, deskripsi, stok, fotoBuku, penerbit, pengarang);
            });
          },
        ),
      ),
    );
  }

  void _editBook(Book book) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookEditor(
          initialJudul: book.judul,
          initialDeskripsi: book.deskripsi,
          initialStok: book.stok,
          initialFotoBuku: book.fotoBuku,
          initialPenerbit: book.penerbit,
          initialPengarang: book.pengarang,
          onSave: (judul, deskripsi, stok, fotoBuku, penerbit, pengarang) {
            setState(() {
              _controller.updateBook(book.id, judul, deskripsi, stok, fotoBuku, penerbit, pengarang);
            });
          },
        ),
      ),
    );
  }

  void _deleteBook(Book book) {
    setState(() {
      _controller.deleteBook(book.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Library App'),
      ),
      body: ListView.builder(
        itemCount: _controller.books.length,
        itemBuilder: (context, index) {
          final book = _controller.books[index];
          return ListTile(
            leading: Image.network(book.fotoBuku, width: 50, height: 50, fit: BoxFit.cover),
            title: Text(book.judul),
            subtitle: Text("Penerbit: ${book.penerbit} | Stok: ${book.stok}"),
            onTap: () => _editBook(book),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => _deleteBook(book),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addBook,
        child: const Icon(Icons.add),
      ),
    );
  }
}
