import Foundation

let allCars: [Car] = [
<<<<<<< HEAD
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

=======

    // MARK: - VW
    Car(id: "vw_golf_8", brand: "VW", model: "Golf 8", year: 2020, category: "Kompakt", rarityLevel: 1, hp: 150, topSpeed: 224, price: "ab 33.000€", description: "Deutschlands meistgekauftes Auto – fast überall zu sehen.", emoji: "🚗"),
    Car(id: "vw_polo_6", brand: "VW", model: "Polo 6", year: 2017, category: "Kleinwagen", rarityLevel: 1, hp: 95, topSpeed: 185, price: "ab 20.000€", description: "Einer der beliebtesten Kleinwagen Europas.", emoji: "🚗"),
    Car(id: "vw_passat_b8", brand: "VW", model: "Passat B8", year: 2015, category: "Mittelklasse", rarityLevel: 1, hp: 150, topSpeed: 218, price: "ab 35.000€", description: "Klassiker der deutschen Mittelklasse.", emoji: "🚗"),
    Car(id: "vw_tiguan_2", brand: "VW", model: "Tiguan 2", year: 2016, category: "SUV", rarityLevel: 1, hp: 150, topSpeed: 205, price: "ab 36.000€", description: "Meistverkaufter SUV in Deutschland.", emoji: "🚙"),
    Car(id: "vw_id4", brand: "VW", model: "ID.4", year: 2021, category: "SUV Elektro", rarityLevel: 2, hp: 204, topSpeed: 160, price: "ab 45.000€", description: "VWs vollelektrischer Bestseller-SUV.", emoji: "🚙"),
    Car(id: "vw_id3", brand: "VW", model: "ID.3", year: 2020, category: "Kompakt Elektro", rarityLevel: 2, hp: 204, topSpeed: 160, price: "ab 38.000€", description: "VWs erstes rein elektrisches Kompaktauto.", emoji: "🚗"),
    Car(id: "vw_golf_r", brand: "VW", model: "Golf R Mk8", year: 2021, category: "Hot Hatch", rarityLevel: 3, hp: 333, topSpeed: 270, price: "ab 52.000€", description: "333 PS starker Allrad-Sportler im Golf-Kleid.", emoji: "🏎️"),
    Car(id: "vw_golf_gti", brand: "VW", model: "Golf GTI Mk8", year: 2020, category: "Hot Hatch", rarityLevel: 2, hp: 245, topSpeed: 250, price: "ab 42.000€", description: "Der Urvater aller Hot Hatches.", emoji: "🚗"),
    Car(id: "vw_touareg_3", brand: "VW", model: "Touareg 3", year: 2018, category: "SUV", rarityLevel: 2, hp: 231, topSpeed: 222, price: "ab 65.000€", description: "VWs großes SUV-Flaggschiff.", emoji: "🚙"),
    Car(id: "vw_arteon", brand: "VW", model: "Arteon", year: 2017, category: "Limousine", rarityLevel: 2, hp: 190, topSpeed: 240, price: "ab 46.000€", description: "VWs sportliche Fastback-Limousine.", emoji: "🚗"),
    Car(id: "vw_golf_gti_mk1", brand: "VW", model: "Golf GTI Mk1", year: 1976, category: "Oldtimer", rarityLevel: 4, hp: 110, topSpeed: 182, price: "ab 20.000€", description: "Der Begründer der Hot-Hatch-Klasse – gebaut ab 1976.", emoji: "🚗"),

    // MARK: - Audi
    Car(id: "audi_a3_8y", brand: "Audi", model: "A3 8Y", year: 2020, category: "Kompakt", rarityLevel: 1, hp: 150, topSpeed: 224, price: "ab 33.000€", description: "Einer der beliebtesten Premium-Kompaktwagen.", emoji: "🚗"),
    Car(id: "audi_a4_b9", brand: "Audi", model: "A4 B9", year: 2016, category: "Mittelklasse", rarityLevel: 1, hp: 150, topSpeed: 218, price: "ab 40.000€", description: "Audi-Klassiker der oberen Mittelklasse.", emoji: "🚗"),
    Car(id: "audi_a6_c8", brand: "Audi", model: "A6 C8", year: 2018, category: "Oberklasse", rarityLevel: 2, hp: 204, topSpeed: 237, price: "ab 58.000€", description: "Audis elegante Businesslimousine.", emoji: "🚗"),
    Car(id: "audi_q5_2", brand: "Audi", model: "Q5 (2. Gen)", year: 2017, category: "SUV", rarityLevel: 1, hp: 163, topSpeed: 210, price: "ab 50.000€", description: "Meistverkauftes Audi-Modell weltweit.", emoji: "🚙"),
    Car(id: "audi_q7_2", brand: "Audi", model: "Q7 (2. Gen)", year: 2015, category: "SUV", rarityLevel: 2, hp: 231, topSpeed: 230, price: "ab 75.000€", description: "Audis großes 7-Sitzer-SUV.", emoji: "🚙"),
    Car(id: "audi_rs6_c8", brand: "Audi", model: "RS6 Avant C8", year: 2020, category: "Sport Kombi", rarityLevel: 3, hp: 600, topSpeed: 305, price: "ab 130.000€", description: "600 PS Kombi – der Familientransporter für Rennstrecken.", emoji: "🏎️"),
    Car(id: "audi_rs3_8y", brand: "Audi", model: "RS3 8Y", year: 2021, category: "Hot Hatch", rarityLevel: 3, hp: 400, topSpeed: 290, price: "ab 65.000€", description: "400 PS in einem Kompaktauto – brutal schnell.", emoji: "🏎️"),
    Car(id: "audi_r8_v10", brand: "Audi", model: "R8 V10", year: 2019, category: "Supersportwagen", rarityLevel: 4, hp: 620, topSpeed: 331, price: "ab 180.000€", description: "Audis einziger Mittelmotor-Supersportler, V10 mit 620 PS.", emoji: "🏎️"),
    Car(id: "audi_e_tron_gt", brand: "Audi", model: "e-tron GT", year: 2021, category: "Elektro Sportwagen", rarityLevel: 3, hp: 530, topSpeed: 245, price: "ab 110.000€", description: "Audis eleganter elektrischer GT mit 530 PS.", emoji: "🏎️"),
    Car(id: "audi_tt_8s", brand: "Audi", model: "TT 8S", year: 2014, category: "Sportwagen", rarityLevel: 2, hp: 230, topSpeed: 250, price: "ab 45.000€", description: "Designikone mit kultiger Rundform.", emoji: "🏎️"),

    // MARK: - BMW
    Car(id: "bmw_3er_g20", brand: "BMW", model: "3er G20", year: 2019, category: "Mittelklasse", rarityLevel: 1, hp: 156, topSpeed: 225, price: "ab 43.000€", description: "Der Sportwagen unter den Mittelklässlern.", emoji: "🚗"),
    Car(id: "bmw_5er_g60", brand: "BMW", model: "5er G60", year: 2023, category: "Oberklasse", rarityLevel: 2, hp: 208, topSpeed: 240, price: "ab 60.000€", description: "BMWs Business-Flaggschiff der Oberklasse.", emoji: "🚗"),
    Car(id: "bmw_1er_f40", brand: "BMW", model: "1er F40", year: 2019, category: "Kompakt", rarityLevel: 1, hp: 136, topSpeed: 210, price: "ab 32.000€", description: "Kompaktes BMW-Einstiegsmodell.", emoji: "🚗"),
    Car(id: "bmw_x5_g05", brand: "BMW", model: "X5 G05", year: 2018, category: "SUV", rarityLevel: 2, hp: 265, topSpeed: 235, price: "ab 75.000€", description: "BMWs erfolgreichstes SUV-Modell.", emoji: "🚙"),
    Car(id: "bmw_x3_g01", brand: "BMW", model: "X3 G01", year: 2017, category: "SUV", rarityLevel: 1, hp: 184, topSpeed: 210, price: "ab 52.000€", description: "Kompakt-SUV der Premiumklasse.", emoji: "🚙"),
    Car(id: "bmw_m3_g80", brand: "BMW", model: "M3 G80", year: 2021, category: "Sport Limousine", rarityLevel: 3, hp: 510, topSpeed: 290, price: "ab 97.000€", description: "510 PS, Allrad – die Sportlimousine schlechthin.", emoji: "🏎️"),
    Car(id: "bmw_m4_g82", brand: "BMW", model: "M4 G82", year: 2021, category: "Sport Coupé", rarityLevel: 3, hp: 510, topSpeed: 290, price: "ab 98.000€", description: "M4 Competition mit großem Nierengrill und 510 PS.", emoji: "🏎️"),
    Car(id: "bmw_m5_f90", brand: "BMW", model: "M5 F90", year: 2018, category: "Sport Limousine", rarityLevel: 3, hp: 600, topSpeed: 305, price: "ab 120.000€", description: "600 PS Super-Limousine mit V8 und Allrad.", emoji: "🏎️"),
    Car(id: "bmw_i4_g26", brand: "BMW", model: "i4 G26", year: 2021, category: "Elektro", rarityLevel: 2, hp: 340, topSpeed: 225, price: "ab 58.000€", description: "BMWs elektrisches Gran Coupé.", emoji: "🚗"),
    Car(id: "bmw_m2_g87", brand: "BMW", model: "M2 G87", year: 2022, category: "Sport Coupé", rarityLevel: 3, hp: 460, topSpeed: 285, price: "ab 75.000€", description: "Kompaktes M-Coupé mit 460 PS.", emoji: "🏎️"),
    Car(id: "bmw_m3_e30", brand: "BMW", model: "M3 E30", year: 1986, category: "Oldtimer", rarityLevel: 4, hp: 200, topSpeed: 235, price: "ab 80.000€", description: "Ur-M3 aus den 80ern – DTM-Sieger und Klassiker-Ikone.", emoji: "🏎️"),

    // MARK: - Mercedes-Benz
    Car(id: "mb_a_klasse_w177", brand: "Mercedes-Benz", model: "A-Klasse W177", year: 2018, category: "Kompakt", rarityLevel: 1, hp: 136, topSpeed: 210, price: "ab 33.000€", description: "Mercedess Einstieg in die Kompaktklasse.", emoji: "🚗"),
    Car(id: "mb_c_klasse_w206", brand: "Mercedes-Benz", model: "C-Klasse W206", year: 2021, category: "Mittelklasse", rarityLevel: 1, hp: 170, topSpeed: 228, price: "ab 45.000€", description: "Bestseller der Mercedes-Familie.", emoji: "🚗"),
    Car(id: "mb_e_klasse_w214", brand: "Mercedes-Benz", model: "E-Klasse W214", year: 2023, category: "Oberklasse", rarityLevel: 2, hp: 204, topSpeed: 240, price: "ab 62.000€", description: "Technologieträger mit MBUX Hyperscreen.", emoji: "🚗"),
    Car(id: "mb_s_klasse_w223", brand: "Mercedes-Benz", model: "S-Klasse W223", year: 2021, category: "Luxuslimousine", rarityLevel: 3, hp: 367, topSpeed: 250, price: "ab 110.000€", description: "Das beste Auto der Welt – Maßstab aller Luxuslimousinen.", emoji: "🚗"),
    Car(id: "mb_gle_w167", brand: "Mercedes-Benz", model: "GLE W167", year: 2019, category: "SUV", rarityLevel: 2, hp: 272, topSpeed: 230, price: "ab 72.000€", description: "Mercedess Premium-SUV im oberen Segment.", emoji: "🚙"),
    Car(id: "mb_amg_gt63", brand: "Mercedes-Benz", model: "AMG GT 63 S", year: 2019, category: "Sport Limousine", rarityLevel: 4, hp: 630, topSpeed: 315, price: "ab 175.000€", description: "630 PS V8 Biturbo – viertürige Rennmaschine.", emoji: "🏎️"),
    Car(id: "mb_amg_c63_w206", brand: "Mercedes-Benz", model: "AMG C63 W206", year: 2023, category: "Sport Limousine", rarityLevel: 3, hp: 680, topSpeed: 280, price: "ab 90.000€", description: "Plug-in Hybrid mit 680 PS – der neue C63.", emoji: "🏎️"),
    Car(id: "mb_eqs_v297", brand: "Mercedes-Benz", model: "EQS V297", year: 2021, category: "Elektro Luxus", rarityLevel: 3, hp: 333, topSpeed: 210, price: "ab 110.000€", description: "Elektrische S-Klasse mit 770 km Reichweite.", emoji: "🚗"),
    Car(id: "mb_g_klasse_w464", brand: "Mercedes-Benz", model: "G-Klasse W464", year: 2018, category: "Gelände SUV", rarityLevel: 3, hp: 422, topSpeed: 220, price: "ab 130.000€", description: "Ikonischer Geländewagen seit 1979.", emoji: "🚙"),
    Car(id: "mb_amg_one", brand: "Mercedes-Benz", model: "AMG ONE", year: 2022, category: "Hypercar", rarityLevel: 5, hp: 1063, topSpeed: 352, price: "ab 2.700.000€", description: "F1-Motor im Straßenauto, 1063 PS, nur 275 Stück gebaut.", emoji: "🏎️"),
    Car(id: "mercedes_300sl", brand: "Mercedes-Benz", model: "300 SL Flügeltürer", year: 1954, category: "Oldtimer", rarityLevel: 5, hp: 215, topSpeed: 250, price: "ab 1.500.000€", description: "1954er Ikone mit Flügeltüren – eines der schönsten Autos aller Zeiten.", emoji: "🏎️"),

    // MARK: - Porsche
    Car(id: "porsche_911_992", brand: "Porsche", model: "911 (992)", year: 2019, category: "Sportwagen", rarityLevel: 3, hp: 450, topSpeed: 308, price: "ab 115.000€", description: "Ikone des Sportwagenbaus seit 1963.", emoji: "🏎️"),
    Car(id: "porsche_cayenne_3", brand: "Porsche", model: "Cayenne (3. Gen)", year: 2018, category: "SUV", rarityLevel: 2, hp: 340, topSpeed: 253, price: "ab 90.000€", description: "Porsche-SUV der Luxusklasse.", emoji: "🚙"),
    Car(id: "porsche_macan_ev", brand: "Porsche", model: "Macan EV", year: 2024, category: "SUV Elektro", rarityLevel: 3, hp: 408, topSpeed: 220, price: "ab 80.000€", description: "Porsches erster rein elektrischer Macan.", emoji: "🚙"),
    Car(id: "porsche_taycan_turbo_s", brand: "Porsche", model: "Taycan Turbo S", year: 2020, category: "Elektro Sportwagen", rarityLevel: 4, hp: 761, topSpeed: 260, price: "ab 190.000€", description: "761 PS elektrisch – 0-100 in 2,8 Sekunden.", emoji: "🏎️"),
    Car(id: "porsche_gt3_rs", brand: "Porsche", model: "911 GT3 RS (992)", year: 2022, category: "Supersportwagen", rarityLevel: 5, hp: 525, topSpeed: 296, price: "ab 250.000€", description: "525 PS Saugmotor, Aero-Paket wie ein Rennwagen.", emoji: "🏎️"),
    Car(id: "porsche_panamera_4", brand: "Porsche", model: "Panamera (4. Gen)", year: 2024, category: "Sport Limousine", rarityLevel: 3, hp: 353, topSpeed: 270, price: "ab 115.000€", description: "Viertürige Sportlimousine mit GT-Charakter.", emoji: "🚗"),
    Car(id: "porsche_718_cayman", brand: "Porsche", model: "718 Cayman GTS", year: 2020, category: "Sportwagen", rarityLevel: 3, hp: 400, topSpeed: 293, price: "ab 90.000€", description: "Mittelmotor-Sportwagen mit perfekter Balance.", emoji: "🏎️"),
    Car(id: "porsche_911_964_rs", brand: "Porsche", model: "911 RS (964)", year: 1992, category: "Oldtimer", rarityLevel: 5, hp: 260, topSpeed: 260, price: "ab 1.200.000€", description: "Leichtbau-911 von 1992 – heute millionenschwerer Klassiker.", emoji: "🏎️"),

    // MARK: - Ferrari
    Car(id: "ferrari_roma", brand: "Ferrari", model: "Roma", year: 2020, category: "Gran Turismo", rarityLevel: 4, hp: 620, topSpeed: 320, price: "ab 230.000€", description: "Elegantes GT-Coupé im Stil des alten Roms.", emoji: "🏎️"),
    Car(id: "ferrari_sf90", brand: "Ferrari", model: "SF90 Stradale", year: 2020, category: "Supersportwagen", rarityLevel: 5, hp: 1000, topSpeed: 340, price: "ab 500.000€", description: "1000 PS Hybrid-Supersportwagen, 0-100 in 2,5 s.", emoji: "🏎️"),
    Car(id: "ferrari_296_gtb", brand: "Ferrari", model: "296 GTB", year: 2022, category: "Supersportwagen", rarityLevel: 5, hp: 830, topSpeed: 330, price: "ab 320.000€", description: "830 PS, V6 Hybrid Mittelmotor – Ferraris neue Richtung.", emoji: "🏎️"),
    Car(id: "ferrari_f8_tributo", brand: "Ferrari", model: "F8 Tributo", year: 2019, category: "Supersportwagen", rarityLevel: 5, hp: 720, topSpeed: 340, price: "ab 280.000€", description: "720 PS V8 Biturbo – Hommage an den 308.", emoji: "🏎️"),
    Car(id: "ferrari_purosangue", brand: "Ferrari", model: "Purosangue", year: 2023, category: "SUV Hypercar", rarityLevel: 5, hp: 725, topSpeed: 310, price: "ab 400.000€", description: "Ferraris erster SUV mit V12 und 725 PS.", emoji: "🚙"),
    Car(id: "ferrari_f40", brand: "Ferrari", model: "F40", year: 1987, category: "Oldtimer", rarityLevel: 5, hp: 478, topSpeed: 324, price: "ab 2.000.000€", description: "478 PS, kein ABS, kein Servo – letzter Ferrari, den Enzo genehmigte.", emoji: "🏎️"),

    // MARK: - Lamborghini
    Car(id: "lambo_huracan", brand: "Lamborghini", model: "Huracán EVO", year: 2019, category: "Supersportwagen", rarityLevel: 5, hp: 640, topSpeed: 325, price: "ab 230.000€", description: "640 PS V10 Saugmotor – brüllendes Meisterwerk.", emoji: "🏎️"),
    Car(id: "lambo_urus", brand: "Lamborghini", model: "Urus S", year: 2022, category: "Super SUV", rarityLevel: 4, hp: 666, topSpeed: 305, price: "ab 260.000€", description: "666 PS SUV – einer der schnellsten Serien-SUVs der Welt.", emoji: "🚙"),
    Car(id: "lambo_revuelto", brand: "Lamborghini", model: "Revuelto", year: 2023, category: "Hypercar", rarityLevel: 5, hp: 1015, topSpeed: 350, price: "ab 500.000€", description: "1015 PS V12 Hybrid – Nachfolger des Aventador.", emoji: "🏎️"),
    Car(id: "lambo_sterrato", brand: "Lamborghini", model: "Huracán Sterrato", year: 2023, category: "Offroad Supersporter", rarityLevel: 5, hp: 610, topSpeed: 260, price: "ab 280.000€", description: "Ein Supersportler für die Schotterpiste – einzigartig.", emoji: "🏎️"),

    // MARK: - McLaren
    Car(id: "mclaren_artura", brand: "McLaren", model: "Artura", year: 2021, category: "Supersportwagen", rarityLevel: 5, hp: 700, topSpeed: 330, price: "ab 240.000€", description: "700 PS Hybrid-Supersportwagen als Einstieg in die Serie.", emoji: "🏎️"),
    Car(id: "mclaren_720s", brand: "McLaren", model: "720S", year: 2017, category: "Supersportwagen", rarityLevel: 5, hp: 720, topSpeed: 341, price: "ab 280.000€", description: "720 PS, 0-100 in 2,9 s – extremer Leichtbau.", emoji: "🏎️"),
    Car(id: "mclaren_750s", brand: "McLaren", model: "750S", year: 2023, category: "Supersportwagen", rarityLevel: 5, hp: 740, topSpeed: 332, price: "ab 330.000€", description: "740 PS Nachfolger des 720S – leichter und schärfer.", emoji: "🏎️"),

    // MARK: - Aston Martin / Bentley / Rolls-Royce
    Car(id: "aston_vantage", brand: "Aston Martin", model: "Vantage (2024)", year: 2024, category: "Sportwagen", rarityLevel: 4, hp: 665, topSpeed: 325, price: "ab 180.000€", description: "665 PS V8 AMG-Motor im schönsten britischen Coupé.", emoji: "🏎️"),
    Car(id: "aston_db12", brand: "Aston Martin", model: "DB12", year: 2023, category: "Gran Turismo", rarityLevel: 4, hp: 680, topSpeed: 325, price: "ab 230.000€", description: "680 PS GT – der erste Super Tourer von Aston Martin.", emoji: "🏎️"),
    Car(id: "aston_dbx707", brand: "Aston Martin", model: "DBX707", year: 2022, category: "Super SUV", rarityLevel: 4, hp: 707, topSpeed: 310, price: "ab 260.000€", description: "707 PS SUV – einer der stärksten Serien-SUVs Europas.", emoji: "🚙"),
    Car(id: "bentley_continental_gt", brand: "Bentley", model: "Continental GT Speed", year: 2021, category: "Gran Turismo", rarityLevel: 4, hp: 659, topSpeed: 335, price: "ab 280.000€", description: "659 PS W12 – Luxus und Leistung in Perfektion.", emoji: "🏎️"),
    Car(id: "bentley_bentayga", brand: "Bentley", model: "Bentayga EWB", year: 2022, category: "Luxus SUV", rarityLevel: 4, hp: 550, topSpeed: 290, price: "ab 250.000€", description: "Luxuriösester SUV der Welt mit verlängertem Radstand.", emoji: "🚙"),
    Car(id: "rr_ghost", brand: "Rolls-Royce", model: "Ghost (2. Gen)", year: 2020, category: "Luxuslimousine", rarityLevel: 4, hp: 563, topSpeed: 250, price: "ab 380.000€", description: "563 PS V12 – das leiseste Auto der Welt.", emoji: "🚗"),
    Car(id: "rr_cullinan", brand: "Rolls-Royce", model: "Cullinan Black Badge", year: 2019, category: "Luxus SUV", rarityLevel: 5, hp: 600, topSpeed: 250, price: "ab 450.000€", description: "600 PS V12 SUV – Rolls-Royces erstes SUV.", emoji: "🚙"),
    Car(id: "rr_spectre", brand: "Rolls-Royce", model: "Spectre", year: 2023, category: "Elektro Luxus", rarityLevel: 5, hp: 585, topSpeed: 250, price: "ab 430.000€", description: "585 PS Elektro-Coupé – Rolls-Royces erstes E-Auto.", emoji: "🏎️"),

    // MARK: - Pagani
    Car(id: "pagani_huayra_r", brand: "Pagani", model: "Huayra R", year: 2021, category: "Hypercar", rarityLevel: 5, hp: 850, topSpeed: 370, price: "ab 3.000.000€", description: "850 PS V12 NA, Straßenzulassung, nur 30 Stück weltweit.", emoji: "🏎️"),
    Car(id: "pagani_utopia", brand: "Pagani", model: "Utopia", year: 2022, category: "Hypercar", rarityLevel: 5, hp: 852, topSpeed: 340, price: "ab 2.200.000€", description: "852 PS V12 Biturbo, nur 99 Exemplare – Pagani-Meisterwerk.", emoji: "🏎️"),

    // MARK: - Ford / Dodge / Chevrolet
    Car(id: "ford_focus_4", brand: "Ford", model: "Focus ST (4. Gen)", year: 2019, category: "Hot Hatch", rarityLevel: 2, hp: 280, topSpeed: 250, price: "ab 38.000€", description: "280 PS Alltagssportler mit Handschaltung.", emoji: "🚗"),
    Car(id: "ford_mustang_s550", brand: "Ford", model: "Mustang GT (S550)", year: 2015, category: "Muscle Car", rarityLevel: 3, hp: 450, topSpeed: 249, price: "ab 55.000€", description: "450 PS V8 – amerikanische Ikone in Europa selten.", emoji: "🏎️"),
    Car(id: "ford_mustang_mach_e", brand: "Ford", model: "Mustang Mach-E GT", year: 2021, category: "SUV Elektro", rarityLevel: 2, hp: 358, topSpeed: 200, price: "ab 65.000€", description: "358 PS elektrischer SUV im Mustang-Design.", emoji: "🚙"),
    Car(id: "ford_gt", brand: "Ford", model: "Ford GT (3. Gen)", year: 2017, category: "Supersportwagen", rarityLevel: 5, hp: 660, topSpeed: 347, price: "ab 500.000€", description: "660 PS V6 EcoBoost – Le Mans-Sieger auf der Straße, nur 1350 gebaut.", emoji: "🏎️"),
    Car(id: "ford_bronco", brand: "Ford", model: "Bronco (2021)", year: 2021, category: "Gelände SUV", rarityLevel: 3, hp: 330, topSpeed: 180, price: "ab 55.000€", description: "Kultige Retro-Offroad-Ikone – in Europa sehr selten.", emoji: "🚙"),
    Car(id: "dodge_challenger_hellcat", brand: "Dodge", model: "Challenger Hellcat", year: 2015, category: "Muscle Car", rarityLevel: 4, hp: 717, topSpeed: 328, price: "ab 80.000€", description: "717 PS Supercharged V8 – lautestes Muscle Car ever.", emoji: "🏎️"),
    Car(id: "chevy_corvette_c8", brand: "Chevrolet", model: "Corvette C8 Stingray", year: 2020, category: "Sportwagen", rarityLevel: 4, hp: 490, topSpeed: 312, price: "ab 80.000€", description: "490 PS Mittelmotor-Corvette – erster seit 60 Jahren.", emoji: "🏎️"),
    Car(id: "chevy_corvette_z06", brand: "Chevrolet", model: "Corvette Z06 (C8)", year: 2023, category: "Supersportwagen", rarityLevel: 5, hp: 670, topSpeed: 312, price: "ab 130.000€", description: "670 PS V8 Saugmotor, klingt wie ein GT3 – in Europa extrem selten.", emoji: "🏎️"),

    // MARK: - Toyota
    Car(id: "toyota_gr86_2", brand: "Toyota", model: "GR86 (2. Gen)", year: 2021, category: "Sportwagen", rarityLevel: 2, hp: 234, topSpeed: 226, price: "ab 33.000€", description: "234 PS Saugmotor, leicht und präzise – Drifter-Favorit.", emoji: "🏎️"),
    Car(id: "toyota_gr_yaris", brand: "Toyota", model: "GR Yaris", year: 2020, category: "Hot Hatch", rarityLevel: 3, hp: 261, topSpeed: 230, price: "ab 40.000€", description: "261 PS Allrad-Homologationsmodell – Rallye-DNA.", emoji: "🏎️"),
    Car(id: "toyota_gr_supra", brand: "Toyota", model: "GR Supra A90", year: 2019, category: "Sportwagen", rarityLevel: 3, hp: 387, topSpeed: 250, price: "ab 58.000€", description: "387 PS, BMW-Motor – Kultname zurück auf der Straße.", emoji: "🏎️"),
    Car(id: "toyota_land_cruiser_300", brand: "Toyota", model: "Land Cruiser 300", year: 2021, category: "Gelände SUV", rarityLevel: 2, hp: 309, topSpeed: 210, price: "ab 90.000€", description: "Unzerstörbarer Offroad-Klassiker.", emoji: "🚙"),
    Car(id: "toyota_prius_5", brand: "Toyota", model: "Prius (5. Gen)", year: 2023, category: "Hybrid", rarityLevel: 1, hp: 223, topSpeed: 177, price: "ab 40.000€", description: "Erfinder des Hybridautos – seit 1997 auf der Straße.", emoji: "🚗"),
    Car(id: "toyota_century_suv", brand: "Toyota", model: "Century SUV", year: 2023, category: "Luxus SUV", rarityLevel: 5, hp: 406, topSpeed: 200, price: "ab 180.000€", description: "Japans exklusivstes SUV – in Europa kaum zu sehen.", emoji: "🚙"),

    // MARK: - Nissan / Honda / Mazda / Subaru / Mitsubishi
    Car(id: "nissan_gtr_r35", brand: "Nissan", model: "GT-R R35 Nismo", year: 2014, category: "Supersportwagen", rarityLevel: 4, hp: 600, topSpeed: 315, price: "ab 180.000€", description: "600 PS Nismo-Version des Godzilla – Trackday-Legende.", emoji: "🏎️"),
    Car(id: "nissan_z_rz34", brand: "Nissan", model: "Z (RZ34)", year: 2022, category: "Sportwagen", rarityLevel: 3, hp: 400, topSpeed: 250, price: "ab 45.000€", description: "400 PS Twin-Turbo V6 – Rückkehr einer Legende.", emoji: "🏎️"),
    Car(id: "honda_civic_type_r_fl5", brand: "Honda", model: "Civic Type R FL5", year: 2023, category: "Hot Hatch", rarityLevel: 3, hp: 329, topSpeed: 275, price: "ab 48.000€", description: "329 PS, Frontantrieb – schnellster FWD-Wagen auf der Nordschleife.", emoji: "🏎️"),
    Car(id: "honda_nsx_2", brand: "Honda", model: "NSX (2. Gen)", year: 2017, category: "Supersportwagen", rarityLevel: 5, hp: 600, topSpeed: 307, price: "ab 180.000€", description: "600 PS Hybrid V6 Mittelmotor – Hondas Supersportler.", emoji: "🏎️"),
    Car(id: "mazda_mx5_nd", brand: "Mazda", model: "MX-5 (ND)", year: 2015, category: "Roadster", rarityLevel: 2, hp: 184, topSpeed: 219, price: "ab 28.000€", description: "Meistgebauter Roadster der Welt – pure Fahrfreude.", emoji: "🏎️"),
    Car(id: "mazda_rx7_fd", brand: "Mazda", model: "RX-7 FD", year: 1992, category: "Oldtimer", rarityLevel: 4, hp: 255, topSpeed: 255, price: "ab 40.000€", description: "Wankelmotor-Legende – 1993 bis 2002 gebaut, heute selten.", emoji: "🏎️"),
    Car(id: "subaru_wrx_sti_va", brand: "Subaru", model: "WRX STI (VA)", year: 2014, category: "Sport Limousine", rarityLevel: 3, hp: 300, topSpeed: 255, price: "ab 40.000€", description: "Rallye-DNA für die Straße – 300 PS Allrad-Ikone.", emoji: "🏎️"),
    Car(id: "subaru_brz_zd8", brand: "Subaru", model: "BRZ (ZD8)", year: 2021, category: "Sportwagen", rarityLevel: 2, hp: 234, topSpeed: 226, price: "ab 32.000€", description: "234 PS Saugmotor, Hinterradantrieb – Fahrmaschine pur.", emoji: "🏎️"),
    Car(id: "mitsu_lancer_evo_x", brand: "Mitsubishi", model: "Lancer Evo X", year: 2007, category: "Sport Limousine", rarityLevel: 4, hp: 295, topSpeed: 263, price: "ab 25.000€", description: "295 PS Allrad-Legende – 2016 eingestellt, wird immer seltener.", emoji: "🏎️"),

    // MARK: - Hyundai / Kia
    Car(id: "hyundai_ioniq5_n", brand: "Hyundai", model: "IONIQ 5 N", year: 2023, category: "Elektro Sportwagen", rarityLevel: 3, hp: 650, topSpeed: 260, price: "ab 70.000€", description: "650 PS Elektro-Sportler mit simulierten Gangwechseln.", emoji: "🏎️"),
    Car(id: "hyundai_i30n_pd", brand: "Hyundai", model: "i30 N Performance", year: 2017, category: "Hot Hatch", rarityLevel: 2, hp: 280, topSpeed: 250, price: "ab 35.000€", description: "280 PS Hot Hatch – bestes Preis-Leistungs-Verhältnis.", emoji: "🏎️"),
    Car(id: "kia_ev6_gt", brand: "Kia", model: "EV6 GT", year: 2022, category: "Elektro Sportwagen", rarityLevel: 3, hp: 585, topSpeed: 260, price: "ab 65.000€", description: "585 PS, 0-100 in 3,5 s – Kias schnellstes Auto.", emoji: "🏎️"),
    Car(id: "kia_stinger_gt", brand: "Kia", model: "Stinger GT", year: 2017, category: "Sport Limousine", rarityLevel: 3, hp: 369, topSpeed: 270, price: "ab 35.000€", description: "369 PS V6 Biturbo – Kias Sportlimousine wurde 2023 eingestellt.", emoji: "🏎️"),

    // MARK: - Alfa Romeo / Lancia / Fiat
    Car(id: "alfa_giulia_qv", brand: "Alfa Romeo", model: "Giulia Quadrifoglio", year: 2016, category: "Sport Limousine", rarityLevel: 3, hp: 510, topSpeed: 307, price: "ab 90.000€", description: "510 PS V6 Ferrari-Motor – schnellste 4-Türer-Nordschleifen-Zeit.", emoji: "🏎️"),
    Car(id: "alfa_stelvio_qv", brand: "Alfa Romeo", model: "Stelvio Quadrifoglio", year: 2017, category: "Sport SUV", rarityLevel: 3, hp: 510, topSpeed: 283, price: "ab 90.000€", description: "510 PS V6 im SUV – schnellstes SUV auf der Nordschleife.", emoji: "🚙"),
    Car(id: "alfa_33_stradale", brand: "Alfa Romeo", model: "33 Stradale (2023)", year: 2023, category: "Hypercar", rarityLevel: 5, hp: 620, topSpeed: 333, price: "ab 1.500.000€", description: "620 PS V6 oder Elektro – nur 33 Exemplare weltweit.", emoji: "🏎️"),
    Car(id: "lancia_delta_integrale", brand: "Lancia", model: "Delta Integrale", year: 1987, category: "Oldtimer", rarityLevel: 4, hp: 215, topSpeed: 220, price: "ab 60.000€", description: "Rallye-Weltmeister der 80er/90er – Kult-Klassiker.", emoji: "🏎️"),
    Car(id: "fiat_500_abarth_695", brand: "Fiat", model: "Abarth 695 Biposto", year: 2014, category: "Hot Hatch", rarityLevel: 3, hp: 190, topSpeed: 218, price: "ab 35.000€", description: "190 PS in einem Winzling – Rennstrecken-Stadtauto.", emoji: "🏎️"),

    // MARK: - Renault / Peugeot / Citroën
    Car(id: "renault_megane_rs", brand: "Renault", model: "Mégane RS Trophy-R", year: 2019, category: "Hot Hatch", rarityLevel: 3, hp: 300, topSpeed: 257, price: "ab 45.000€", description: "300 PS, Nordschleifen-Rekord für FWD – extremer Kompaktsportler.", emoji: "🏎️"),
    Car(id: "renault_5_ev", brand: "Renault", model: "Renault 5 E-Tech", year: 2024, category: "Elektro", rarityLevel: 2, hp: 150, topSpeed: 150, price: "ab 25.000€", description: "Kultiges Retro-Design neu als Elektroauto.", emoji: "🚗"),
    Car(id: "peugeot_308_sw", brand: "Peugeot", model: "308 SW PHEV", year: 2021, category: "Kombi Hybrid", rarityLevel: 1, hp: 225, topSpeed: 233, price: "ab 38.000€", description: "Eleganter Plug-in Hybrid Kombi mit 225 PS.", emoji: "🚗"),
    Car(id: "citroen_2cv", brand: "Citroën", model: "2CV (Ente)", year: 1948, category: "Oldtimer", rarityLevel: 3, hp: 29, topSpeed: 115, price: "ab 8.000€", description: "Franzosen-Kult auf vier Rädern – gebaut von 1948 bis 1990.", emoji: "🚗"),

    // MARK: - Volvo / Land Rover / Jaguar
    Car(id: "volvo_xc90_recharge", brand: "Volvo", model: "XC90 Recharge", year: 2020, category: "SUV Hybrid", rarityLevel: 2, hp: 455, topSpeed: 210, price: "ab 75.000€", description: "Schwedisches Sicherheitsmonument mit Plug-in Hybrid.", emoji: "🚙"),
    Car(id: "volvo_ex30", brand: "Volvo", model: "EX30 Twin Motor", year: 2023, category: "SUV Elektro", rarityLevel: 2, hp: 272, topSpeed: 180, price: "ab 40.000€", description: "272 PS kompakter Elektro-SUV – kleinstes Volvo-E-Auto.", emoji: "🚙"),
    Car(id: "volvo_p1800", brand: "Volvo", model: "P1800 (1961)", year: 1961, category: "Oldtimer", rarityLevel: 4, hp: 100, topSpeed: 175, price: "ab 30.000€", description: "Volvo-Sportwagen-Ikone – bekannt durch The Saint.", emoji: "🚗"),
    Car(id: "lr_defender_90", brand: "Land Rover", model: "Defender 90 V8", year: 2021, category: "Gelände SUV", rarityLevel: 3, hp: 525, topSpeed: 240, price: "ab 140.000€", description: "525 PS V8 im Defender – Offroad-Ikone mit Muscle-Power.", emoji: "🚙"),
    Car(id: "lr_range_rover_sv", brand: "Land Rover", model: "Range Rover SV", year: 2022, category: "Luxus SUV", rarityLevel: 4, hp: 530, topSpeed: 250, price: "ab 250.000€", description: "Exklusivste Version des Range Rover – Maßanfertigung.", emoji: "🚙"),
    Car(id: "jaguar_f_type_r", brand: "Jaguar", model: "F-Type R (2020)", year: 2020, category: "Sportwagen", rarityLevel: 3, hp: 575, topSpeed: 300, price: "ab 120.000€", description: "575 PS V8 Kompressor – britischer Sportwagen mit Sound.", emoji: "🏎️"),

    // MARK: - Tesla
    Car(id: "tesla_model_s_plaid", brand: "Tesla", model: "Model S Plaid", year: 2021, category: "Elektro Sportwagen", rarityLevel: 3, hp: 1020, topSpeed: 322, price: "ab 110.000€", description: "1020 PS, 0-100 in 2,1 s – schnellste Serienproduktion.", emoji: "🏎️"),
    Car(id: "tesla_model_3_highland", brand: "Tesla", model: "Model 3 Highland", year: 2023, category: "Elektro", rarityLevel: 1, hp: 299, topSpeed: 225, price: "ab 43.000€", description: "Meistverkauftes E-Auto Europas.", emoji: "🚗"),
    Car(id: "tesla_cybertruck", brand: "Tesla", model: "Cybertruck", year: 2023, category: "Elektro Pickup", rarityLevel: 4, hp: 845, topSpeed: 209, price: "ab 100.000€", description: "Stainless-Steel Pickup – in Europa extrem selten und auffällig.", emoji: "🚙"),

    // MARK: - Rimac / Bugatti / Koenigsegg
    Car(id: "rimac_nevera", brand: "Rimac", model: "Nevera", year: 2021, category: "Elektro Hypercar", rarityLevel: 5, hp: 1914, topSpeed: 412, price: "ab 2.400.000€", description: "1914 PS, 0-100 in 1,97 s – schnellstes Serienfahrzeug der Welt.", emoji: "🏎️"),
    Car(id: "bugatti_chiron", brand: "Bugatti", model: "Chiron Super Sport", year: 2019, category: "Hypercar", rarityLevel: 5, hp: 1600, topSpeed: 440, price: "ab 3.500.000€", description: "1600 PS W16 Quad-Turbo – 440 km/h Topspeed.", emoji: "🏎️"),
    Car(id: "bugatti_tourbillon", brand: "Bugatti", model: "Tourbillon", year: 2024, category: "Hypercar", rarityLevel: 5, hp: 1800, topSpeed: 445, price: "ab 4.000.000€", description: "1800 PS V16 Hybrid – Bugattis nächste Ära, nur 250 Stück.", emoji: "🏎️"),
    Car(id: "koenigsegg_jesko_absolut", brand: "Koenigsegg", model: "Jesko Absolut", year: 2020, category: "Hypercar", rarityLevel: 5, hp: 1600, topSpeed: 531, price: "ab 3.000.000€", description: "1600 PS, theoretisch 531 km/h – schnellstes Koenigsegg je.", emoji: "🏎️"),
    Car(id: "koenigsegg_gemera", brand: "Koenigsegg", model: "Gemera", year: 2023, category: "Hypercar", rarityLevel: 5, hp: 2300, topSpeed: 400, price: "ab 3.400.000€", description: "2300 PS Hybrid, 4 Sitze – der verrückteste GT der Welt.", emoji: "🏎️"),

]

// MARK: - Helper vars
>>>>>>> 035070ae751ddea37228c41d25a1b6ea6a9a87c3
var allBrands: [String] {
    Array(Set(allCars.map { $0.brand })).sorted()
}

var allCategories: [String] {
    Array(Set(allCars.map { $0.category })).sorted()
}
