import 'package:flutter/material.dart';

class MovieDetailScreen extends StatefulWidget {
  final int id;
  const MovieDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("${widget.id}"),
      ),
    );
  }
}
