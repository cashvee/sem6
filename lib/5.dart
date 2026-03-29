import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(ProductApp());
}

class ProductApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProductScreen extends StatelessWidget {
  Future<List<dynamic>> fetchProducts() async {
    final response = await http
        .get(Uri.parse('https://fakestoreapi.com/products'));

    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Products API")),
      body: FutureBuilder(
        future: fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final product = snapshot.data![index];

                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    leading: Image.network(product['image'], width: 50),
                    title: Text(product['title']),
                    subtitle: Text("\$${product['price']}"),
                  ),
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}