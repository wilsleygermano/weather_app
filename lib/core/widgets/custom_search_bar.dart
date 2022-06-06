import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final Function(String) onChanged;
  const CustomSearchBar({ Key? key, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
                      // style: const TextStyle(color: MyColors.primaryyellow),
                      onChanged: onChanged,
                      // decoration: InputDecoration(
                      //     labelText: 'Nova Senha',
                      //     focusedBorder:  UnderlineInputBorder(
                      //       borderSide: BorderSide(
                      //           color: MyColors.primaryyellow, width: 2),
                      //     ),
                      //     enabledBorder: const UnderlineInputBorder(
                      //       borderSide: BorderSide(
                      //           color: MyColors.primarywhite, width: 2),
                      //     ),
                      //     labelStyle: Theme.of(context).textTheme.headline2
                      //     ),
                    );
  }
}