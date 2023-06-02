<p width="100%">
        <img src="https://github.com/bqultra/F1-Album/assets/64577539/ce5c7998-33db-4de1-bc5d-e4f74b740a45">
</p>

# F1 Album

F1 Album is an iOS App which shows random Formula One Car depends on which Constructor user choose.

## Storing data

### Consructors dictionary

There is a dictionary that stores constructor names and their shortcuts which are then used to pick constructor in UIPickerView and also to load their logo on the top of an App.

```swift

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

```

### Cars 2D Arrays

To store chassis and season the car was racing there are multiple 2D Arrays. They are used to display image of a car and also change labels of chassis and season on the main page.

```swift

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
    
    .
    .
    .

```

## Selecting constructor

User select constructors via UIPickerView button. There are currently 10 teams to choose from and confirm choice tapping Select action. It is done by UIAlertController which is configured to load constructor logo on the top of the app and set title of UIPickerView button to chosen constructor name.

```swift

let alert = UIAlertController(title: "Choose constructor", message: "", preferredStyle: .actionSheet)

alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (UIAlertAction) in }))
alert.addAction(UIAlertAction(title: "Select", style: .default, handler: { (UIAlertAction) in
                    self.selectedRow = pickerView.selectedRow(inComponent: 0)
                    let selected = Array(self.teamLogos)[self.selectedRow]
                    let name = selected.key
                    self.construtorLogo.image = UIImage(named: self.teamLogos[name]!)
                    self.pickerButton.setTitle(name, for: .normal)

                }))
```

## Loading F1 car image

Random car image with it's chassis label and season label are loaded on button tap depending which constructor user choosen. Its because of the UIPickerView button title which was set. After button "Lights out!" is tapped app is checking title via Switch statement and different cases.

```swift

let currentButton = pickerButton.currentTitle!
switch currentButton {
 case "Scuderia Ferrari":
  _ = loadCar(getCarArray: ferrariCars, getCarImg: carImage, getChassisLabel: chassisLabel, getSeasonLabel: seasonLabel)
 case "McLaren":
  _ = loadCar(getCarArray: mclarenCars, getCarImg: carImage, getChassisLabel: chassisLabel, getSeasonLabel: seasonLabel)
 case "Mercedes":
  _ = loadCar(getCarArray: mercedesCars, getCarImg: carImage, getChassisLabel: chassisLabel, getSeasonLabel: seasonLabel)
  .
  .
  .
}
```

Each case useses an initialization of Structure called loadCar.

```swift

    struct loadCar {
        let carArray: [[String]],
            mainCarImg: UIImageView,
            mainChassisLabel: UILabel,
            mainSeasonLabel: UILabel,
            constructorButton: UIButton,
            buttonColor: UIColor
        
        init(getCarArray: [[String]], getCarImg: UIImageView, getChassisLabel: UILabel, getSeasonLabel: UILabel) {
            carArray = getCarArray
            mainCarImg = getCarImg
            mainChassisLabel = getChassisLabel
            mainSeasonLabel = getSeasonLabel
            
            let randomCar  = Int.random(in: 0 ..< carArray.count)
            mainCarImg.image = UIImage(named: carArray[randomCar][0])
            mainChassisLabel.text = carArray[randomCar][0]
            mainSeasonLabel.text = carArray[randomCar][1]
        }

```

## App in action

<p align="center">
        <img src="https://github.com/bqultra/F1-Album/assets/64577539/a07b2dcf-0461-4276-9f8d-06c07e84a5be" width="300">
</p>

