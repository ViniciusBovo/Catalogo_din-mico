class Produto {
  final int idProduto;
  final String nomeProduto;
  final double preco;
  final int quantidadeEstoque;
  final bool disponivel;

  const Produto({
    required this.idProduto,
    required this.nomeProduto,
    required this.preco,
    required this.quantidadeEstoque,
    required this.disponivel,
  });

  // Regra de negócio crítica: estoque menor que 5
  bool get temEstoqueCritico => quantidadeEstoque < 5;

  // Bônus: factory que converte o JSON em objeto
  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      idProduto: json['id_produto'] as int,
      nomeProduto: json['nome_produto'] as String,
      preco: (json['preco'] as num).toDouble(),
      quantidadeEstoque: json['quantidade_estoque'] as int,
      disponivel: json['disponivel'] as bool,
    );
  }
}