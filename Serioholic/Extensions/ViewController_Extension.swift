//
//  ViewController_Extension.swift
//  Serioholic
//
//  Created by English on 2023-03-29.
//

import UIKit
extension ViewController : UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchPanel.text?.isEmpty == false {
            return filteredSeries.count
        } else {
            return seriesNow.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue a reusable cell with the identifier "CustomCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? UIMyTableViewCell else {
            fatalError("Unable to dequeue CustomTableViewCell")
        }
        
        var series = seriesNow[indexPath.row]
        
        if searchPanel.text?.isEmpty == false {
            series = filteredSeries[indexPath.row]
        } else {
            series = seriesNow[indexPath.row]
        }
        
        cell.ImageURL = series.img
        cell.serieTitle = series.title
        cell.serieType = series.title_type
        cell.rating = series.rating
        cell.starImg = UIImage(systemName: "star.fill")
        cell.serieYear = series.year
        cell.layer.cornerRadius = 25
        cell.backgroundColor = .lightGray.withAlphaComponent(0.3)
        cell.layer.borderWidth = 5
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ToSecondViewController", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = tableView.indexPathForSelectedRow
        // Get the selected series based on the row index path
        let selectedSeries: Series
        if searchPanel.text?.isEmpty == false {
            selectedSeries = filteredSeries[indexPath!.row]
        } else {
            selectedSeries = seriesNow[indexPath!.row]
        }
        // Get the destination view controller and set the selected series
        let destinationVC = segue.destination as! SecondViewController
        destinationVC.seriesDisplayed = selectedSeries
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredSeries = seriesNow.filter{$0.title.lowercased().contains(searchText.lowercased())}
        tableView.reloadData()
    }
}



