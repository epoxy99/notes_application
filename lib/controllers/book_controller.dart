import '../models/book.dart';

class BookController {
  final List<Book> _books = [];
  int _currentId = 0;

  List<Book> get books => _books;

  void addBook(String judul, String deskripsi, int stok, String fotoBuku, String penerbit, String pengarang) {
    _books.add(Book(
      id: _currentId++,
      judul: judul,
      deskripsi: deskripsi,
      stok: stok,
      fotoBuku: fotoBuku,
      penerbit: penerbit,
      pengarang: pengarang,
    ));
  }

  void updateBook(int id, String judul, String deskripsi, int stok, String fotoBuku, String penerbit, String pengarang) {
    var book = _books.firstWhere((book) => book.id == id);
    book.judul = judul;
    book.deskripsi = deskripsi;
    book.stok = stok;
    book.fotoBuku = fotoBuku;
    book.penerbit = penerbit;
    book.pengarang = pengarang;
  }

  void deleteBook(int id) {
    _books.removeWhere((book) => book.id == id);
  }
}
