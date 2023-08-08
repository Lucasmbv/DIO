from datetime import datetime as dt

##  Declarando variáveis

LIMITE_SAQUE = 3
LIMITE_VALOR = 500.00
extrato = []
user_list = {} # ATENÇÃO AO PASSAR PARAMETRO
conta_list = []
user = None

## CRIAR USUÁRIO
def criar_user():
    #nome, cpf, data nascimento e endereço
    cpf = input("Digite o seu CPF (só números): ")
    
    if (cpf in user_list):
            print("! CPF já cadastrado !")
    else:
        nome = input("Informe o nome completo: ")
        nasc = input("Informe a data de nascimento (dd-mm-aaaa): ")
        end = input("Informe endereço (logradouro, nro - bairro - cidade/sigla estado): ")
        senha = input("Digite uma senha: ")     ## Estudar uma forma mais segura de salvar senha!
        user_list[cpf] = {
            "nome": nome,
            "cpf": cpf,
            "nasc": nasc,
            "end": end,
            "senha": senha 
        }

        print(f"- Deu tudo certo, {nome} :)")
        print("- Usuário cadastrado com sucesso")
    return cpf, nome

## CRIAR CONTA BANCARIA
def criar_conta():
    cpf = input("Informe o seu CPF: ")

    if not (cpf in user_list):
        print("! CPF não cadastrado - É necessário criar conta de usuário !")
    else:
        ag = "0001"
        if len(conta_list) == 0:
            conta = 1
        else: 
            conta = len(conta_list)+1
        
        list_tupla = (cpf, ag, conta)
        conta_list.append(list_tupla)
        
        print(f"- Deu tudo certo, {user_list[cpf]['nome']} :)")
        print("- Conta bancária cadastrada com sucesso")
        print("Sua nova conta bancária:")
        print(f"Agência: {ag} - Conta: {conta}")

##  Calculando saldo
def soma_saldo(extrato):
    saldo = 0
    for i in range(len(extrato)):
        if extrato[i][1] == "Deposito":
            saldo += extrato[i][4]
        else:
            saldo -= extrato[i][4]

    return saldo

## FUNÇÃO DEPÓSITO
def deposito(extrato, user, /):
    print("- Ok, então você deseja realizar um depósito :)")
    dep_temp = float(input("- Quanto você gostaria de depositar? R:"))
    
    if dep_temp > 0:
        date = dt.now()
        day = date.strftime("%x")
        hour = date.strftime("%X")
        op = "Deposito"
            
        ext_tupla = (user, op, day, hour, dep_temp)
        extrato.append(ext_tupla)
        print(f"- Depósito de R$ {dep_temp:.2f} realizado com sucesso.")
    else:
        print("! Opção inválida - Deposite valor superior a 0 !")

    return extrato

## FUNÇÃO SAQUE
def saque(*, extrato, LIMITE_SAQUE, LIMITE_VALOR, user):
    
    # Caulando a quantidade de saques realizados no dia
    limit = 0
    date = dt.now()
    hoje = date.strftime("%x")

    for i in range(len(extrato)):
        if (extrato[i][1] == "Saque") and (extrato[i][2] == hoje):
            limit += 1
    
    # Limite de saques diário atingido
    if limit == 3:
        print("! Opção inválida - Você já atingiu o limite máximo de 3 saques por dia !")
    
    else:
        
        saldo = soma_saldo(extrato)
        print("- Ok, então você deseja realizar um saque :)")
        print(f"- Seu saldo é R$ {saldo:.2f}.")
        print(f"- Você pode realizar até {LIMITE_SAQUE} saques por dia. Hoje você realizou {limit} saques.")
        print(f"- Você pode sacar o limite máximo de R$ {LIMITE_VALOR:.2f} por saque.\n")
        
        saq_temp = float(input("- Quanto você gostaria de sacar? R:"))

        # Validando a requisição de saque
        if saq_temp > saldo:
            print("! Operação inválida - Saldo insuficiente !")
        
        elif saq_temp > LIMITE_VALOR:
            print("! Operação inválida - Saque ultrapassou o limite !")

        elif saq_temp <= 0:
            print("! Operação inválida - Valor inválido !")

        # Realizando o saque
        else: 
            date = dt.now()
            day = date.strftime("%x")
            hour = date.strftime("%X")
            op = "Saque"
            ext_tupla = (user, op, day, hour, saq_temp)
            extrato.append(ext_tupla)
            print(f"- Saque de R$ {saq_temp:.2f} realizado com sucesso.")

    return extrato

## Calculando limite de saques
def limit_saq(extrato):
    limit = 0
    date = dt.now()
    hoje = date.strftime("%x")

    for i in range(len(extrato)):
        if (extrato[i][1] == "Saque") and (extrato[i][2] == hoje):
            limit += 1

    return limit

##FUNÇÃO EXTRATO
def exibir_extrato():
    saldo = soma_saldo(extrato)
            
    if saldo == 0:
        print("- Não foram realizadas movimentações")
    else:
        print("\n============================= EXTRATO =============================")
        print("== Operação --- \t Data\t\t ---- \t\tValor da operação")
        for i in range(len(extrato)):

            if extrato[i][1] == "Saque":
                print(extrato[i][1],"\t\t\t", extrato[i][2], extrato[i][3], "\t\t", "-R$", extrato[i][4])
            else:
                print(extrato[i][1],"\t\t", extrato[i][2], extrato[i][3], "\t\t", "R$", extrato[i][4])
    
        print(f"--------- SALDO: R$ {saldo:.2f}\n")


## INÍCIO DO PROGRAMA

print("=============== Bem vindo ao Banco Dio ===============")

while True: 
    print(f"""============== O que você deseja fazer? ============== 
    [nu] Novo Usuario
    [cc] Criar conta bancária
    [de] Depósito
    [sa] Saque
    [ex] Extrato
    [sr] Sair""")
    comando = input("R: ")

    match comando:
        case "nu":                           #Criando novo usário
            cpf, nome = criar_user()
        
        case "cc":                           #Criando conta bancária
            criar_conta()
        
        case "de":                           #Realizando depósito
            deposito(extrato, nome)

        case "sa":                           #Realizando saque
            saque(extrato = extrato, LIMITE_SAQUE = LIMITE_SAQUE, LIMITE_VALOR = LIMITE_VALOR, user = nome)


        case "ex":                           #Realizando extrato
            exibir_extrato()
            
                     
        case "sr":                           #Realizando saída
            print("\n- Obrigado pela preferência :)")
            break
        case _:                               #Comando inválido
            print("! Opção inválida - Tente novamente !")