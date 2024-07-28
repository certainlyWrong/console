import 'package:console/console.dart';

Carro carFactory(String nome) {
  switch (nome) {
    case 'Fusca':
      return Fusca(nome: 'Fusca');
    case 'Ferrari':
      return Ferrari(nome: 'Ferrari');
    case 'Porsche':
      return Porsche(nome: 'Porsche');
    default:
      throw Exception('Carro não encontrado');
  }
}

void main(List<String> arguments) {
  final fusca = carFactory('Fusca');
  fusca.rodas();

  final ferrari = carFactory('Ferrari');
  ferrari.rodas();

  final porsche = carFactory('Porsche');
  porsche.rodas();

  // O método `changeColor` não está na interface `Carro`, mas está na classe
  // concreta `Ferrari`. Podemos trabalhar com a instância `ferrari` como se
  // fosse um `Carro`, mas não podemos chamar o método `changeColor`.
  // ferrari.changeColor('Azul');

  // No entanto, se fizermos um cast para `Ferrari`, podemos chamar o método
  // `changeColor`.
  (ferrari as Ferrari).changeColor('Azul');
  print('Cor da Ferrari: ${(ferrari).cor}');

  // Caso o carro não seja uma instância de `Ferrari`, o cast irá falhar e
  // lançar uma exceção.

  try {
    (fusca as Ferrari).changeColor('Azul');
  } catch (e) {
    print('Erro: o fusca não é uma Ferrari');
  }

  // Vc pode verificar o tipo de uma instância com o operador `is`.
  if (porsche is Ferrari) {
    porsche.changeColor('Azul');
  } else {
    print('Erro: o porsche não é uma Ferrari');
  }

  // Vc pode verificar o tipo de uma instância com o operador `is`.
  if (porsche is Porsche) {
    print('Esse carro é um Porsche');
  } else {
    print('Esse carro não é um Porsche');
  }

  // Também é possivel usar o switch para verificar o tipo de uma instância.
  print(switch (porsche) {
    Porsche() => 'Esse carro é um Porsche',
    Ferrari() => 'Esse carro é uma Ferrari',
    Fusca() => 'Esse carro é um Fusc',
    _ => 'Esse carro é um carro qualquer',
  });
}
