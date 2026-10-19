import 'dart:convert';
import 'package:flutter/material.dart';
import '../data/produtos_json.dart';
import '../models/produto.dart';
import '../widgets/produto_card.dart';
import 'detalhe_screen.dart';

class CatalogoScreen extends StatefulWidget {
  const CatalogoScreen({super.key});

  @override
  State<CatalogoScreen> createState() => _CatalogoScreenState();
}

class _CatalogoScreenState extends State<CatalogoScreen> {
  List<Produto> _produtos = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _recarregar();
  }

  Future<void> _recarregar() async {
    setState(() => _isLoading = true);

    // Simula o tempo de uma chamada de API
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;

    try {
      final List<dynamic> lista = jsonDecode(produtosJson);
      final produtos = lista
          .map((item) => Produto.fromJson(item as Map<String, dynamic>))
          .toList();
      setState(() {
        _produtos = produtos;
        _isLoading = false;
      });
    } catch (e) {
      debugPrint('Erro ao converter JSON: $e');
      setState(() {
        _produtos = [];
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Produtos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Recarregar',
            onPressed: _isLoading ? null : _recarregar,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _produtos.isEmpty
              ? const Center(child: Text('Nenhum produto encontrado.'))
              : ListView.builder(
                  itemCount: _produtos.length,
                  itemBuilder: (context, index) {
                    final produto = _produtos[index];
                    return ProdutoCard(
                      produto: produto,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetalheScreen(produto: produto),
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}