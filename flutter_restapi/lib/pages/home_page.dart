import 'package:flutter/material.dart';
import 'package:flutter_restapi/providers/book_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    await Future.delayed(Duration(seconds: 2)).then((value) async {
      await Provider.of<BookProvider>(context, listen: false).getBook();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    BookProvider bookProvider = Provider.of<BookProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor:
            Colors.deepPurple, // Menambahkan warna latar belakang AppBar
        title: Text(
          'Book',
          style: GoogleFonts.poppins(
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: RefreshIndicator(
            onRefresh: () => getData(),
            child: ListView.builder(
              itemCount: bookProvider.book.length,
              itemBuilder: (context, index) {
                var book =
                    bookProvider.book[index]; // Ambil buku berdasarkan indeks
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  margin: const EdgeInsets.only(bottom: 10),
                  width: MediaQuery.of(context).size.width,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors
                        .white, // Ubah latar belakang untuk kontras yang lebih baik
                    borderRadius: BorderRadius.circular(11),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 6,
                        offset: const Offset(1, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      ClipRect(
                        child: Image.asset(
                          "assets/book-icon-149.png",
                          width: 80, // Atur lebar gambar
                          height: 80, // Atur tinggi gambar
                          fit: BoxFit.cover, // Mengatur ukuran gambar
                        ),
                      ),
                      const SizedBox(
                          width: 12), // Memberikan jarak antara gambar dan teks
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            book.title ??
                                'No Title', // Menampilkan title dari BookModel
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            book.writer ??
                                'No Author', // Menampilkan writer dari BookModel
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
