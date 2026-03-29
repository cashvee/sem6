import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Demo()));

class Demo extends StatelessWidget {
  final students = ["Alice", "Bob", "Charlie"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Q1–Q4 UI")),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [

          // ---------------- Q1 ----------------
          title("Students"),
          ...students.map((s) => Card(
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text(s),
              subtitle: Text("Department"),
            ),
          )),

          // ---------------- Q2 ----------------
          title("Image Grid"),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 4,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 90, // 👈 smaller images
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (_, i) => ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                "https://picsum.photos/200?random=$i",
                fit: BoxFit.cover,
              ),
            ),
          ),

          // ---------------- Q3 ----------------
          title("Stack Example"),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: [
                Image.network(
                  "https://picsum.photos/400/200",
                  height: 140, // 👈 slightly reduced
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Text(
                    "Beautiful UI",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.black54,
                    ),
                  ),
                )
              ],
            ),
          ),

          // ---------------- Q4 ----------------
          title("Sliver Grid"),
          SizedBox(
            height: 130, // 👈 compact container
            child: CustomScrollView(
              slivers: [
                SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                        (_, i) => Card(
                      elevation: 2,
                      child: Center(child: Text("Item $i")),
                    ),
                    childCount: 4,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 55, // 👈 compact items
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget title(String text) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Text(
      text,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
  );
}