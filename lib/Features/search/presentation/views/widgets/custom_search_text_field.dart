import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../manager/search/search_by_title_cubit/search_by_title_cubit.dart';

class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField({super.key});

  @override
  CustomSearchTextFieldState createState() => CustomSearchTextFieldState();
}

class CustomSearchTextFieldState extends State<CustomSearchTextField> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchController,
      onChanged: (value) {
        if (value.isEmpty) {
          context.read<SearchByTitleCubit>().clearSearch();
        } else {
          context.read<SearchByTitleCubit>().searchByTitle(title: value);
        }
      },
      decoration: InputDecoration(
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        hintText: 'Search',
        suffixIcon: IconButton(
          onPressed: () {
            if (_searchController.text.isEmpty) {
              context.read<SearchByTitleCubit>().clearSearch();
            } else {
              context.read<SearchByTitleCubit>().searchByTitle(
                title: _searchController.text,
              );
            }
          },
          icon: const Opacity(
            opacity: .8,
            child: Icon(FontAwesomeIcons.magnifyingGlass, size: 22),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black),
      borderRadius: BorderRadius.circular(12),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
