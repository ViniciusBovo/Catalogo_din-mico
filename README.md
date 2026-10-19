# 📱 Catálogo Dinâmico

Aplicativo desenvolvido em **Flutter** para exibição e navegação de um catálogo dinâmico de produtos a partir de dados em formato **JSON**. O projeto simula uma chamada de API assíncrona, desserializa os dados para modelos tipados em Dart, aplica regras de negócio (alerta de estoque crítico) e apresenta feedback visual dinâmico por meio de componentes modulares.

---

## 🚀 Funcionalidades

- **Carregamento Assíncrono com Loading**: Simulação de requisição de rede/API com tempo de resposta (2 segundos) e indicador circular de progresso (`CircularProgressIndicator`).
- **Recarregamento Dinâmico (Refresh)**: Botão de ação na barra superior (`AppBar`) para recarregar os dados a qualquer momento, prevenindo requisições concorrentes enquanto estiver carregando.
- **Listagem com Cards Personalizados**: Apresentação dos itens utilizando o componente reutilizável `ProdutoCard`.
- **Regra de Negócio de Estoque Crítico**: Verificação automática de estoque baixo através do getter `temEstoqueCritico` (`quantidadeEstoque < 5`).
- **Feedback Visual Dinâmico**:
  - **Ícones Indicadores**: Ícone de notificação ativo em vermelho (`Icons.notifications_active`) para estoque crítico vs. ícone verde de inventário (`Icons.inventory_2`) para estoque regular.
  - **Status de Disponibilidade**: Indicação visual de `Disponível` (verde) ou `Indisponível` (cinza) tanto no card quanto na tela de detalhes.
- **Navegação com Detalhes Completos**: Ao tocar em um produto, navega para a `DetalheScreen`, exibindo:
  - Código identificador (`idProduto`)
  - Nome do produto
  - Preço formatado em reais (`R$`)
  - Quantidade em estoque
  - Alerta textual destacado quando o estoque estiver em nível crítico
  - Situação de disponibilidade
- **Desserialização JSON Segura**: Conversão dos campos do JSON (`snake_case`) diretamente para atributos em Dart (`camelCase`) com `Produto.fromJson`.
- **Tratamento de Exceções**: Fallback seguro contra erros de formatação ou parsing do JSON sem interrupção do app.

---

## 🛠️ Tecnologias Utilizadas

- **[Flutter](https://flutter.dev/)** (SDK 3.13+)
- **[Dart](https://dart.dev/)**
- **Material Design 3** (`MaterialApp` com `colorSchemeSeed`)
- **JSON & Utilitários nativos**: `dart:convert`

---

## 📂 Estrutura do Projeto

O código-fonte da aplicação está estruturado dentro da pasta `lib/` da seguinte forma:

```text
lib/
├── data/
│   ├── produto_repository.dart  # Função auxiliar para decode do JSON em lista de objetos Produto
│   └── produtos_json.dart       # Mock/base de dados simulada em formato JSON (peças industriais)
├── models/
│   └── produto.dart             # Modelo Produto (atributos, getter temEstoqueCritico e factory fromJson)
├── screens/
│   ├── catalogo_screen.dart     # Tela principal (StatefulWidget) com simulação de API, loading, refresh e listagem
│   └── detalhe_screen.dart      # Tela de detalhes do produto com alertas visuais
├── widgets/
│   └── produto_card.dart        # Componente visual (Card) com ícone de alerta de estoque e status
└── main.dart                    # Ponto de entrada da aplicação (configuração do MaterialApp e tema)
```

---

## 🧩 Modelo de Dados

O aplicativo consome e manipula os dados de produtos com a seguinte estrutura:

### Exemplo do JSON (`produtos_json.dart`):

```json
{
  "id_produto": 12345,
  "nome_produto": "Turbina de Alta Pressão",
  "preco": 450.00,
  "quantidade_estoque": 3,
  "disponivel": true
}
```

### Mapeamento no Modelo Dart ([`Produto`](lib/models/produto.dart)):

| Campo Dart | Tipo | Campo JSON correspondente | Descrição |
| :--- | :--- | :--- | :--- |
| `idProduto` | `int` | `id_produto` | Identificador único do produto |
| `nomeProduto` | `String` | `nome_produto` | Nome / descrição do item |
| `preco` | `double` | `preco` | Preço unitário |
| `quantidadeEstoque` | `int` | `quantidade_estoque` | Quantidade disponível no estoque |
| `disponivel` | `bool` | `disponivel` | Indica se o produto está ativo/disponível |
| `temEstoqueCritico` | `bool` | *(Getter)* | Retorna `true` se `quantidadeEstoque < 5` |

---

## 📋 Pré-requisitos

Antes de iniciar, certifique-se de ter instalado em sua máquina:

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (versão compatível com Dart ^3.13.0)
- Um emulador configurado (Android/iOS) ou dispositivo físico com modo de desenvolvedor ativado, ou suporte para Desktop/Web habilitado.
- Editor recomendado: [VS Code](https://code.visualstudio.com/) com extensões Flutter e Dart, ou [Android Studio](https://developer.android.com/studio).

---

## ⚙️ Como Executar o Projeto

1. **Acesse a pasta do repositório:**
   ```bash
   cd catalogo_dinamico
   ```

2. **Instale as dependências do Flutter:**
   ```bash
   flutter pub get
   ```

3. **Verifique os dispositivos disponíveis:**
   ```bash
   flutter devices
   ```

4. **Execute o aplicativo:**
   ```bash
   flutter run
   ```

---

## 📄 Licença

Este projeto foi desenvolvido para fins educacionais e de estudo sobre desenvolvimento mobile com Flutter. Sinta-se à vontade para utilizá-lo e adaptá-lo!
