// Para permitir input no console do JS
const prompt = require("prompt-sync")({ sigint: true });

// Função - Contar saldo de vitórias
function saldoVitorias(victories, defeats) {
    let saldo = victories - defeats
    return saldo
}


// INPUT - Vitórias e Derrotas
const victories = prompt("Você obteve quantas vitórias? ");

const defeats = prompt("Você obteve quantas derrotas? ");

// Chamando função para calcular saldo de vitórias
let saldo = saldoVitorias(victories,defeats)

// Declarando variável categoria
let nivel

// Identificando categoria do herói
if(saldo <= 10){
    nivel = "Ferro"
} else if((saldo > 10) && (saldo <= 20)){
    nivel = "Bronze"
} else if((saldo > 20) && (saldo <= 50)){
    nivel = "Prata"
} else if((saldo > 50) && (saldo <= 80)){
    nivel = "Ouro"
} else if((saldo > 80) && (saldo <= 90)){
    nivel = "Diamante"
} else if((saldo > 90) && (saldo <= 100)){
    nivel = "Lendário"
} else if(saldo > 100){
    nivel = "Imortal"
}


// Output - Mensagem informando o Saldo de vitórias e a categoria do herói.
console.log(`O Herói tem o saldo de ${saldo} vitórias e está no nível ${nivel}.`)