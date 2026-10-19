import 'dart:convert';
import '../models/produto.dart';
import 'produtos_json.dart';

List<Produto> carregarProdutos() {
  try {
    final List<dynamic> lista = jsonDecode(produtosJson);
    return lista
        .map((item) => Produto.fromJson(item as Map<String, dynamic>))
        .toList();
  } catch (e) {
    print('Erro ao ler JSON: $e');
    return [];
  }
}