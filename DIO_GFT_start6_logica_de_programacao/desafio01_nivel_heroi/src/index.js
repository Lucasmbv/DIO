// Para permitir input no console do JS
const prompt = require("prompt-sync")({ sigint: true });

// INPUT - Name
const name = prompt("What your name? ");

// Saudação + Name
console.log("Hello " + name)

// INPUT - Experiênia
let xp = Number(prompt("Qual o seu nível de experiência? "))

// Output - Experiência
console.log("Então seu xp é: " + xp)

// Declarando variável categoria
let categoria

// Identificando categoria do herói
if(xp <= 1000){
    categoria = "Ferro"
} else if((xp > 1000) && (xp <= 2000)){
    categoria = "Bronze"
} else if((xp > 2000) && (xp <= 5000)){
    categoria = "Prata"
} else if((xp > 5000) && (xp <= 7000)){
    categoria = "Ouro"
} else if((xp > 7000) && (xp <= 8000)){
    categoria = "Platina"
} else if((xp > 8000) && (xp <= 9000)){
    categoria = "Ascendente"
} else if((xp > 9000) && (xp <= 10000)){
    categoria = "Imortal"
} else if(xp > 10000){
    categoria = "Radiante"
}


// Output - Mensagem informando o nome e a categoria do herói
console.log(`O Herói de nome ${name} está no nível de ${categoria}.`)