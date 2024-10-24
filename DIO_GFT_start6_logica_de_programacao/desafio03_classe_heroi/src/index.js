// Para permitir input no console do JS
const prompt = require('prompt-sync')();

// Criando a classe hero
class hero{
    constructor(name, age, typeNumber){
        this.name = name
        this.age = age
        this.typeNumber = typeNumber
        this.typeName = ""
        this.attack = ""

        // Convertendo - opção do herói em dado
        switch (this.typeNumber) {
          case "1":
            this.typeName = "Mago"
            this.attack = "magia"
            break;
          case "2":
            this.typeName = "Guerreiro"
            this.attack = "espada"
            break;
          case "3":
            this.typeName = "Monge"
            this.attack = "artes marciais"
            break;
          case "4":
            this.typeName = "Ninja"
            this.attack = "shuriken"
            break;
        }

        
    }

    // Método atacar
    toAttack(){
      console.log(`O ${this.typeName} atacou usando ${this.attack}.`)
    }

}

// let hero1 = new hero("Mag", 36, "Mago")

// INPUT - Nome e idade do herói
let name0 = prompt("Digite o nome do seu herói: ")
let age0 = Number(prompt("Digite a idade do seu herói: "))
let typeNumber

// INPUT - Tipo do herói
do {
  console.log("1 - Mago")
  console.log("2 - Guerreiro")
  console.log("3 - Monge")
  console.log("4 - Ninja")
  typeNumber = prompt("Digite o número correspondente ao tipo do seu herói: ")
} while(!(typeNumber > 0 && typeNumber < 5))

// Instanciando um objeto
let hero2 = new hero (name0,age0,typeNumber)

// OUTPUT - Conversação 
console.log(`Olá ${hero2.name}`)
console.log(`Você já tem ${hero2.age} anos, deve ser um ${hero2.typeName} muito experiente.`)
console.log("Você poderia demonstrar as suas habilidades?")

console.log(`${hero2.name}, O ${hero2.typeName}: Claro, meu amigo...`)

// Utilizando um método
hero2.toAttack()
