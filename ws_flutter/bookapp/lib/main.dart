import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BookApp',
      debugShowCheckedModeBanner: false,
      home: BookListPage(),
    );
  }
}

class BookListPage extends StatefulWidget {
  const BookListPage({super.key});

  @override
  State<BookListPage> createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  List books = [];
  String query = '';

  Future<void> fetchBooks() async{
    final response =
        await http.get((Uri.parse('http://localhost:8092/api/books')));
    if(response.statusCode == 200){
      setState(() {
        books = json.decode(response.body);
        print(books);
      });
    }
  }

  Future<void> searchBooks(String query) async{
    final response = await http
        .get(Uri.parse('http://localhost:8092/api/books/search?title=$query'));
    if(response.statusCode == 200){
      setState(() {
        books = json.decode(response.body);
      });
    }
  }


  @override
  void initState(){
    super.initState();
    fetchBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Book List'),
        actions: [
          IconButton(onPressed: () async{
            final result = await showSearch(context: context, delegate: BookSearchDelegate(searchBooks));
            if(result != null){
              searchBooks(result);
            }
          }, icon: const Icon(Icons.search)
          )
        ],
      ),
      body: ListView.builder(itemCount: books.length, itemBuilder: (context, index){
        final book = books[index];
        return ListTile(
          title: Text(book['title']),
          subtitle: Text(book['author']),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BookDetailPage(bookId: book['id'])),
            );
          },
        );
      }),
    );
  }
}

class BookDetailPage extends StatelessWidget {
  const BookDetailPage({super.key, required this.bookId});

  final int bookId;

  Future<Map<String, dynamic>> fetchBookDetail() async{
    final response =
        await http.get(Uri.parse('http://localhost:8092/api/book/$bookId'));
    if(response.statusCode == 200){
      return json.decode(response.body);
    }else{
      throw Exception('Failed to load book details');
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Details'),
      ),
      body: FutureBuilder(future: fetchBookDetail(), builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator(),);
        }else if(snapshot.hasError){
          return Center(child: Text('Error: ${snapshot.error}'),);
        }else{
          final book = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Title: ${book['title']}',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                const SizedBox(height: 8,),
                Text('Author: ${book['author']}'),
                Text('Publisher: ${book['publisher']}'),
                Text('Price: \$${book['price']}'),
                const SizedBox(height: 16,),
                Text('Info: ${book['info']}'),

              ],
            ),
          );
        }
      }),
    );
  }
}

class BookSearchDelegate extends SearchDelegate{
  final Function(String) onSearch;

  BookSearchDelegate(this.onSearch);

  @override
  List<Widget>? buildActions(BuildContext context){
    return [
      IconButton(onPressed: () => query = '', icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context){
    return IconButton(onPressed: () => close(context, null), icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context){
    onSearch(query);
    close(context, query);
    return const SizedBox();
  }

  @override
  Widget buildSuggestions(BuildContext context){
    return const Center(child: Text('Enter a book title to search'),);
  }

}