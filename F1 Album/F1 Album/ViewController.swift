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
        ["MCL34", "2019"],
        ["MCL35", "2020"],
        ["MCL35M", "2021"],
        ["MCL36", "2022"],
        ["MCL60", "2023"]
    ]
    
    let mercedesCars = [
        ["W10", "2019"],
        ["W11", "2020"],
        ["W12", "2021"],
        ["W13", "2022"],
        ["W14", "2023"]
    ]
    
    let alpineCars = [
        ["A521", "2021"],
        ["A522", "2022"],
        ["A523", "2023"]
    ]
    
    let astonMartinCars = [
        ["AMR21", "2021"],
        ["AMR22", "2022"],
        ["AMR23", "2023"]
    ]
    
    let alfaRomeoCars = [
        ["C38", "2019"],
        ["C39", "2020"],
        ["C41", "2021"],
        ["C42", "2022"],
        ["C43", "2023"]
    ]
    
    let alphaTauriCars = [
        ["AT01", "2020"],
        ["AT02", "2021"],
        ["AT03", "2022"],
        ["AT04", "2023"]
    ]
    
    let haasCars = [
        ["VF-19", "2019"],
        ["VF-20", "2020"],
        ["VF-21", "2021"],
        ["VF-22", "2022"],
        ["VF-23", "2023"]
    ]
    
    let redBullCars = [
        ["RB15", "2019"],
        ["RB16", "2020"],
        ["RB16B", "2021"],
        ["RB18", "2022"],
        ["RB19", "2023"]
    ]
    
    let williamsCars = [
        ["FW42", "2019"],
        ["FW43", "2020"],
        ["FW43B", "2021"],
        ["FW44", "2022"],
        ["FW45", "2023"]
    ]
    
    struct loadCar {
        let carArray: [[String]],
            mainCarImg: UIImageView,
            mainChassisLabel: UILabel,
            mainSeasonLabel: UILabel,
            constructorButton: UIButton,
            buttonColor: UIColor
        
        init(getCarArray: [[String]], getCarImg: UIImageView, getChassisLabel: UILabel, getSeasonLabel: UILabel, getConstructorBtn: UIButton, getButtonColor: UIColor) {
            carArray = getCarArray
            mainCarImg = getCarImg
            mainChassisLabel = getChassisLabel
            mainSeasonLabel = getSeasonLabel
            constructorButton = getConstructorBtn
            buttonColor = getButtonColor
            
            let randomCar  = Int.random(in: 0 ..< carArray.count)
            mainCarImg.image = UIImage(named: carArray[randomCar][0])
            mainChassisLabel.text = carArray[randomCar][0]
            mainSeasonLabel.text = carArray[randomCar][1]
        }
        
        
    }
    
    
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
            _ = loadCar(getCarArray: ferrariCars, getCarImg: carImage, getChassisLabel: chassisLabel, getSeasonLabel: seasonLabel, getConstructorBtn: lightsOutBtn, getButtonColor: UIColor.red)
        case "McLaren":
            _ = loadCar(getCarArray: mclarenCars, getCarImg: carImage, getChassisLabel: chassisLabel, getSeasonLabel: seasonLabel, getConstructorBtn: lightsOutBtn, getButtonColor: UIColor.orange)
        case "Mercedes":
            _ = loadCar(getCarArray: mercedesCars, getCarImg: carImage, getChassisLabel: chassisLabel, getSeasonLabel: seasonLabel, getConstructorBtn: lightsOutBtn, getButtonColor: UIColor.cyan)
        case "Alpine":
            _ = loadCar(getCarArray: alpineCars, getCarImg: carImage, getChassisLabel: chassisLabel, getSeasonLabel: seasonLabel, getConstructorBtn: lightsOutBtn, getButtonColor: UIColor.blue)
        case "Aston Martin":
            _ = loadCar(getCarArray: astonMartinCars, getCarImg: carImage, getChassisLabel: chassisLabel, getSeasonLabel: seasonLabel, getConstructorBtn: lightsOutBtn, getButtonColor: UIColor.green)
        case "Alfa Romeo":
            _ = loadCar(getCarArray: alfaRomeoCars, getCarImg: carImage, getChassisLabel: chassisLabel, getSeasonLabel: seasonLabel, getConstructorBtn: lightsOutBtn, getButtonColor: UIColor.red)
        case "Alpha Tauri":
            _ = loadCar(getCarArray: alphaTauriCars, getCarImg: carImage, getChassisLabel: chassisLabel, getSeasonLabel: seasonLabel, getConstructorBtn: lightsOutBtn, getButtonColor: UIColor.magenta)
        case "Haas":
            _ = loadCar(getCarArray: haasCars, getCarImg: carImage, getChassisLabel: chassisLabel, getSeasonLabel: seasonLabel, getConstructorBtn: lightsOutBtn, getButtonColor: UIColor.gray)
        case "Red Bull Racing":
            _ = loadCar(getCarArray: redBullCars, getCarImg: carImage, getChassisLabel: chassisLabel, getSeasonLabel: seasonLabel, getConstructorBtn: lightsOutBtn, getButtonColor: UIColor.blue)
        case "Williams":
            _ = loadCar(getCarArray: williamsCars, getCarImg: carImage, getChassisLabel: chassisLabel, getSeasonLabel: seasonLabel, getConstructorBtn: lightsOutBtn, getButtonColor: UIColor.blue)
        default:
            print("Error loading a car")
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

