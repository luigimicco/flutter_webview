import 'package:flutter/material.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  final TextEditingController _controller = TextEditingController();

  void searchOrNavigate() {
    String query = _controller.text.trim();
    Uri? uri = Uri.tryParse(query);
    bool isUrl = Uri.parse(query).isAbsolute;
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
