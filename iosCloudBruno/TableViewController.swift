//
//  TableViewController.swift
//  iosCloudBruno
//
//  Created by user129281 on 7/20/17.
//  Copyright © 2017 BRMART. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var dataSource: [Punk] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableViewAutomaticDimension
        loadBeers()
    }
    func loadBeers() {
        PunkAPI.getBeers { (beers: [Punk]?) in
            if let beers = beers {
                self.dataSource = beers
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "beercell", for: indexPath) as! TableViewCell
        
        let beer = dataSource[indexPath.row]
        cell.ivBeer.image = getImage(color: .white, size: CGSize(width: 50, height: 105))
        cell.lvName.text = beer.name
        cell.lvastr.text = "Teor alcoólico: \(beer.abv)"
        PunkAPI.getBeerPicture(beerImageUrl: beer.image_url, onComplete: { (beerImage:UIImage?) in
            DispatchQueue.main.async {
                cell.ivBeer.image = beerImage
            }
        })
        return cell
    }
    func getImage(color: UIColor, size: CGSize) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ViewController {
            vc.beer = dataSource[tableView.indexPathForSelectedRow!.row]
            vc.beerImage = (tableView.cellForRow(at: tableView.indexPathForSelectedRow!) as! TableViewCell).ivBeer.image!
        }
    }
}
