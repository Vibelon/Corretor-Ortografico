from difflib import SequenceMatcher



#recebendo o texto do usuário e o preparando para ser corrigido
texto = input("Digite o texto que deseja corrigir: ")
palavras = texto.split()

# Abrindo um arquivo para leitura
with open(r'dicionários\dicionario_portugues3.txt', 'r', encoding='utf-8') as arquivo:
    dicionário = arquivo.read()  # Lê o conteúdo do arquivo inteiro

dicionário = dicionário.split()
semelhanças = []
texto_corrigido = []


for palavra in palavras:
    for dict in dicionário:
        if palavra == dict:
            texto_corrigido.append(palavra)
            semelhanças.clear()
            break
        else:
            semelhanças.append(SequenceMatcher(None, palavra, dict).ratio())
    else:
        similaridade = max(semelhanças)
        similaridade = semelhanças.index(similaridade)
        texto_corrigido.append(dicionário[similaridade])
        semelhanças.clear()

x= ""
for texto in texto_corrigido:
    x = x + texto
    x = x + " "

print(x)