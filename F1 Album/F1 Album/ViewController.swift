//
//  ViewController.swift
//  F1 Album
//
//  Created by Szymek on 17/05/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var construtorLogo: UIImageView!
    
    @IBOutlet weak var chassisLabel: UILabel!
    @IBOutlet weak var seasonLabel: UILabel!
    
    @IBOutlet weak var carImage: UIImageView!
    
    @IBOutlet weak var lightsOutBtn: UIButton!
    
    let teamLogos = ["Scuderia Ferrari": "SF"]
    
    let ferrariCars = [
        ["F1-75", "2022"]
    ]
    
    @IBAction func pickTeam(_ sender: UIButton) {
        
        construtorLogo.image = UIImage(named: teamLogos["Scuderia Ferrari"]!)
        
    }
    
    @IBAction func ctaButton(_ sender: UIButton) {
        
        carImage.image = UIImage(named: ferrariCars[0][0])
        chassisLabel.text = ferrariCars[0][0]
        seasonLabel.text = ferrariCars[0][1]
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }


}

