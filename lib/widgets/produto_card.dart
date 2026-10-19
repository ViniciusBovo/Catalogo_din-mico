import 'package:flutter/material.dart';
import '../models/produto.dart';

class ProdutoCard extends StatelessWidget {
  final Produto produto;
  final VoidCallback? onTap;

  const ProdutoCard({super.key, required this.produto, this.onTap});

  @override
  Widget build(BuildContext context) {
    final critico = produto.temEstoqueCritico;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        onTap: onTap,
        // Nível 3: ícone muda de cor conforme o estoque
        leading: Icon(
          critico ? Icons.notifications_active : Icons.inventory_2,
          color: critico ? Colors.red : Colors.green,
          size: 32,
        ),
        title: Text(
          produto.nomeProduto,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'R\$ ${produto.preco.toStringAsFixed(2)}  •  '
          'Estoque: ${produto.quantidadeEstoque}',
        ),
        trailing: Text(
          produto.disponivel ? 'Disponível' : 'Indisponível',
          style: TextStyle(
            color: produto.disponivel ? Colors.green : Colors.grey,
          ),
        ),
      ),
    );
  }
}