import Foundation

let allCars: [Car] = [
    Car(id: "vw_golf_r", brand: "Volkswagen", model: "Golf R", year: 2023, category: "Kompakt", rarityLevel: 1, hp: 333, topSpeed: 270, price: "45.000€", description: "Der Golf R ist das leistungsstärkste Serienmodell der Golf-Familie. Mit 4MOTION Allradantrieb und 333 PS ein echter Alltagssportler.", emoji: "🚗"),
    Car(id: "bmw_m3", brand: "BMW", model: "M3 Competition", year: 2023, category: "Limousine", rarityLevel: 2, hp: 510, topSpeed: 290, price: "97.000€", description: "Der BMW M3 Competition ist ein Hochleistungssportler mit 510 PS und einer beeindruckenden Fahrdynamik.", emoji: "🚘"),
    Car(id: "mercedes_amg_gt", brand: "Mercedes", model: "AMG GT 63", year: 2023, category: "Sportwagen", rarityLevel: 3, hp: 630, topSpeed: 315, price: "175.000€", description: "Das AMG GT 63 verbindet Luxus mit Hochleistung. 630 PS und ein V8 Biturbo-Motor machen ihn zu einem echten Supercar.", emoji: "🏎️"),
    Car(id: "porsche_911", brand: "Porsche", model: "911 Turbo S", year: 2023, category: "Sportwagen", rarityLevel: 3, hp: 650, topSpeed: 330, price: "250.000€", description: "Der 911 Turbo S ist die Ikone unter den Sportwagen. Brutal schnell, alltagstauglich und unverwechselbar.", emoji: "🏎️"),
    Car(id: "lamborghini_huracan", brand: "Lamborghini", model: "Huracán EVO", year: 2022, category: "Supercar", rarityLevel: 4, hp: 640, topSpeed: 325, price: "230.000€", description: "Der Huracán EVO ist ein echter Stier. Mit 640 PS und einem V10-Motor liefert er ein unvergessliches Fahrerlebnis.", emoji: "🐂"),
    Car(id: "ferrari_f8", brand: "Ferrari", model: "F8 Tributo", year: 2022, category: "Supercar", rarityLevel: 4, hp: 720, topSpeed: 340, price: "270.000€", description: "Der F8 Tributo ist eine Hommage an Ferraris größte V8-Motoren. 720 PS und Rennstrecken-DNA.", emoji: "🐎"),
    Car(id: "bugatti_chiron", brand: "Bugatti", model: "Chiron", year: 2021, category: "Hypercar", rarityLevel: 5, hp: 1500, topSpeed: 420, price: "3.200.000€", description: "Der Bugatti Chiron ist das ultimative Automobil. 1500 PS, W16-Motor und eine Höchstgeschwindigkeit von 420 km/h.", emoji: "🚀"),
    Car(id: "koenigsegg_agera", brand: "Koenigsegg", model: "Agera RS", year: 2017, category: "Hypercar", rarityLevel: 5, hp: 1360, topSpeed: 457, price: "2.500.000€", description: "Der Agera RS hält den Weltrekord für die schnellste gemessene Geschwindigkeit eines Serienfahrzeugs.", emoji: "⚡"),
    Car(id: "pagani_huayra", brand: "Pagani", model: "Huayra BC", year: 2016, category: "Hypercar", rarityLevel: 5, hp: 800, topSpeed: 380, price: "2.800.000€", description: "Die Pagani Huayra BC ist ein fahrendes Kunstwerk. Handgefertigt in Modena mit einem AMG V12-Motor.", emoji: "🎨"),
    Car(id: "ferrari_laferrari", brand: "Ferrari", model: "LaFerrari", year: 2013, category: "Hypercar", rarityLevel: 5, hp: 963, topSpeed: 350, price: "1.500.000€", description: "LaFerrari ist Ferraris erster Hybrid-Supersportwagen. Nur 499 Exemplare wurden gebaut.", emoji: "🔴"),
    Car(id: "porsche_918", brand: "Porsche", model: "918 Spyder", year: 2015, category: "Hypercar", rarityLevel: 5, hp: 887, topSpeed: 345, price: "850.000€", description: "Der 918 Spyder ist ein Plug-in-Hybrid-Supersportwagen mit 887 PS. Einer der besten Sportwagen aller Zeiten.", emoji: "🕷️"),
    Car(id: "audi_r8", brand: "Audi", model: "R8 V10 Plus", year: 2022, category: "Supercar", rarityLevel: 3, hp: 620, topSpeed: 330, price: "185.000€", description: "Der Audi R8 ist ein Mittelmotor-Supersportwagen mit Allradantrieb und einem atemberaubenden V10-Saugmotor.", emoji: "💎"),
    Car(id: "mclaren_720s", brand: "McLaren", model: "720S", year: 2022, category: "Supercar", rarityLevel: 4, hp: 720, topSpeed: 341, price: "280.000€", description: "Der McLaren 720S ist ein technisches Meisterwerk. Carbonfaser-Monocoque und 720 PS für pure Performance.", emoji: "🦋"),
    Car(id: "ford_mustang", brand: "Ford", model: "Mustang GT500", year: 2022, category: "Muscle Car", rarityLevel: 2, hp: 771, topSpeed: 290, price: "85.000€", description: "Der Shelby GT500 ist das leistungsstärkste Mustang aller Zeiten. 771 PS und ein Kompressor-V8.", emoji: "🐎"),
    Car(id: "dodge_challenger", brand: "Dodge", model: "Challenger Hellcat", year: 2023, category: "Muscle Car", rarityLevel: 2, hp: 717, topSpeed: 315, price: "72.000€", description: "Der Challenger Hellcat ist ein klassischer amerikanischer Muscle Car mit modernem Superchrager-V8.", emoji: "😈"),
    Car(id: "tesla_plaid", brand: "Tesla", model: "Model S Plaid", year: 2023, category: "Elektro", rarityLevel: 2, hp: 1020, topSpeed: 322, price: "140.000€", description: "Der Tesla Model S Plaid ist das schnellste Serienfahrzeug von 0 auf 100. In nur 2,1 Sekunden.", emoji: "⚡"),
    Car(id: "rimac_nevera", brand: "Rimac", model: "Nevera", year: 2022, category: "Elektro", rarityLevel: 5, hp: 1914, topSpeed: 412, price: "2.400.000€", description: "Der Rimac Nevera ist das schnellste Elektroauto der Welt. 1914 PS aus vier Elektromotoren.", emoji: "🌩️"),
    Car(id: "rolls_royce", brand: "Rolls-Royce", model: "Phantom", year: 2023, category: "Luxus", rarityLevel: 4, hp: 571, topSpeed: 250, price: "500.000€", description: "Der Rolls-Royce Phantom ist der Inbegriff von Luxus. Handgefertigt in Goodwood, England.", emoji: "👑"),
    Car(id: "bentley_continental", brand: "Bentley", model: "Continental GT Speed", year: 2022, category: "Luxus", rarityLevel: 3, hp: 659, topSpeed: 335, price: "285.000€", description: "Der Continental GT Speed verbindet britischen Luxus mit beeindruckender Performance.", emoji: "🎩"),
    Car(id: "alfa_romeo_giulia", brand: "Alfa Romeo", model: "Giulia Quadrifoglio", year: 2023, category: "Limousine", rarityLevel: 2, hp: 520, topSpeed: 307, price: "92.000€", description: "Die Giulia Quadrifoglio ist die schnellste Limousine auf der Nürburgring-Nordschleife.", emoji: "🍀"),
]

var allBrands: [String] {
    Array(Set(allCars.map { $0.brand })).sorted()
}

var allCategories: [String] {
    Array(Set(allCars.map { $0.category })).sorted()
}
