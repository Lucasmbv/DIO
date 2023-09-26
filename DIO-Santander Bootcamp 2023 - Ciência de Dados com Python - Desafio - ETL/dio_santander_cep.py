import requests
import json
import csv

ceps = []
loc = []

# 1. abrir o arquivo
with open('santanderbrasil.csv', encoding='utf-8') as arquivo_referencia:

  # 2. ler o arquivo
  tabela = csv.reader(arquivo_referencia, delimiter=';')

  # 3. extrair informações do arquivo
  for i, l in enumerate(tabela):
    if i != 0:
      cep = l[0]

  # 4. transformar informações
      link = f"https://brasilapi.com.br/api/cep/v1/{cep}"
      a = requests.get(link)
      end = a.json()
      estado = end['state']
      cidade = end['city']
      bairro = end['neighborhood']
      rua = end['street']

      local = (f"Santander em {cidade}-{estado}: Logradouro: {rua}, bairro: {bairro}.")

      ceps.append(cep)
      loc.append(local)


  # 5. carregar novas informações em outro arquivo
with open('agencias_santander.csv', 'w', encoding='utf-8', newline='') as csvfile:
    spamwriter = csv.writer(csvfile, delimiter=';',)
    spamwriter.writerow(['CEPs'] + ['Local'])

    for cep, local in zip(ceps, loc):
      spamwriter.writerow([cep] + [local])