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

```

## Selecting constructor


## Loading F1 car image


## App in action

<p align="center">
        <img src="https://github.com/bqultra/F1-Album/assets/64577539/a07b2dcf-0461-4276-9f8d-06c07e84a5be" width="300">
</p>

