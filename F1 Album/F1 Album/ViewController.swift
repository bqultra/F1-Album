//
//  ViewController.swift
//  F1 Album
//
//  Created by Szymek on 17/05/2023.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    let screenWidth = UIScreen.main.bounds.width - 10
    let screenHeight = UIScreen.main.bounds.height / 6
    var selectedRow = 0

    @IBOutlet weak var construtorLogo: UIImageView!
    
    @IBOutlet weak var chassisLabel: UILabel!
    @IBOutlet weak var seasonLabel: UILabel!
    
    @IBOutlet weak var carImage: UIImageView!
    
    @IBOutlet weak var pickerButton: UIButton!
    
    @IBOutlet weak var lightsOutBtn: UIButton!
    
    let teamLogos = [
        
        "Alfa Romeo": "AR",
        "Alpha Tauri": "AT",
        "Alpine": "AL",
        "Aston Martin": "AM",
        "Haas": "HA",
        "McLaren": "MCL",
        "Mercedes": "MER",
        "Red Bull Racing" : "RB",
        "Scuderia Ferrari": "SF",
        "Williams": "WR"
        
    ]
    
    let ferrariCars = [
        ["SF90", "2019"],
        ["SF1000", "2020"],
        ["SF21", "2021"],
        ["F1-75", "2022"],
        ["SF-23", "2023"]
    ]
    
    let mclarenCars = [
        ["", "2019"],
        ["", "2020"],
        ["MCL35M", "2021"],
        ["", "2022"],
        ["MCL60", "2023"]
    ]
    
    let mercedesCars = [
        ["", "2019"],
        ["", "2020"],
        ["", "2021"],
        ["", "2022"],
        ["", "2023"]
    ]
    
    let alpineCars = [
        ["", "2019"],
        ["", "2020"],
        ["", "2021"],
        ["", "2022"],
        ["", "2023"]
    ]
    
    let astonMartinCars = [
        ["", "2019"],
        ["", "2020"],
        ["", "2021"],
        ["", "2022"],
        ["", "2023"]
    ]
    
    let alfaRomeoCars = [
        ["", "2019"],
        ["", "2020"],
        ["", "2021"],
        ["", "2022"],
        ["", "2023"]
    ]
    
    let alphaTauriCars = [
        ["", "2019"],
        ["", "2020"],
        ["", "2021"],
        ["", "2022"],
        ["", "2023"]
    ]
    
    let haasCars = [
        ["", "2019"],
        ["", "2020"],
        ["", "2021"],
        ["", "2022"],
        ["", "2023"]
    ]
    
    let redBullCars = [
        ["", "2019"],
        ["", "2020"],
        ["", "2021"],
        ["", "2022"],
        ["", "2023"]
    ]
    
    let williamsCars = [
        ["", "2019"],
        ["", "2020"],
        ["", "2021"],
        ["", "2022"],
        ["", "2023"]
    ]
    
    
    @IBAction func pickTeam(_ sender: UIButton) {
        
        let pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: screenWidth, height:screenHeight))
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.selectRow(selectedRow, inComponent: 0, animated: false)
            
        let vc = UIViewController()
        vc.preferredContentSize = CGSize(width: screenWidth, height: screenHeight)
        vc.view.addSubview(pickerView)
        pickerView.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor).isActive = true
        pickerView.centerYAnchor.constraint(equalTo: vc.view.centerYAnchor).isActive = true
                
        let alert = UIAlertController(title: "Choose constructor", message: "", preferredStyle: .actionSheet)

        alert.popoverPresentationController?.sourceView = pickerButton
        alert.popoverPresentationController?.sourceRect = pickerButton.bounds
        alert.setValue(vc, forKey: "contentViewController")
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (UIAlertAction) in }))
        alert.addAction(UIAlertAction(title: "Select", style: .default, handler: { (UIAlertAction) in
                    self.selectedRow = pickerView.selectedRow(inComponent: 0)
                    let selected = Array(self.teamLogos)[self.selectedRow]
                    let name = selected.key
                    self.construtorLogo.image = UIImage(named: self.teamLogos[name]!)
                    self.pickerButton.setTitle(name, for: .normal)

                }))

                self.present(alert, animated: true, completion: nil)
    }
        
    
    
    @IBAction func ctaButton(_ sender: UIButton) {
        
        let currentButton = pickerButton.currentTitle!
        switch currentButton {
        case "Scuderia Ferrari":
            let randomFerrari = Int.random(in: 0 ..< ferrariCars.count)
            carImage.image = UIImage(named: ferrariCars[randomFerrari][0])
            chassisLabel.text = ferrariCars[randomFerrari][0]
            seasonLabel.text = ferrariCars[randomFerrari][1]
        case "McLaren":
            let randomMcLaren = Int.random(in: 0 ..< mclarenCars.count)
            carImage.image = UIImage(named: mclarenCars[randomMcLaren][0])
            chassisLabel.text = mclarenCars[randomMcLaren][0]
            seasonLabel.text = mclarenCars[randomMcLaren][1]
        case "Mercedes":
            let randomMercedes = Int.random(in: 0 ..< mercedesCars.count)
            carImage.image = UIImage(named: mercedesCars[randomMercedes][0])
            chassisLabel.text = mercedesCars[randomMercedes][0]
            seasonLabel.text = mercedesCars[randomMercedes][1]
        case "Alpine":
            let randomAlpine = Int.random(in: 0 ..< alpineCars.count)
            carImage.image = UIImage(named: alpineCars[randomAlpine][0])
            chassisLabel.text = alpineCars[randomAlpine][0]
            seasonLabel.text = alpineCars[randomAlpine][1]
        case "Aston Martin":
            let randomAstonMartin = Int.random(in: 0 ..< astonMartinCars.count)
            carImage.image = UIImage(named: astonMartinCars[randomAstonMartin][0])
            chassisLabel.text = astonMartinCars[randomAstonMartin][0]
            seasonLabel.text = astonMartinCars[randomAstonMartin][1]
        case "Alfa Romeo":
            let randomAlfaRomeo = Int.random(in: 0 ..< alfaRomeoCars.count)
            carImage.image = UIImage(named: alfaRomeoCars[randomAlfaRomeo][0])
            chassisLabel.text = alfaRomeoCars[randomAlfaRomeo][0]
            seasonLabel.text = alfaRomeoCars[randomAlfaRomeo][1]
        case "Alpha Tauri":
            let randomAlphaTauri = Int.random(in: 0 ..< alphaTauriCars.count)
            carImage.image = UIImage(named: alphaTauriCars[randomAlphaTauri][0])
            chassisLabel.text = alphaTauriCars[randomAlphaTauri][0]
            seasonLabel.text = alphaTauriCars[randomAlphaTauri][1]
        case "Haas":
            let randomHaas = Int.random(in: 0 ..< haasCars.count)
            carImage.image = UIImage(named: haasCars[randomHaas][0])
            chassisLabel.text = haasCars[randomHaas][0]
            seasonLabel.text = haasCars[randomHaas][1]
        case "Red Bull Racing":
            let randomRedBull = Int.random(in: 0 ..< redBullCars.count)
            carImage.image = UIImage(named: redBullCars[randomRedBull][0])
            chassisLabel.text = redBullCars[randomRedBull][0]
            seasonLabel.text = redBullCars[randomRedBull][1]
        case "Williams":
            let randomWilliams = Int.random(in: 0 ..< williamsCars.count)
            carImage.image = UIImage(named: williamsCars[randomWilliams][0])
            chassisLabel.text = williamsCars[randomWilliams][0]
            seasonLabel.text = williamsCars[randomWilliams][1]
        default:
            print("Error")
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 30))
        label.text = Array(teamLogos)[row].key
        label.sizeToFit()
        return label
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        teamLogos.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 60
    }


}

