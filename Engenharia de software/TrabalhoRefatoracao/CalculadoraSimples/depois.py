def calcular(numero1: int, numero2: int, operacao: str) -> float:
    """
    Executa uma operação matemática entre dois números.

    Args:
        numero1: Primeiro operando.
        numero2: Segundo operando.
        operacao: Operação desejada (+, -, *, /).

    Returns:
        Resultado da operação.

    Raises:
        ValueError: Caso a operação seja inválida ou haja divisão por zero.
    """

    operacoes = {
        "+": lambda a, b: a + b,
        "-": lambda a, b: a - b,
        "*": lambda a, b: a * b,
        "/": lambda a, b: a / b,
    }

    if operacao not in operacoes:
        raise ValueError("Operação inválida.")

    if operacao == "/" and numero2 == 0:
        raise ValueError("Não é possível dividir por zero.")

    return operacoes[operacao](numero1, numero2)


def main() -> None:
    """Função principal do programa."""

    try:
        numero1 = int(input("Digite um número: "))
        numero2 = int(input("Digite outro número: "))
        operacao = input("Operação (+, -, *, /): ").strip()

        resultado = calcular(numero1, numero2, operacao)

        print(f"Resultado: {resultado}")

    except ValueError as erro:
        print(f"Erro: {erro}")


if __name__ == "__main__":
    main()