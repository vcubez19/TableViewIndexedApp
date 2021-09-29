//
//  ViewController.swift
//  TableViewIndexedApp
//
//  Created by Vincent Cubit on 9/28/21.
//


import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var petTable: UITableView!
    
    
    let petArray = [["Bird", "parakeet", "parrot", "canary", "finch", "cockatiel"], ["Fish", "tropical fish", "goldfish", "sea horses", "eel"], ["Mammal", "cat", "dog", "hamster", "gerbil", "rabbit", "mouse"], ["Reptile", "turtle", "snake", "lizard"]]
    
    let indexArray = ["B", "F", "M", "R"]
    let cellID = "cellID"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.petTable.delegate = self
        self.petTable.dataSource = self
        self.petTable.sectionIndexColor = .white
        self.petTable.sectionIndexBackgroundColor = .black
        self.petTable.sectionIndexTrackingBackgroundColor = .gray
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.petArray[section].count
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.petArray[section][0]
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.petArray.count
    }
    
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return indexArray
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        
        cell?.textLabel?.text = self.petArray[indexPath.section][indexPath.row]
        
        
        return cell!
        
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        let selectedItem = self.petArray[indexPath.section][indexPath.row]
        
        let display = UIAlertController(title: "Hey there!", message: "You selected \(selectedItem)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        display.addAction(okAction)
        present(display, animated: true, completion: nil)
        
        
    }


}

