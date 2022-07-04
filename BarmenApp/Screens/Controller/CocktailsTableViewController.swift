//
//  CocktailsTableViewController.swift
//  BarmenApp
//
//  Created by Mahmut Taha Cerit on 3.07.2022.
//

import UIKit

class CocktailsTableViewController: UITableViewController, UISearchResultsUpdating {

    private var responseFetch: CocktailsModel?{
            didSet{
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    private var selectedTitle: Drinks?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Cocktails"
        fetchData()
        setupSearchController()
    }
    // MARK: - Fetch Request
    private func fetchData(){
        guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita")else { return }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                debugPrint(error)
            }
            if let data = data, let response = try? JSONDecoder().decode(CocktailsModel.self, from: data){
                self.responseFetch = response
            }
        }.resume()
    }
    private func searchData(with text: String){
        guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=\(text)")else { return }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                debugPrint(error)
            }
            if let data = data, let response = try? JSONDecoder().decode(CocktailsModel.self, from: data){
                self.responseFetch = response
            }
        }.resume()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return responseFetch?.drinks?.count ?? .zero
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let drinks = responseFetch?.drinks?[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CocktailCell", for: indexPath) as! CocktailTableViewCell
        cell.coctailNameLabel.text = drinks?.strDrink
        cell.categoryLabel.text = drinks?.strCategory
        cell.alcoholicLabel.text = drinks?.strAlcoholic
        imageFetch(with: (drinks?.strDrinkThumb)) { data in
            cell.cocktailImageView.image = UIImage(data: data)
        }
        // Configure the cell...
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedTitle = responseFetch?.drinks?[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? DetailsViewController {
            viewController.drinks = selectedTitle
        }
    }
    // MARK: - SearchController
    private func setupSearchController() {
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Type something here to search"
        navigationItem.searchController = search
    }
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        searchData(with: text)
        print(text)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
