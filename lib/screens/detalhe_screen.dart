import 'package:flutter/material.dart';
import '../models/produto.dart';

class DetalheScreen extends StatelessWidget {
  final Produto produto;

  const DetalheScreen({super.key, required this.produto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(produto.nomeProduto)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Código: ${produto.idProduto}'),
            const SizedBox(height: 8),
            Text(
              'R\$ ${produto.preco.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 8),
            Text('Estoque: ${produto.quantidadeEstoque} unidades'),
            if (produto.temEstoqueCritico)
              const Text(
                'Atenção: estoque crítico!',
                style: TextStyle(color: Colors.red),
              ),
            const SizedBox(height: 8),
            Text(produto.disponivel ? 'Disponível' : 'Indisponível'),
          ],
        ),
      ),
    );
  }
}