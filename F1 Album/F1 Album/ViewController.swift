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
    let screenHeight = UIScreen.main.bounds.height / 2
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
        "Red Bull Racing" : "RBR",
        "Scuderia Ferrari": "SF",
        "Williams Racing": "WR"
        
    ]
    
    let ferrariCars = [
        ["F1-75", "2022"]
    ]
    
    @IBAction func pickTeam(_ sender: UIButton) {
        
        let vc = UIViewController()
                vc.preferredContentSize = CGSize(width: screenWidth, height: screenHeight)
                let pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: screenWidth, height:screenHeight))
                pickerView.dataSource = self
                pickerView.delegate = self
                
                pickerView.selectRow(selectedRow, inComponent: 0, animated: false)
                //pickerView.selectRow(selectedRowTextColor, inComponent: 1, animated: false)
                
                vc.view.addSubview(pickerView)
                pickerView.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor).isActive = true
                pickerView.centerYAnchor.constraint(equalTo: vc.view.centerYAnchor).isActive = true
                
                let alert = UIAlertController(title: "Choose constructor", message: "", preferredStyle: .actionSheet)
                
                alert.popoverPresentationController?.sourceView = pickerButton
                alert.popoverPresentationController?.sourceRect = pickerButton.bounds
                
                alert.setValue(vc, forKey: "contentViewController")
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (UIAlertAction) in
                }))
                
                alert.addAction(UIAlertAction(title: "Select", style: .default, handler: { (UIAlertAction) in
                    self.selectedRow = pickerView.selectedRow(inComponent: 0)
                    let selected = Array(self.teamLogos)[self.selectedRow]
                    let colour = selected.value
                    let name = selected.key
                    self.construtorLogo.image = UIImage(named: self.teamLogos[name]!)
                    self.pickerButton.setTitle(name, for: .normal)

                }))
                
                self.present(alert, animated: true, completion: nil)
    }
        
    
    
    @IBAction func ctaButton(_ sender: UIButton) {
        
        carImage.image = UIImage(named: ferrariCars[0][0])
        chassisLabel.text = ferrariCars[0][0]
        seasonLabel.text = ferrariCars[0][1]
        
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

