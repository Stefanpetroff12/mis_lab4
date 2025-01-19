import 'package:flutter/material.dart';

class Provider extends ChangeNotifier {
  // final _pokemonService = PokemonService();
  // late final List<Pokemon> pokemon;
  // bool _isObscure = true;
  // File? _img = null;
  //
  // PokemonProvider() {
  //   pokemon = _pokemonService.getPokemon();
  // }
  //
  // bool get isObscure => _isObscure;
  // File? get image => _img;
  //
  // void toggleFavorite(Pokemon pokemon) {
  //   pokemon.isFavorite = !pokemon.isFavorite;
  //   notifyListeners();
  // }
  //
  // void toggleVisibility() {
  //   _isObscure = !_isObscure;
  //   notifyListeners();
  // }
  //
  // Future<void> pickImage() async {
  //   final ImagePicker picker = ImagePicker();
  //   try{
  //     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  //     if (pickedFile != null) {
  //       _img = File(pickedFile.path);
  //       print(_img!.path);
  //       notifyListeners();
  //     } else {
  //       print('No image selected.');
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}

