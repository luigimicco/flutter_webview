import 'package:flutter/material.dart';

import 'mywebview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();

  void searchOrNavigate() {
    String query = _controller.text.trim();
    //Uri? uri = Uri.tryParse(query);
    bool isUrl = Uri.parse(query).isAbsolute;

    if (!isUrl) {
      query = 'https://www.google.com/search?q=$query';
    }
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MyWebView(url: query)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Web view"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _controller,
              decoration: const InputDecoration(
                  hintText: "Enter URL or SEARCH",
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.search)),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: searchOrNavigate,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white),
                  child: const Text(
                    "GO",
                    style: TextStyle(fontSize: 18),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
