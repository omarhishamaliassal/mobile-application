import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          child: SizedBox(
        width: 300,
        child: TextField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: 10.0, bottom: 10),
            filled: true,
            fillColor: const Color(0xFFF5F5F5),
            hintText: 'Search',
            prefixIcon: const Icon(Icons.search),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 1.0,
              ),
            ),
          ),
        ),
      )),
    );
  }
}
