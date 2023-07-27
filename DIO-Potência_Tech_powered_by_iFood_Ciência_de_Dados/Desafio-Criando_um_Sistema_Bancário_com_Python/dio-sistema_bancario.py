from datetime import datetime as dt

##  Declarando variáveis
saudação = "=============== Bem vindo ao Banco Dio ==============="
menu = f"""============== O que você deseja fazer? ============== 
    [d] Depósito
    [s] Saque
    [e] Extrato
    [q] Sair
"""

LIMITE_SAQUE = 3
LIMITE_VALOR = 500.00
extrato = []

user = "Lucas"          #Para futura implementação de controle de user


##  Calculando saldo
def soma_saldo(extrato):
    saldo = 0
    for i in range(len(extrato)):
        if extrato[i][1] == "Deposito":
            saldo += extrato[i][4]
        else:
            saldo -= extrato[i][4]

    return saldo


## Calculando limite de saques
def limit_saq(extrato):
    limit = 0
    date = dt.now()
    hoje = date.strftime("%x")

    for i in range(len(extrato)):
        if (extrato[i][1] == "Saque") and (extrato[i][2] == hoje):
            limit += 1

    return limit

print(saudação)

while True: 
    comando = input(menu + "R: ")

    match comando:
        case "d":                           #Realizando depósito
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

                        

        case "s":                           #Realizando saque
            limit = limit_saq(extrato)
            
            if limit == 3:
                print("! Opção inválida - Você já atingiu o limite máximo de 3 saques por dia !")
            
            else:
                saldo = soma_saldo(extrato)
                print("- Ok, então você deseja realizar um saque :)")
                print(f"- Seu saldo é R$ {saldo:.2f}.")
                print(f"- Você pode realizar até {LIMITE_SAQUE} saques por dia. Hoje você realizou {limit} saques.")
                print(f"- Você pode sacar o limite máximo de R$ {LIMITE_VALOR:.2f} por saque.\n")
                
                saq_temp = float(input("- Quanto você gostaria de sacar? R:"))

                if saq_temp > saldo:
                    print("! Opção inválida - Saldo insuficiente !")
                
                elif saq_temp > LIMITE_VALOR:
                    print("! Opção inválida - Saque ultrapassou o limite !")

                elif saq_temp <= 0:
                    print("! Opção inválida - Valor inválido !")

                else: 
                    date = dt.now()
                    day = date.strftime("%x")
                    hour = date.strftime("%X")
                    op = "Saque"
                    ext_tupla = (user, op, day, hour, saq_temp)
                    extrato.append(ext_tupla)
                    print(f"- Saque de R$ {saq_temp:.2f} realizado com sucesso.")


        case "e":                           #Realizando extrato
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
            
                     
        case "q":                           #Realizando saída
            print("- Obrigado pela preferência :)")
            break
        case _:                             #Comando inválido
            print("! Opção inválida - Tente novamente !")