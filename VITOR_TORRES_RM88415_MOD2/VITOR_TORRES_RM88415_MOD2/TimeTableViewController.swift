import UIKit

class TimeTableViewController: UITableViewController {
    
    var times: [String] = ["São Paulo", "Palmeiras", "Santos", "Corinthians"]
    var estadios: [String] = ["Morumbi", "Allianz Parque", "Vila Belmiro", "Neo Química Arena"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return times.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        cell.textLabel?.text = times[indexPath.row]
        cell.detailTextLabel?.text = estadios[indexPath.row]
        
        // Adiciona o accessoryType do tipo .detailButton
        cell.accessoryType = .detailButton

        return cell
    }

    // Método que lida com o clique no botão de acessório (detailButton)
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let personagemEscolhido = times[indexPath.row]

        // Cria o UIAlertController com o estilo ActionSheet
        let alert = UIAlertController(title: nil, message: "Você escolheu o time \(personagemEscolhido)", preferredStyle: .actionSheet)
        
        // Adiciona um botão "OK" para fechar o alerta
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        // Exibe o alerta
        present(alert, animated: true, completion: nil)
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Remove o item dos arrays
            times.remove(at: indexPath.row)
            estadios.remove(at: indexPath.row)
            
            // Deleta a linha da TableView
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        performSegue(withIdentifier: "TelaXViewController", sender: indexPath)
    }
}
