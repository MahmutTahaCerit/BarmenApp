//
//  DetailsViewController.swift
//  BarmenApp
//
//  Created by Mahmut Taha Cerit on 4.07.2022.
//

import UIKit

class DetailsViewController: UIViewController{
    @IBOutlet weak var cocktailImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var cocktailNameLabel: UILabel!
    @IBOutlet weak var strIngredient1Label: UILabel!
    @IBOutlet weak var strIngredient2Label: UILabel!
    @IBOutlet weak var strIngredient3Label: UILabel!
    @IBOutlet weak var strIngredient4Label: UILabel!
    @IBOutlet weak var strIngredient5Label: UILabel!
    @IBOutlet weak var strIngredient6Label: UILabel!
    @IBOutlet weak var strIngredient7Label: UILabel!
    @IBOutlet weak var strIngredient8Label: UILabel!
    @IBOutlet weak var strIngredient9Label: UILabel!
    @IBOutlet weak var strIngredient10Label: UILabel!
    @IBOutlet weak var strIngredient11Label: UILabel!
    @IBOutlet weak var strIngredient12Label: UILabel!
    @IBOutlet weak var strIngredient13Label: UILabel!
    @IBOutlet weak var strIngredient14Label: UILabel!
    @IBOutlet weak var strMeasure1Label: UILabel!
    @IBOutlet weak var strMeasure2Label: UILabel!
    @IBOutlet weak var strMeasure3Label: UILabel!
    @IBOutlet weak var strMeasure4Label: UILabel!
    @IBOutlet weak var strMeasure5Label: UILabel!
    @IBOutlet weak var strMeasure6Label: UILabel!
    @IBOutlet weak var strMeasure7Label: UILabel!
    @IBOutlet weak var strMeasure8Label: UILabel!
    @IBOutlet weak var strMeasure9Label: UILabel!
    @IBOutlet weak var strMeasure10Label: UILabel!
    @IBOutlet weak var strMeasure11Label: UILabel!
    @IBOutlet weak var strMeasure12Label: UILabel!
    @IBOutlet weak var strMeasure13Label: UILabel!
    @IBOutlet weak var strMeasure14Label: UILabel!
    var drinks: Drinks?
    override func viewDidLoad() {
        super.viewDidLoad()
        cocktailNameLabel.text = drinks?.strDrink
        descriptionLabel.text = drinks?.strInstructions
        imageFetch(with: drinks?.strDrinkThumb) { data in
                    self.cocktailImageView.image = UIImage(data: data)
                }
        strIngredient1Label.text = drinks?.strIngredient1
        strIngredient2Label.text = drinks?.strIngredient2
        strIngredient3Label.text = drinks?.strIngredient3
        strIngredient4Label.text = drinks?.strIngredient4
        strIngredient5Label.text = drinks?.strIngredient5
        strIngredient6Label.text = drinks?.strIngredient6
        strIngredient7Label.text = drinks?.strIngredient7
        strIngredient8Label.text = drinks?.strIngredient8
        strIngredient9Label.text = drinks?.strIngredient9
        strIngredient10Label.text = drinks?.strIngredient10
        strIngredient11Label.text = drinks?.strIngredient11
        strIngredient12Label.text = drinks?.strIngredient12
        strIngredient13Label.text = drinks?.strIngredient13
        strIngredient14Label.text = drinks?.strIngredient14
        strMeasure1Label.text = drinks?.strMeasure1
        strMeasure2Label.text = drinks?.strMeasure2
        strMeasure3Label.text = drinks?.strMeasure3
        strMeasure4Label.text = drinks?.strMeasure4
        strMeasure5Label.text = drinks?.strMeasure5
        strMeasure6Label.text = drinks?.strMeasure6
        strMeasure7Label.text = drinks?.strMeasure7
        strMeasure8Label.text = drinks?.strMeasure8
        strMeasure9Label.text = drinks?.strMeasure9
        strMeasure10Label.text = drinks?.strMeasure10
        strMeasure11Label.text = drinks?.strMeasure11
        strMeasure12Label.text = drinks?.strMeasure12
        strMeasure13Label.text = drinks?.strMeasure13
        strMeasure14Label.text = drinks?.strMeasure14
        
        // Do any additional setup after loading the view.
    }
  
    // MARK: - Navigation
    
}
