library console;

/// Classe abstrata
///
/// Esse tipo de classe não pode ser instanciada por causa do modificador
/// `abstract`. Ela é usada para definir um contrato que outras classes devem seguir
///
/// A classe abstrata pode ter métodos abstratos e concretos, mas como
/// essa classe também usar o modificador `interface`, todos os métodos
/// devem ser abstratos.
///
/// Portanto, a classe `Carro` é uma interface que define um contrato. Não pode
/// ser instanciada e, muito menos, ter métodos concretos.
abstract interface class Carro {
  void rodas();
}

/// Classes concretas
///
/// Essas classes são as que implementam a interface `Carro`. Por causa
/// do modificador `interface` na classe `Carro` todos os métodos devem
/// ser implementados. Caso contrário, o desenvolvedor teria a possibilidade
/// de não precisar implementar alguns dos métodos.
///
/// Além disso, a classe `Fusca` possui um atributo `nome` que não está na
/// interface `Carro`. Isso é permitido, pois a interface é um contrato
/// que deve ser seguido, mas a classe concreta pode ter mais atributos.
///
/// Estamos fechados para modificação, mas abertos para extensão.
class Fusca extends Carro {
  final String nome;

  Fusca({required this.nome});

  @override
  void rodas() {
    print('Fusc tem 4 rodas');
  }
}

/// Classes concretas
///
/// Essas classes são as que implementam a interface `Carro`. Por causa
/// do modificador `interface` na classe `Carro` todos os métodos devem
/// ser implementados. Caso contrário, o desenvolvedor teria a possibilidade
/// de não precisar implementar alguns dos métodos.
///
/// Além disso, a classe `Ferrari` tem um método `changeColor` que não está
/// na interface `Carro`. Isso é permitido, pois a interface é um contrato
/// que deve ser seguido, mas a classe concreta pode ter mais métodos.
///
/// Estamos fechados para modificação, mas abertos para extensão.
class Ferrari extends Carro {
  final String nome;
  String cor;

  Ferrari({
    required this.nome,
    this.cor = 'Vermelho',
  });

  changeColor(String color) {
    cor = color;
  }

  @override
  void rodas() {
    print('Ferrari tem 4 rodas');
  }
}

class Porsche extends Carro {
  final String nome;

  Porsche({required this.nome});

  @override
  void rodas() {
    print('Porsche tem 4 rodas');
  }
}
