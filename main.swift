import Foundation
// funções usadas
func listarTarefas(tarefas: [String]) -> Void {
    var cont = 0
    
    if tarefas.isEmpty {
        print("Não há tarefas registradas.")
    } else { 
        for i in tarefas {
            cont += 1
            print("\(cont). \(i).")
            }
    }
}

func adicionarTarefa(tarefas: [String], tarefa: String) -> [String] {
    var listaInterna = tarefas
    listaInterna.append(tarefa)
    return listaInterna
}

func removerTarefa(tarefas: [String], numTarefa: Int) -> [String]{
    var listaInterna = tarefas
    listaInterna.remove(at: numTarefa - 1)
    return listaInterna
    }

func editarTarefa(tarefas: [String], numTarefa: Int, editado: String) -> [String] {
    var listaInterna = tarefas
    listaInterna.remove(at: numTarefa - 1)
    listaInterna.insert(editado, at: numTarefa - 1)
    return listaInterna
    
}
// código principal

//variáveis usadas
var lista: [String] = []
var opcao = -1
var tarefaAdd: String? 
var numTarefaRem: String?
var numTarefaEdit: String?
var tarefaEdit: String?

//loop de funcionamento
repeat {
    print("""
    === Lista de Tarefas ===
    1 - Listar tarefas
    2 - Adicionar tarefa
    3 - Remover tarefa
    4 - Editar tarefa
    0 - Sair
    Escolha uma opção:
    """)
    
    guard let entrada = readLine(), 
        let opcao1 = Int(entrada) else{
        print("Nada foi informado")
        continue
    }
    opcao = opcao1
    
    switch opcao {
        case 1:
            listarTarefas(tarefas: lista)
        case 2:
            print("Informe a tarefa a ser adicionada: ")
            tarefaAdd = readLine()
            guard let tarefaAdd = tarefaAdd else {
                print("Nenhuma tarefa foi informada.")
                continue
            }
            lista = adicionarTarefa(tarefas: lista, tarefa: tarefaAdd)
        case 3:
            print("Informe o número da tarefa á ser removida: ")
            numTarefaRem = readLine()
            guard let numTarefaRem = numTarefaRem, let numTarefaRem = Int(numTarefaRem) else {
                print("Nenhuma tarefa foi informada ou não foi informado um número.")
                continue
                }
            if numTarefaRem <= lista.count{
                lista = removerTarefa(tarefas: lista, numTarefa: numTarefaRem)
            } else {
                print("Informe uma tarefa válida.")
            }
        case 4:
            print("Informe o número da tarefa á ser editada: ")
            numTarefaEdit = readLine()
            guard let numTarefaEdit = numTarefaEdit, let numTarefaEdit = Int(numTarefaEdit) else {
                print("Nenhuma tarefa foi informada ou não foi informado um número.")
                continue
            }
            if numTarefaEdit <= lista.count {
                print("Informe a edição á ser feita: ")
                tarefaEdit = readLine()
                guard let tarefaEdit = tarefaEdit else {
                    print("Nenhuma edição foi informada.")
                    continue
                }
                lista = editarTarefa(tarefas: lista, numTarefa: numTarefaEdit, editado: tarefaEdit)
            } else {
                print("Informe uma tarefa válida!")
            }
        case 0: 
            print("Encerrando o programa")
        default:
            print("Informe uma opção válida")
            
    }
} while opcao != 0 
    
