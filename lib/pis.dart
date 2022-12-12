/*
Algoritmo de Validação do PIS
Formato do PIS : NNNNNNNNNND  Onde:
NNNNNNNNN - Número do Identificador e  D - Dígito Verificador
a) Multiplicar os 11 últimos algarismos pelos pesos conforme abaixo:
Pesos: 3, 2, 9, 8, 7, 6, 5, 4, 3, 2
Digitos:  NNNNNNNNN

Cálculo
3 * N = X1
2 * N = X2
9 * N = X3
8 * N = X4
7 * N = X5
6 * N = X6
5 * N = X7
4 * N = X8
3 * N = X9
2 * N = X10
D (posição do dígito)

b) Somar todos os produtos obtidos no item "a".
Soma = X1 + X2 + X3 + X4 + X5 + X6 + X7 + X8 + X9 + X10

c) Dividir o somatório do item "b" por 11.
Divisão = Soma / 11

d) Subtrair de 11 o resto da divisão do item "c".
Resultado = 11 - resto da Divisão
O resultado será o dígito verificador.
Caso o resultado da subtração seja 10 ou 11, o dígito será 0.
*/

class Pis {
  final peso = [3, 2, 9, 8, 7, 6, 5, 4, 3, 2];
  int? dig;
  List<int> sequencia = [];
  int somaProduto = 0;

  String validador(String value) {
    if (value.length == 11) {
      try {
        sequencia = value.split('').map((e) => int.parse(e)).toList();
        dig = sequencia.last;

        for (int i = 0; i < peso.length; i++) {
          somaProduto += sequencia[i] * peso[i];
        }
      } catch (ex) {
        return ex.toString();
      }

      return ((11 - (somaProduto % 11) >= 10 ? 0 : 11 - (somaProduto % 11)) ==
              dig)
          ? "Pis Válido"
          : "Este Pis não é válido";
    } else {
      return "Valor Inválido. Por favor informe apenas os 11 digitos";
    }
  }
}
