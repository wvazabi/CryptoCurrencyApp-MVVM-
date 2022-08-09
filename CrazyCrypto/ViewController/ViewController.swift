//
//  ViewController.swift
//  CrazyCrypto
//
//  Created by Enes Kaya on 9.08.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    private var cryptoListView : CryptoListViewModel!
    var colorArray = [UIColor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        colorArray = [
            UIColor(red: 180/255, green: 120/255, blue: 150/255, alpha: 1.0),
            UIColor(red: 120/255, green: 190/255, blue: 90/255, alpha: 1.0),
            UIColor(red: 20/255, green: 150/255, blue: 50/255, alpha: 1.0),
            UIColor(red: 70/255, green: 80/255, blue: 190/255, alpha: 1.0),
            UIColor(red: 200/255, green: 70/255, blue: 250/255, alpha: 1.0),
            UIColor(red: 120/255, green: 50/255, blue: 10/255, alpha: 1.0)
        ]
        
        
        
        
       getData()
    
    
    }
    
    func getData(){
        
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        Webservice().downloadCurrencies(url: url) { (cryptos) in
            if let cryptos = cryptos {
                
                self.cryptoListView = CryptoListViewModel(cryptoCurrencyList: cryptos)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cryptoCell", for: indexPath) as! CryptoCell
        
        let cryptoViewModel = self.cryptoListView.cryptoAtIndex(index: indexPath.row)
        
        cell.crytoCurrencyText.text = cryptoViewModel.name
        cell.cryptoToUsdtText.text = cryptoViewModel.price
        cell.backgroundColor = colorArray[indexPath.row % 6]
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  self.cryptoListView == nil ? 0 :  self.cryptoListView.numberOfRowsInSection()
    }

}

