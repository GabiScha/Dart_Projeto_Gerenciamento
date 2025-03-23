import 'package:gerenciamento/gerenciamento.dart' as nada;
import 'dart:io';

void main() {
  nada.nada();
  print("${nada.linhazinha()}Projeto gerenciamento${nada.linhazinha()}");
  nada.nada();
  print("Qual o nome do produto?");
  String nome = stdin.readLineSync().toString();
  print("Qual o preço do produto?");
  String preco = stdin.readLineSync().toString();
  print("Qual a quantidade em estoque do produto?");
  String quantidadeEstoque = stdin.readLineSync().toString();
  nada.nada();
  print("Deseja adicionar uma descrição do produto? ([S] - Sim / [ENTER] - N)");
  nada.nada();
  String escolha = stdin.readLineSync().toString();
  String? descricao;
  if (escolha == "S")
  {
    print("Digite a descrição do produto:");
    descricao = stdin.readLineSync().toString();
  }
  Produto produto = Produto(nome, double.parse(preco), int.parse(quantidadeEstoque), descricao);


  print("Deseja vender quantas quantidades?");
  String qntvender = stdin.readLineSync().toString();
  if (int.parse(qntvender) >= 1)
  {
    if (produto.vender(int.parse(qntvender)) == true)
    {
      nada.nada();
      print("Produto vendido com sucesso!");
      nada.nada();
    }
    else
    {
      nada.nada();
      print("Quantidade do estoque ecedida");
      nada.nada();
    }
  }
  else{
      nada.nada();
      print("Número inválido ou operação cancelada");
      nada.nada();
  }
  print("Deseja repor quantos ao estoque?");
  String qntrepor = stdin.readLineSync().toString();
  if (int.parse(qntrepor) >= 1)
  {
    if(int.parse(qntrepor) >= 1)
    {
      produto.repor(int.parse(qntvender));
    }
    else{
      nada.nada();
      print("Número inválido ou operação cancelada");
      nada.nada();
    }
  }
  nada.nada();
  print("Obrigado por Utilizar meu programa! - Desenvolvido por GabiScha - ");
  nada.nada();
}

class Produto{
  String nome;
  double preco;
  int quantidadeEmEstoque;
  String? descricao;

  Produto(this.nome, this.preco, this.quantidadeEmEstoque, [this.descricao]);

  bool vender(int quantidade){
    
    bool resultado;

    if ( quantidade <= quantidadeEmEstoque)
    {
      quantidadeEmEstoque-=quantidade;
      resultado = true;
    }
    else
    {
      resultado = false;
    }
    return resultado;
  }

  void repor(int quantidade){
    quantidadeEmEstoque+=quantidade;
  }

}
