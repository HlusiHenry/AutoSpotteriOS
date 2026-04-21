import Foundation

let allCars: [Car] = [

    // ═══════════════════════════════════════════════════════════
    // MARK: - PORSCHE
    // ═══════════════════════════════════════════════════════════

    // MARK: Porsche 911 Carrera
    Car(id: "p_911_992_carrera", brand: "Porsche", modelFamily: "911 Carrera", model: "911 Carrera (992)", generation: "992", year: 2019, category: "Sportwagen", rarityLevel: 3, hp: 385, topSpeed: 293, price: "ab 115.000 EUR", description: "Der Urvater aller Sportwagen - jetzt in der 8. Generation.", emoji: "🏎️"),
    Car(id: "p_911_992_carrera_s", brand: "Porsche", modelFamily: "911 Carrera", model: "911 Carrera S (992)", generation: "992", year: 2019, category: "Sportwagen", rarityLevel: 3, hp: 450, topSpeed: 308, price: "ab 130.000 EUR", description: "450 PS Boxer-Sechszylinder - sportlichste Basis-911-Version.", emoji: "🏎️"),
    Car(id: "p_911_9922_carrera", brand: "Porsche", modelFamily: "911 Carrera", model: "911 Carrera (992.2)", generation: "992.2", year: 2024, category: "Sportwagen", rarityLevel: 3, hp: 394, topSpeed: 293, price: "ab 120.000 EUR", description: "Facelift der 992-Baureihe - jetzt mit Hybridunterstuetzung.", emoji: "🏎️"),
    Car(id: "p_911_9922_carrera_s", brand: "Porsche", modelFamily: "911 Carrera", model: "911 Carrera S (992.2)", generation: "992.2", year: 2024, category: "Sportwagen", rarityLevel: 3, hp: 473, topSpeed: 308, price: "ab 138.000 EUR", description: "473 PS mit T-Hybrid System - effizientester Carrera S aller Zeiten.", emoji: "🏎️"),
    Car(id: "p_911_991_carrera_s", brand: "Porsche", modelFamily: "911 Carrera", model: "911 Carrera S (991.2)", generation: "991.2", year: 2016, category: "Sportwagen", rarityLevel: 3, hp: 420, topSpeed: 308, price: "ab 80.000 EUR", description: "Facelift mit Turbo fuer alle - 420 PS aus 3,0 Liter.", emoji: "🏎️"),
    Car(id: "p_911_991_carrera", brand: "Porsche", modelFamily: "911 Carrera", model: "911 Carrera (991.1)", generation: "991.1", year: 2012, category: "Sportwagen", rarityLevel: 3, hp: 350, topSpeed: 288, price: "ab 60.000 EUR", description: "Letzter Carrera mit Saugmotor - 991.1, ein Klassiker.", emoji: "🏎️"),

    // MARK: Porsche 911 GT3
    Car(id: "p_gt3_992", brand: "Porsche", modelFamily: "911 GT3", model: "911 GT3 (992)", generation: "992", year: 2021, category: "Supersportwagen", rarityLevel: 4, hp: 510, topSpeed: 318, price: "ab 175.000 EUR", description: "510 PS Saugmotor, 9.000 U/min - reinste Rennstrecken-DNA.", emoji: "🏎️"),
    Car(id: "p_gt3rs_992", brand: "Porsche", modelFamily: "911 GT3", model: "911 GT3 RS (992)", generation: "992", year: 2022, category: "Supersportwagen", rarityLevel: 5, hp: 525, topSpeed: 296, price: "ab 250.000 EUR", description: "525 PS und extremes Aeropaket - Nordschleife in 6:49.", emoji: "🏎️"),
    Car(id: "p_gt3_991", brand: "Porsche", modelFamily: "911 GT3", model: "911 GT3 (991.2)", generation: "991.2", year: 2017, category: "Supersportwagen", rarityLevel: 4, hp: 500, topSpeed: 320, price: "ab 130.000 EUR", description: "500 PS Saugmotor - mit Touring-Paket auch ohne Spoiler.", emoji: "🏎️"),
    Car(id: "p_gt3rs_991", brand: "Porsche", modelFamily: "911 GT3", model: "911 GT3 RS (991.2)", generation: "991.2", year: 2018, category: "Supersportwagen", rarityLevel: 5, hp: 520, topSpeed: 312, price: "ab 200.000 EUR", description: "520 PS Rennsport-Derivat - Direktlenkung und Magnesiumfelgen.", emoji: "🏎️"),

    // MARK: Porsche 911 Turbo
    Car(id: "p_turbo_s_992", brand: "Porsche", modelFamily: "911 Turbo", model: "911 Turbo S (992)", generation: "992", year: 2020, category: "Supersportwagen", rarityLevel: 4, hp: 650, topSpeed: 330, price: "ab 230.000 EUR", description: "650 PS, 0-100 in 2,7 s - das schnellste Serien-911.", emoji: "🏎️"),
    Car(id: "p_turbo_992", brand: "Porsche", modelFamily: "911 Turbo", model: "911 Turbo (992)", generation: "992", year: 2020, category: "Supersportwagen", rarityLevel: 4, hp: 580, topSpeed: 320, price: "ab 190.000 EUR", description: "580 PS Allrad-Bolide - Alltagssportwagen auf hoechstem Niveau.", emoji: "🏎️"),
    Car(id: "p_turbo_s_991", brand: "Porsche", modelFamily: "911 Turbo", model: "911 Turbo S (991.2)", generation: "991.2", year: 2016, category: "Supersportwagen", rarityLevel: 4, hp: 580, topSpeed: 330, price: "ab 130.000 EUR", description: "580 PS mit PDCC - bis heute einer der besten Allrounder.", emoji: "🏎️"),

    // MARK: Porsche 911 Sondermodelle
    Car(id: "p_911r_991", brand: "Porsche", modelFamily: "911 Sondermodelle", model: "911 R (991)", generation: "991", year: 2016, category: "Supersportwagen", rarityLevel: 5, hp: 500, topSpeed: 323, price: "ab 1.200.000 EUR", description: "991 GT3-Motor und Handschalter, nur 991 Stueck - kultivierte Raritaet.", emoji: "🏎️"),
    Car(id: "p_sport_classic_992", brand: "Porsche", modelFamily: "911 Sondermodelle", model: "911 Sport Classic (992)", generation: "992", year: 2022, category: "Supersportwagen", rarityLevel: 5, hp: 550, topSpeed: 315, price: "ab 350.000 EUR", description: "Nur 1250 Stueck, Handschalter, 550 PS - Hommage an die 70er.", emoji: "🏎️"),
    Car(id: "p_dakar_992", brand: "Porsche", modelFamily: "911 Sondermodelle", model: "911 Dakar (992)", generation: "992", year: 2022, category: "Offroad Supersporter", rarityLevel: 5, hp: 480, topSpeed: 240, price: "ab 240.000 EUR", description: "911 mit Gelaendefahrwerk - nur 2.500 Stueck, komplett ausverkauft.", emoji: "🏎️"),

    // MARK: Porsche 911 Oldtimer
    Car(id: "p_964_rs", brand: "Porsche", modelFamily: "911 Klassiker", model: "911 RS (964)", generation: "964", year: 1992, category: "Oldtimer", rarityLevel: 5, hp: 260, topSpeed: 260, price: "ab 1.200.000 EUR", description: "Leichtbau-911 von 1992 - heute millionenschwerer Sammlerklassiker.", emoji: "🏎️"),
    Car(id: "p_993_turbo", brand: "Porsche", modelFamily: "911 Klassiker", model: "911 Turbo (993)", generation: "993", year: 1995, category: "Oldtimer", rarityLevel: 5, hp: 408, topSpeed: 290, price: "ab 400.000 EUR", description: "Letzter luftgekuehlter Turbo - der heilige Gral der 911-Geschichte.", emoji: "🏎️"),
    Car(id: "p_930_turbo", brand: "Porsche", modelFamily: "911 Klassiker", model: "911 Turbo (930)", generation: "930", year: 1975, category: "Oldtimer", rarityLevel: 5, hp: 260, topSpeed: 250, price: "ab 250.000 EUR", description: "Der Widowmaker - 260 PS und kein ABS, reines Fahrtalent gefragt.", emoji: "🏎️"),

    // MARK: Porsche 718
    Car(id: "p_718_gt4", brand: "Porsche", modelFamily: "718", model: "718 Cayman GT4 RS", generation: "982", year: 2021, category: "Supersportwagen", rarityLevel: 4, hp: 500, topSpeed: 315, price: "ab 160.000 EUR", description: "500 PS GT3-Motor im kleinen Mittelmotor-Coupe - fahrdynamisch unerreicht.", emoji: "🏎️"),
    Car(id: "p_718_gts", brand: "Porsche", modelFamily: "718", model: "718 Cayman GTS 4.0", generation: "982", year: 2020, category: "Sportwagen", rarityLevel: 3, hp: 400, topSpeed: 293, price: "ab 90.000 EUR", description: "400 PS Saugmotor, perfekte Balance - das bessere 911?", emoji: "🏎️"),
    Car(id: "p_718_boxster_spyder", brand: "Porsche", modelFamily: "718", model: "718 Boxster Spyder", generation: "982", year: 2019, category: "Sportwagen", rarityLevel: 4, hp: 420, topSpeed: 301, price: "ab 100.000 EUR", description: "420 PS Saugmotor, offenes Verdeck - puristischer Fahrspass.", emoji: "🏎️"),

    // MARK: Porsche Taycan
    Car(id: "p_taycan_turbo_s", brand: "Porsche", modelFamily: "Taycan", model: "Taycan Turbo S", generation: "J1", year: 2020, category: "Elektro Sportwagen", rarityLevel: 4, hp: 761, topSpeed: 260, price: "ab 190.000 EUR", description: "761 PS, 0-100 in 2,8 s - schnellstes elektrisches Serienfahrzeug seiner Zeit.", emoji: "🏎️"),
    Car(id: "p_taycan_turbo_gt", brand: "Porsche", modelFamily: "Taycan", model: "Taycan Turbo GT", generation: "J1 FL", year: 2024, category: "Elektro Sportwagen", rarityLevel: 5, hp: 1092, topSpeed: 305, price: "ab 230.000 EUR", description: "1092 PS, 0-100 in 2,2 s - schnellstes Serien-Porsche aller Zeiten.", emoji: "🏎️"),
    Car(id: "p_taycan_gts", brand: "Porsche", modelFamily: "Taycan", model: "Taycan GTS", generation: "J1 FL", year: 2024, category: "Elektro Sportwagen", rarityLevel: 3, hp: 590, topSpeed: 250, price: "ab 130.000 EUR", description: "590 PS sportlichster Taycan-Alltag - mit Heckantrieb-Bias.", emoji: "🏎️"),

    // MARK: Porsche Cayenne / Macan / Panamera
    Car(id: "p_cayenne_turbo_gt", brand: "Porsche", modelFamily: "Cayenne", model: "Cayenne Turbo GT", generation: "E3 FL", year: 2021, category: "Super SUV", rarityLevel: 4, hp: 640, topSpeed: 300, price: "ab 190.000 EUR", description: "640 PS, schnellstes Serien-SUV auf der Nordschleife.", emoji: "🚙"),
    Car(id: "p_cayenne_s", brand: "Porsche", modelFamily: "Cayenne", model: "Cayenne S", generation: "E3 FL", year: 2023, category: "SUV", rarityLevel: 2, hp: 474, topSpeed: 270, price: "ab 110.000 EUR", description: "Neu aufgelegter V8-Hybrid - eleganter Allrounder.", emoji: "🚙"),
    Car(id: "p_macan_ev", brand: "Porsche", modelFamily: "Macan", model: "Macan Turbo EV", generation: "B2", year: 2024, category: "SUV Elektro", rarityLevel: 3, hp: 639, topSpeed: 260, price: "ab 100.000 EUR", description: "639 PS vollelektrischer Macan - 0-100 in 3,3 s.", emoji: "🚙"),
    Car(id: "p_panamera_turbo_s", brand: "Porsche", modelFamily: "Panamera", model: "Panamera Turbo S E-Hybrid", generation: "971 FL", year: 2024, category: "Sport Limousine", rarityLevel: 4, hp: 782, topSpeed: 315, price: "ab 215.000 EUR", description: "782 PS Plug-in Hybrid - staerkste Panamera aller Zeiten.", emoji: "🏎️"),

    // ═══════════════════════════════════════════════════════════
    // MARK: - FERRARI
    // ═══════════════════════════════════════════════════════════

    // MARK: Ferrari V12 Sauger
    Car(id: "f_812_gts", brand: "Ferrari", modelFamily: "812", model: "812 GTS", generation: "812", year: 2019, category: "Supersportwagen", rarityLevel: 5, hp: 800, topSpeed: 340, price: "ab 380.000 EUR", description: "800 PS V12 Saugmotor, Targa - klingt wie nichts sonst auf der Welt.", emoji: "🏎️"),
    Car(id: "f_812_superfast", brand: "Ferrari", modelFamily: "812", model: "812 Superfast", generation: "812", year: 2017, category: "Supersportwagen", rarityLevel: 5, hp: 800, topSpeed: 340, price: "ab 330.000 EUR", description: "800 PS V12 - Frontmotor-Ferrari in Perfektion.", emoji: "🏎️"),
    Car(id: "f_12tdf", brand: "Ferrari", modelFamily: "812", model: "F12tdf", generation: "F12", year: 2015, category: "Supersportwagen", rarityLevel: 5, hp: 780, topSpeed: 340, price: "ab 900.000 EUR", description: "780 PS, Heckantrieb, nur 799 Stueck - Hommage an die Tour de France.", emoji: "🏎️"),
    Car(id: "f_daytona_sp3", brand: "Ferrari", modelFamily: "Icona", model: "Daytona SP3", generation: "Icona", year: 2022, category: "Hypercar", rarityLevel: 5, hp: 840, topSpeed: 340, price: "ab 2.300.000 EUR", description: "840 PS V12 Sauger, nur 599 Stueck - emotionalstes Auto der Welt.", emoji: "🏎️"),

    // MARK: Ferrari V8 Turbo
    Car(id: "f_296_gtb", brand: "Ferrari", modelFamily: "296 GTB", model: "296 GTB", generation: "296", year: 2022, category: "Supersportwagen", rarityLevel: 5, hp: 830, topSpeed: 330, price: "ab 320.000 EUR", description: "830 PS V6 Hybrid Mittelmotor - Ferraris neue Sportwagenphilosophie.", emoji: "🏎️"),
    Car(id: "f_296_gts", brand: "Ferrari", modelFamily: "296 GTB", model: "296 GTS", generation: "296", year: 2022, category: "Supersportwagen", rarityLevel: 5, hp: 830, topSpeed: 330, price: "ab 360.000 EUR", description: "Spider-Version des 296 GTB - gleiche Power, offenes Dach.", emoji: "🏎️"),
    Car(id: "f_f8_tributo", brand: "Ferrari", modelFamily: "F8", model: "F8 Tributo", generation: "F8", year: 2019, category: "Supersportwagen", rarityLevel: 5, hp: 720, topSpeed: 340, price: "ab 280.000 EUR", description: "720 PS V8 Biturbo - Hommage an den legendaeren 308.", emoji: "🏎️"),
    Car(id: "f_f8_spider", brand: "Ferrari", modelFamily: "F8", model: "F8 Spider", generation: "F8", year: 2019, category: "Supersportwagen", rarityLevel: 5, hp: 720, topSpeed: 340, price: "ab 310.000 EUR", description: "Spider-Variante des F8 Tributo - Freiluft-Supersport.", emoji: "🏎️"),
    Car(id: "f_sf90", brand: "Ferrari", modelFamily: "SF90", model: "SF90 Stradale", generation: "SF90", year: 2020, category: "Hypercar", rarityLevel: 5, hp: 1000, topSpeed: 340, price: "ab 500.000 EUR", description: "1000 PS Plug-in Hybrid, 0-100 in 2,5 s - technologischer Meilenstein.", emoji: "🏎️"),
    Car(id: "f_sf90_spider", brand: "Ferrari", modelFamily: "SF90", model: "SF90 Spider", generation: "SF90", year: 2021, category: "Hypercar", rarityLevel: 5, hp: 1000, topSpeed: 340, price: "ab 570.000 EUR", description: "1000 PS, elektrisches Faltdach - staerkster offener Serien-Ferrari.", emoji: "🏎️"),
    Car(id: "f_roma", brand: "Ferrari", modelFamily: "Roma", model: "Roma", generation: "Roma", year: 2020, category: "Gran Turismo", rarityLevel: 4, hp: 620, topSpeed: 320, price: "ab 230.000 EUR", description: "620 PS V8 GT-Coupe im Stil des alten Roms.", emoji: "🏎️"),
    Car(id: "f_roma_spider", brand: "Ferrari", modelFamily: "Roma", model: "Roma Spider", generation: "Roma", year: 2023, category: "Gran Turismo", rarityLevel: 4, hp: 620, topSpeed: 320, price: "ab 270.000 EUR", description: "Cabrio-Version des Roma - elektrisches Hardtop.", emoji: "🏎️"),

    // MARK: Ferrari SUV
    Car(id: "f_purosangue", brand: "Ferrari", modelFamily: "Purosangue", model: "Purosangue", generation: "Purosangue", year: 2023, category: "Super SUV", rarityLevel: 5, hp: 725, topSpeed: 310, price: "ab 400.000 EUR", description: "Ferraris erster 4-Turer / SUV - V12 mit 725 PS, revolutionaer.", emoji: "🚙"),

    // MARK: Ferrari Oldtimer
    Car(id: "f_f40", brand: "Ferrari", modelFamily: "Klassiker", model: "F40", generation: "F40", year: 1987, category: "Oldtimer", rarityLevel: 5, hp: 478, topSpeed: 324, price: "ab 2.000.000 EUR", description: "Kein ABS, kein Servo - letzter Ferrari, den Enzo persoenlich genehmigte.", emoji: "🏎️"),
    Car(id: "f_f50", brand: "Ferrari", modelFamily: "Klassiker", model: "F50", generation: "F50", year: 1995, category: "Oldtimer", rarityLevel: 5, hp: 520, topSpeed: 325, price: "ab 4.000.000 EUR", description: "F1-Motor fuer die Strasse - nur 349 Exemplare gebaut.", emoji: "🏎️"),
    Car(id: "f_enzo", brand: "Ferrari", modelFamily: "Klassiker", model: "Enzo Ferrari", generation: "Enzo", year: 2002, category: "Hypercar", rarityLevel: 5, hp: 660, topSpeed: 355, price: "ab 3.000.000 EUR", description: "660 PS V12, nur 399 Stueck - benannt nach dem Gruender.", emoji: "🏎️"),
    Car(id: "f_laferrari", brand: "Ferrari", modelFamily: "Klassiker", model: "LaFerrari", generation: "LaFerrari", year: 2013, category: "Hypercar", rarityLevel: 5, hp: 963, topSpeed: 350, price: "ab 7.000.000 EUR", description: "963 PS Hybrid V12 - Ferraris ultimatives Strassenfahrzeug, 499 Stueck.", emoji: "🏎️"),
    Car(id: "f_288_gto", brand: "Ferrari", modelFamily: "Klassiker", model: "288 GTO", generation: "288", year: 1984, category: "Oldtimer", rarityLevel: 5, hp: 400, topSpeed: 304, price: "ab 3.000.000 EUR", description: "400 PS Gruppe-B-Homologation - Startpunkt der Ferrari Sondermodelle.", emoji: "🏎️"),

    // ═══════════════════════════════════════════════════════════
    // MARK: - LAMBORGHINI
    // ═══════════════════════════════════════════════════════════

    Car(id: "l_revuelto", brand: "Lamborghini", modelFamily: "Revuelto", model: "Revuelto", generation: "LB744", year: 2023, category: "Hypercar", rarityLevel: 5, hp: 1015, topSpeed: 350, price: "ab 500.000 EUR", description: "1015 PS V12 Plug-in Hybrid - Nachfolger des Aventador.", emoji: "🏎️"),
    Car(id: "l_aventador_svj", brand: "Lamborghini", modelFamily: "Aventador", model: "Aventador SVJ", generation: "LP770-4", year: 2018, category: "Hypercar", rarityLevel: 5, hp: 770, topSpeed: 350, price: "ab 600.000 EUR", description: "770 PS, Nordschleife-Rekord 6:44,97 - ultimativer V12-Lambo.", emoji: "🏎️"),
    Car(id: "l_aventador_ultimae", brand: "Lamborghini", modelFamily: "Aventador", model: "Aventador Ultimae", generation: "LP780-4", year: 2021, category: "Hypercar", rarityLevel: 5, hp: 780, topSpeed: 355, price: "ab 600.000 EUR", description: "780 PS - finales Sondermodell, letztes reines V12-Lambo.", emoji: "🏎️"),
    Car(id: "l_huracan_evo", brand: "Lamborghini", modelFamily: "Huracan", model: "Huracan EVO", generation: "LP640-4", year: 2019, category: "Supersportwagen", rarityLevel: 5, hp: 640, topSpeed: 325, price: "ab 230.000 EUR", description: "640 PS V10 Saugmotor - bruellendes Meisterwerk.", emoji: "🏎️"),
    Car(id: "l_huracan_sterrato", brand: "Lamborghini", modelFamily: "Huracan", model: "Huracan Sterrato", generation: "LP610-2", year: 2023, category: "Offroad Supersporter", rarityLevel: 5, hp: 610, topSpeed: 260, price: "ab 280.000 EUR", description: "V10 Supersportler fuer die Schotterpiste - einzigartiges Konzept.", emoji: "🏎️"),
    Car(id: "l_huracan_sto", brand: "Lamborghini", modelFamily: "Huracan", model: "Huracan STO", generation: "LP620-2", year: 2021, category: "Supersportwagen", rarityLevel: 5, hp: 640, topSpeed: 310, price: "ab 330.000 EUR", description: "Rennwagen mit Strassenzulassung - Heckantrieb, extremes Aeropaket.", emoji: "🏎️"),
    Car(id: "l_huracan_tecnica", brand: "Lamborghini", modelFamily: "Huracan", model: "Huracan Tecnica", generation: "LP640-2", year: 2022, category: "Supersportwagen", rarityLevel: 5, hp: 640, topSpeed: 325, price: "ab 270.000 EUR", description: "640 PS Heckantrieb - der spassigste Huracan.", emoji: "🏎️"),
    Car(id: "l_urus_s", brand: "Lamborghini", modelFamily: "Urus", model: "Urus S", generation: "1G", year: 2022, category: "Super SUV", rarityLevel: 4, hp: 666, topSpeed: 305, price: "ab 260.000 EUR", description: "666 PS Biturbo SUV - der schnellste SUV Europas.", emoji: "🚙"),
    Car(id: "l_urus_performante", brand: "Lamborghini", modelFamily: "Urus", model: "Urus Performante", generation: "1G", year: 2022, category: "Super SUV", rarityLevel: 5, hp: 666, topSpeed: 306, price: "ab 280.000 EUR", description: "Sport-Version des Urus - leichter, schaerfer, echter Lambo.", emoji: "🚙"),
    Car(id: "l_urus_se", brand: "Lamborghini", modelFamily: "Urus", model: "Urus SE", generation: "2G", year: 2024, category: "Super SUV", rarityLevel: 4, hp: 800, topSpeed: 312, price: "ab 350.000 EUR", description: "800 PS Plug-in Hybrid - neuer Urus mit elektrifiziertem Antrieb.", emoji: "🚙"),
    Car(id: "l_diablo", brand: "Lamborghini", modelFamily: "Klassiker", model: "Diablo GT", generation: "Diablo", year: 1999, category: "Oldtimer", rarityLevel: 5, hp: 575, topSpeed: 338, price: "ab 800.000 EUR", description: "575 PS, nur 83 Stueck - der wildeste Diablo aller Zeiten.", emoji: "🏎️"),
    Car(id: "l_countach_lpi", brand: "Lamborghini", modelFamily: "Klassiker", model: "Countach LPI 800-4", generation: "Countach", year: 2021, category: "Hypercar", rarityLevel: 5, hp: 803, topSpeed: 355, price: "ab 2.000.000 EUR", description: "Neuinterpretation der Ikone - 803 PS V12 Hybrid, nur 112 Stueck.", emoji: "🏎️"),

    // ═══════════════════════════════════════════════════════════
    // MARK: - McLAREN
    // ═══════════════════════════════════════════════════════════

    Car(id: "mc_artura", brand: "McLaren", modelFamily: "Artura", model: "Artura", generation: "Artura", year: 2021, category: "Supersportwagen", rarityLevel: 5, hp: 700, topSpeed: 330, price: "ab 240.000 EUR", description: "700 PS V6 Hybrid - neue Plattform, Zukunft von McLaren.", emoji: "🏎️"),
    Car(id: "mc_artura_spider", brand: "McLaren", modelFamily: "Artura", model: "Artura Spider", generation: "Artura", year: 2024, category: "Supersportwagen", rarityLevel: 5, hp: 700, topSpeed: 330, price: "ab 280.000 EUR", description: "Cabrio-Version des Artura - Hybridpower ohne Dach.", emoji: "🏎️"),
    Car(id: "mc_750s", brand: "McLaren", modelFamily: "750S", model: "750S Coupe", generation: "750S", year: 2023, category: "Supersportwagen", rarityLevel: 5, hp: 740, topSpeed: 332, price: "ab 330.000 EUR", description: "740 PS - leichter und schaerfer als der 720S.", emoji: "🏎️"),
    Car(id: "mc_750s_spider", brand: "McLaren", modelFamily: "750S", model: "750S Spider", generation: "750S", year: 2023, category: "Supersportwagen", rarityLevel: 5, hp: 740, topSpeed: 332, price: "ab 365.000 EUR", description: "Spider-Version des 750S - Retractable Hardtop.", emoji: "🏎️"),
    Car(id: "mc_720s", brand: "McLaren", modelFamily: "720S", model: "720S", generation: "720S", year: 2017, category: "Supersportwagen", rarityLevel: 5, hp: 720, topSpeed: 341, price: "ab 250.000 EUR", description: "720 PS, 0-100 in 2,9 s - extremer Leichtbau, ProActive Fahrwerk.", emoji: "🏎️"),
    Car(id: "mc_720s_spider", brand: "McLaren", modelFamily: "720S", model: "720S Spider", generation: "720S", year: 2019, category: "Supersportwagen", rarityLevel: 5, hp: 720, topSpeed: 341, price: "ab 290.000 EUR", description: "Elektrohydraulisches Dach, 720 PS - das bessere Cabriolet.", emoji: "🏎️"),
    Car(id: "mc_senna", brand: "McLaren", modelFamily: "Ultimate", model: "Senna", generation: "P15", year: 2018, category: "Hypercar", rarityLevel: 5, hp: 800, topSpeed: 335, price: "ab 1.000.000 EUR", description: "800 PS, nur 500 Stueck - kompromisslosester McLaren fuer die Strasse.", emoji: "🏎️"),
    Car(id: "mc_p1", brand: "McLaren", modelFamily: "Ultimate", model: "P1", generation: "P12", year: 2013, category: "Hypercar", rarityLevel: 5, hp: 916, topSpeed: 350, price: "ab 2.500.000 EUR", description: "916 PS Hybrid, nur 375 Stueck - McLarens heiligste Kuh.", emoji: "🏎️"),
    Car(id: "mc_speedtail", brand: "McLaren", modelFamily: "Ultimate", model: "Speedtail", generation: "BP23", year: 2020, category: "Hypercar", rarityLevel: 5, hp: 1050, topSpeed: 403, price: "ab 2.400.000 EUR", description: "1050 PS Hybrid, 403 km/h, nur 106 Stueck - schnellster McLaren.", emoji: "🏎️"),
    Car(id: "mc_elva", brand: "McLaren", modelFamily: "Ultimate", model: "Elva", generation: "M1A", year: 2020, category: "Hypercar", rarityLevel: 5, hp: 815, topSpeed: 320, price: "ab 1.700.000 EUR", description: "815 PS, offen ohne Windschutzscheibe - spektakulaerste Fahrerfahrung.", emoji: "🏎️"),
    Car(id: "mc_f1", brand: "McLaren", modelFamily: "Klassiker", model: "F1", generation: "F1", year: 1992, category: "Hypercar", rarityLevel: 5, hp: 627, topSpeed: 386, price: "ab 20.000.000 EUR", description: "627 PS BMW V12, 386 km/h - 24 Jahre lang das schnellste Serienauto.", emoji: "🏎️"),

    // ═══════════════════════════════════════════════════════════
    // MARK: - BMW M
    // ═══════════════════════════════════════════════════════════

    Car(id: "bmw_m2_g87", brand: "BMW", modelFamily: "M2", model: "M2 (G87)", generation: "G87", year: 2022, category: "Sport Coupe", rarityLevel: 3, hp: 460, topSpeed: 285, price: "ab 75.000 EUR", description: "460 PS Reihensechszylinder - kompaktester M aller Zeiten.", emoji: "🏎️"),
    Car(id: "bmw_m2_cs_f87", brand: "BMW", modelFamily: "M2", model: "M2 CS (F87)", generation: "F87", year: 2020, category: "Sport Coupe", rarityLevel: 4, hp: 450, topSpeed: 280, price: "ab 100.000 EUR", description: "450 PS, CFRP-Elemente, nur 2.200 Stueck - letzter F87.", emoji: "🏎️"),
    Car(id: "bmw_m2_f87", brand: "BMW", modelFamily: "M2", model: "M2 Competition (F87)", generation: "F87", year: 2018, category: "Sport Coupe", rarityLevel: 3, hp: 410, topSpeed: 280, price: "ab 55.000 EUR", description: "410 PS S55-Motor im kompakten Coupe - puristischster M.", emoji: "🏎️"),
    Car(id: "bmw_m3_g80_comp", brand: "BMW", modelFamily: "M3", model: "M3 Competition (G80)", generation: "G80", year: 2021, category: "Sport Limousine", rarityLevel: 3, hp: 510, topSpeed: 290, price: "ab 97.000 EUR", description: "510 PS S58-Motor, optional Allrad - modernste Sportlimousine.", emoji: "🏎️"),
    Car(id: "bmw_m3_g80_tour", brand: "BMW", modelFamily: "M3", model: "M3 Competition Touring (G81)", generation: "G81", year: 2022, category: "Sport Kombi", rarityLevel: 3, hp: 510, topSpeed: 290, price: "ab 106.000 EUR", description: "Erster M3 Touring mit Allrad - Rekordhalter unter den Kombis.", emoji: "🏎️"),
    Car(id: "bmw_m3_cs_g80", brand: "BMW", modelFamily: "M3", model: "M3 CS (G80)", generation: "G80", year: 2023, category: "Sport Limousine", rarityLevel: 4, hp: 550, topSpeed: 302, price: "ab 145.000 EUR", description: "550 PS, Carbon-Dach, CFRP-Motorhaube - schaerfste M3 Limousine.", emoji: "🏎️"),
    Car(id: "bmw_m3_e46", brand: "BMW", modelFamily: "M3", model: "M3 CSL (E46)", generation: "E46", year: 2003, category: "Oldtimer", rarityLevel: 5, hp: 360, topSpeed: 270, price: "ab 180.000 EUR", description: "360 PS, nur 1.383 Stueck, Carbon-Dach - heiligste E46-Version.", emoji: "🏎️"),
    Car(id: "bmw_m3_e30", brand: "BMW", modelFamily: "M3", model: "M3 (E30)", generation: "E30", year: 1986, category: "Oldtimer", rarityLevel: 4, hp: 200, topSpeed: 235, price: "ab 80.000 EUR", description: "200 PS, DTM-Sieger - der Ur-M3, Klassiker-Ikone.", emoji: "🏎️"),
    Car(id: "bmw_m4_g82_comp", brand: "BMW", modelFamily: "M4", model: "M4 Competition (G82)", generation: "G82", year: 2021, category: "Sport Coupe", rarityLevel: 3, hp: 510, topSpeed: 290, price: "ab 98.000 EUR", description: "510 PS, grosses Nierengrill-Design - spaltende Aesthetik, ungekannte Leistung.", emoji: "🏎️"),
    Car(id: "bmw_m4_csl_g82", brand: "BMW", modelFamily: "M4", model: "M4 CSL (G82)", generation: "G82", year: 2022, category: "Supersportwagen", rarityLevel: 5, hp: 550, topSpeed: 307, price: "ab 165.000 EUR", description: "550 PS, nur 1.000 Stueck weltweit, kein Ruecksitz - puristischster M4.", emoji: "🏎️"),
    Car(id: "bmw_m5_f90_comp", brand: "BMW", modelFamily: "M5", model: "M5 Competition (F90)", generation: "F90", year: 2018, category: "Sport Limousine", rarityLevel: 3, hp: 625, topSpeed: 305, price: "ab 120.000 EUR", description: "625 PS V8 Biturbo - King der Sportlimousinen.", emoji: "🏎️"),
    Car(id: "bmw_m5_g90", brand: "BMW", modelFamily: "M5", model: "M5 (G90)", generation: "G90", year: 2024, category: "Sport Limousine", rarityLevel: 3, hp: 727, topSpeed: 305, price: "ab 145.000 EUR", description: "727 PS Plug-in Hybrid V8 - staerkster M5 aller Zeiten.", emoji: "🏎️"),
    Car(id: "bmw_m5_e60", brand: "BMW", modelFamily: "M5", model: "M5 (E60)", generation: "E60", year: 2004, category: "Oldtimer", rarityLevel: 3, hp: 507, topSpeed: 250, price: "ab 30.000 EUR", description: "507 PS V10 Saugmotor - motorsportlichster M5 aller Zeiten.", emoji: "🏎️"),
    Car(id: "bmw_m8_f92_comp", brand: "BMW", modelFamily: "M8", model: "M8 Competition Coupe (F92)", generation: "F92", year: 2019, category: "Gran Turismo", rarityLevel: 4, hp: 625, topSpeed: 305, price: "ab 160.000 EUR", description: "625 PS V8, 2+2 GT - schoeenstes BMW-Coupe seit dem 8er E31.", emoji: "🏎️"),
    Car(id: "bmw_i8", brand: "BMW", modelFamily: "i8", model: "i8 Roadster", generation: "I15", year: 2018, category: "Sportwagen Hybrid", rarityLevel: 3, hp: 374, topSpeed: 250, price: "ab 60.000 EUR", description: "374 PS Hybrid, Fluegeltuerren - futuristischster BMW.", emoji: "🏎️"),
    Car(id: "bmw_1m_e82", brand: "BMW", modelFamily: "1M", model: "1M Coupe (E82)", generation: "E82", year: 2011, category: "Sport Coupe", rarityLevel: 5, hp: 340, topSpeed: 250, price: "ab 80.000 EUR", description: "340 PS, nur 6.309 Stueck - der erste 1er M, heute Kultstatus.", emoji: "🏎️"),
    Car(id: "bmw_3er_g20", brand: "BMW", modelFamily: "3er", model: "3er (G20)", generation: "G20", year: 2019, category: "Mittelklasse", rarityLevel: 1, hp: 156, topSpeed: 225, price: "ab 43.000 EUR", description: "Der Sportwagen unter den Mittelklasslern.", emoji: "🚗"),
    Car(id: "bmw_x5_g05", brand: "BMW", modelFamily: "X5 M", model: "X5 M Competition (G05)", generation: "G05", year: 2018, category: "Super SUV", rarityLevel: 3, hp: 625, topSpeed: 290, price: "ab 135.000 EUR", description: "625 PS V8 - schnellstes BMW-SUV.", emoji: "🚙"),

    // ═══════════════════════════════════════════════════════════
    // MARK: - MERCEDES-BENZ AMG
    // ═══════════════════════════════════════════════════════════

    Car(id: "mb_amg_gt_r", brand: "Mercedes-Benz", modelFamily: "AMG GT", model: "AMG GT R Pro", generation: "C190", year: 2019, category: "Supersportwagen", rarityLevel: 5, hp: 585, topSpeed: 318, price: "ab 200.000 EUR", description: "585 PS, mechanisches Sperrdiff, Rennstreckenprogramm - beeindruckend.", emoji: "🏎️"),
    Car(id: "mb_amg_gt_63_s", brand: "Mercedes-Benz", modelFamily: "AMG GT", model: "AMG GT 63 S (X290)", generation: "X290", year: 2019, category: "Sport Limousine", rarityLevel: 4, hp: 630, topSpeed: 315, price: "ab 175.000 EUR", description: "630 PS V8 4-Turer - rasanteste Sportlimousine aus Affalterbach.", emoji: "🏎️"),
    Car(id: "mb_amg_gt2_coupe", brand: "Mercedes-Benz", modelFamily: "AMG GT", model: "AMG GT Coupe (X296)", generation: "X296", year: 2023, category: "Gran Turismo", rarityLevel: 4, hp: 476, topSpeed: 290, price: "ab 180.000 EUR", description: "Neues GT Coupe - Gran Turismo mit AMG-Charakter.", emoji: "🏎️"),
    Car(id: "mb_amg_c63_w206", brand: "Mercedes-Benz", modelFamily: "AMG C63", model: "AMG C63 S E-Performance (W206)", generation: "W206", year: 2023, category: "Sport Limousine", rarityLevel: 3, hp: 680, topSpeed: 280, price: "ab 90.000 EUR", description: "680 PS Plug-in Hybrid - der umstrittenste C63 aller Zeiten.", emoji: "🏎️"),
    Car(id: "mb_amg_c63_w205", brand: "Mercedes-Benz", modelFamily: "AMG C63", model: "AMG C63 S (W205)", generation: "W205", year: 2015, category: "Sport Limousine", rarityLevel: 3, hp: 510, topSpeed: 290, price: "ab 50.000 EUR", description: "510 PS V8 - der letzte richtige C63 mit Achtzylinder.", emoji: "🏎️"),
    Car(id: "mb_amg_e63_w213", brand: "Mercedes-Benz", modelFamily: "AMG E63", model: "AMG E63 S (W213)", generation: "W213", year: 2017, category: "Sport Limousine", rarityLevel: 3, hp: 612, topSpeed: 300, price: "ab 80.000 EUR", description: "612 PS V8, Allrad - die schnellste Mittelklasse der Welt.", emoji: "🏎️"),
    Car(id: "mb_amg_one", brand: "Mercedes-Benz", modelFamily: "AMG ONE", model: "AMG ONE", generation: "ONE", year: 2022, category: "Hypercar", rarityLevel: 5, hp: 1063, topSpeed: 352, price: "ab 2.700.000 EUR", description: "F1-Motor im Strassenauto - 1063 PS, 0-100 in 2,9 s, nur 275 Stueck.", emoji: "🏎️"),
    Car(id: "mb_sls_amg", brand: "Mercedes-Benz", modelFamily: "SLS AMG", model: "SLS AMG Black Series", generation: "C197", year: 2012, category: "Supersportwagen", rarityLevel: 5, hp: 631, topSpeed: 317, price: "ab 500.000 EUR", description: "631 PS, Fluegeltuerren, nur 350 Stueck - wildstes SLS-Derivat.", emoji: "🏎️"),
    Car(id: "mb_sls_electric", brand: "Mercedes-Benz", modelFamily: "SLS AMG", model: "SLS AMG Electric Drive", generation: "C197 E", year: 2013, category: "Elektro Supersportwagen", rarityLevel: 5, hp: 751, topSpeed: 250, price: "ab 700.000 EUR", description: "751 PS, 4 E-Motoren, Fluegeltuerren - weltweit erster E-Supersportwagen.", emoji: "🏎️"),
    Car(id: "mb_300sl", brand: "Mercedes-Benz", modelFamily: "Klassiker", model: "300 SL Flugelturer", generation: "W198", year: 1954, category: "Oldtimer", rarityLevel: 5, hp: 215, topSpeed: 250, price: "ab 1.500.000 EUR", description: "Fluegeltuerren-Ikone von 1954 - eines der schoensten Autos der Geschichte.", emoji: "🏎️"),
    Car(id: "mb_s_klasse_w223", brand: "Mercedes-Benz", modelFamily: "S-Klasse", model: "S-Klasse (W223)", generation: "W223", year: 2021, category: "Luxuslimousine", rarityLevel: 3, hp: 367, topSpeed: 250, price: "ab 110.000 EUR", description: "Das beste Auto der Welt - Massstab aller Luxuslimousinen.", emoji: "🚗"),
    Car(id: "mb_g_klasse", brand: "Mercedes-Benz", modelFamily: "G-Klasse", model: "G-Klasse AMG 63 (W464)", generation: "W464", year: 2018, category: "Super SUV", rarityLevel: 3, hp: 585, topSpeed: 240, price: "ab 195.000 EUR", description: "585 PS AMG V8 in der Gelaendewagen-Ikone seit 1979.", emoji: "🚙"),

    // ═══════════════════════════════════════════════════════════
    // MARK: - AUDI RS
    // ═══════════════════════════════════════════════════════════

    Car(id: "audi_rs6_c8", brand: "Audi", modelFamily: "RS6 Avant", model: "RS6 Avant (C8)", generation: "C8", year: 2020, category: "Sport Kombi", rarityLevel: 3, hp: 600, topSpeed: 305, price: "ab 130.000 EUR", description: "600 PS V8 Kombi - der beruehmteste Alltags-Rennwagen.", emoji: "🏎️"),
    Car(id: "audi_rs6_c8_perf", brand: "Audi", modelFamily: "RS6 Avant", model: "RS6 Avant Performance (C8)", generation: "C8", year: 2023, category: "Sport Kombi", rarityLevel: 4, hp: 630, topSpeed: 305, price: "ab 145.000 EUR", description: "630 PS - die staerkste Serienversion des RS6.", emoji: "🏎️"),
    Car(id: "audi_rs3_8y", brand: "Audi", modelFamily: "RS3", model: "RS3 Sportback (8Y)", generation: "8Y", year: 2021, category: "Hot Hatch", rarityLevel: 3, hp: 400, topSpeed: 290, price: "ab 65.000 EUR", description: "400 PS, RS-Torque-Splitter - spektakulaerer Drift-Modus.", emoji: "🏎️"),
    Car(id: "audi_rs4_b9", brand: "Audi", modelFamily: "RS4 Avant", model: "RS4 Avant (B9)", generation: "B9", year: 2017, category: "Sport Kombi", rarityLevel: 3, hp: 450, topSpeed: 280, price: "ab 80.000 EUR", description: "450 PS V6 - der erschwingliche Bruder des RS6.", emoji: "🏎️"),
    Car(id: "audi_r8_v10", brand: "Audi", modelFamily: "R8", model: "R8 V10 Performance (Gen 2)", generation: "4S FL", year: 2019, category: "Supersportwagen", rarityLevel: 4, hp: 620, topSpeed: 331, price: "ab 180.000 EUR", description: "620 PS V10 Saugmotor - einziger echter Supersportler von Audi.", emoji: "🏎️"),
    Car(id: "audi_r8_v10_final", brand: "Audi", modelFamily: "R8", model: "R8 V10 GT RWD (Final Edition)", generation: "4S", year: 2023, category: "Supersportwagen", rarityLevel: 5, hp: 620, topSpeed: 330, price: "ab 250.000 EUR", description: "Letzter R8 mit Heckantrieb, nur 333 Stueck - Abschied einer Legende.", emoji: "🏎️"),
    Car(id: "audi_rs_e_tron_gt", brand: "Audi", modelFamily: "RS e-tron GT", model: "RS e-tron GT Performance", generation: "J1 FL", year: 2024, category: "Elektro Sportwagen", rarityLevel: 3, hp: 925, topSpeed: 250, price: "ab 165.000 EUR", description: "925 PS Elektro-Gran-Turismo - Bruder des Porsche Taycan Turbo GT.", emoji: "🏎️"),
    Car(id: "audi_tt_rs_8s", brand: "Audi", modelFamily: "TT RS", model: "TT RS Coupe (8S)", generation: "8S", year: 2016, category: "Hot Hatch", rarityLevel: 3, hp: 400, topSpeed: 250, price: "ab 65.000 EUR", description: "400 PS Fuenfzylinder - typisch Audi Sport DNA im kompakten Paket.", emoji: "🏎️"),
    Car(id: "audi_a4_b9", brand: "Audi", modelFamily: "A4", model: "A4 Avant (B9)", generation: "B9", year: 2016, category: "Mittelklasse", rarityLevel: 1, hp: 150, topSpeed: 218, price: "ab 40.000 EUR", description: "Audi-Klassiker der oberen Mittelklasse.", emoji: "🚗"),

    // ═══════════════════════════════════════════════════════════
    // MARK: - BUGATTI
    // ═══════════════════════════════════════════════════════════

    Car(id: "bug_chiron", brand: "Bugatti", modelFamily: "Chiron", model: "Chiron", generation: "Chiron", year: 2016, category: "Hypercar", rarityLevel: 5, hp: 1500, topSpeed: 420, price: "ab 3.000.000 EUR", description: "1500 PS W16 Quad-Turbo - modernste Maschinenkunst der Franzosen.", emoji: "🏎️"),
    Car(id: "bug_chiron_ss", brand: "Bugatti", modelFamily: "Chiron", model: "Chiron Super Sport 300+", generation: "Chiron SS", year: 2019, category: "Hypercar", rarityLevel: 5, hp: 1600, topSpeed: 440, price: "ab 3.900.000 EUR", description: "1600 PS, 440 km/h - erstes Serienfahrzeug ueber 300 mph.", emoji: "🏎️"),
    Car(id: "bug_chiron_pur", brand: "Bugatti", modelFamily: "Chiron", model: "Chiron Pur Sport", generation: "Chiron PS", year: 2020, category: "Hypercar", rarityLevel: 5, hp: 1500, topSpeed: 350, price: "ab 3.600.000 EUR", description: "Auf Kurvenleistung optimiert - anderes Getriebe, extremes Aeropaket.", emoji: "🏎️"),
    Car(id: "bug_tourbillon", brand: "Bugatti", modelFamily: "Tourbillon", model: "Tourbillon", generation: "Tourbillon", year: 2024, category: "Hypercar", rarityLevel: 5, hp: 1800, topSpeed: 445, price: "ab 4.000.000 EUR", description: "1800 PS V16 Hybrid - Bugattis neue Aera, nur 250 Stueck.", emoji: "🏎️"),
    Car(id: "bug_bolide", brand: "Bugatti", modelFamily: "Sondermodelle", model: "Bolide", generation: "Bolide", year: 2022, category: "Hypercar", rarityLevel: 5, hp: 1850, topSpeed: 500, price: "ab 4.000.000 EUR", description: "Trackday-Extremist mit 1850 PS - nur 40 Stueck.", emoji: "🏎️"),
    Car(id: "bug_veyron_ss", brand: "Bugatti", modelFamily: "Veyron", model: "Veyron Super Sport", generation: "Veyron", year: 2010, category: "Hypercar", rarityLevel: 5, hp: 1200, topSpeed: 431, price: "ab 2.000.000 EUR", description: "1200 PS - 2010 schnellstes Serienauto der Welt mit Guinness-Rekord.", emoji: "🏎️"),

    // ═══════════════════════════════════════════════════════════
    // MARK: - KOENIGSEGG
    // ═══════════════════════════════════════════════════════════

    Car(id: "koe_jesko_absolut", brand: "Koenigsegg", modelFamily: "Jesko", model: "Jesko Absolut", generation: "Jesko", year: 2020, category: "Hypercar", rarityLevel: 5, hp: 1600, topSpeed: 531, price: "ab 3.000.000 EUR", description: "1600 PS, 531 km/h theoretisch - konzipiert als schnellstes Auto der Welt.", emoji: "🏎️"),
    Car(id: "koe_jesko_attack", brand: "Koenigsegg", modelFamily: "Jesko", model: "Jesko Attack", generation: "Jesko", year: 2020, category: "Hypercar", rarityLevel: 5, hp: 1600, topSpeed: 300, price: "ab 3.000.000 EUR", description: "Track-Version des Jesko - extremes Aeropaket fuer maximalen Abtrieb.", emoji: "🏎️"),
    Car(id: "koe_gemera", brand: "Koenigsegg", modelFamily: "Gemera", model: "Gemera", generation: "Gemera", year: 2023, category: "Hypercar", rarityLevel: 5, hp: 2300, topSpeed: 400, price: "ab 3.400.000 EUR", description: "2300 PS Hybrid, 4 Sitze, 4 Tueren - verruecktester Gran Turismo der Welt.", emoji: "🏎️"),
    Car(id: "koe_agera_rs", brand: "Koenigsegg", modelFamily: "Agera", model: "Agera RS", generation: "Agera", year: 2015, category: "Hypercar", rarityLevel: 5, hp: 1160, topSpeed: 458, price: "ab 2.000.000 EUR", description: "1160 PS, 458 km/h - 2017 Weltrekord auf oeffentlicher Strasse.", emoji: "🏎️"),
    Car(id: "koe_ccxr_trevita", brand: "Koenigsegg", modelFamily: "Klassiker", model: "CCXR Trevita", generation: "CCX", year: 2009, category: "Hypercar", rarityLevel: 5, hp: 1018, topSpeed: 410, price: "ab 4.800.000 EUR", description: "Diamond-Carbon-Beschichtung, nur 2 Exemplare - eines der seltensten Autos.", emoji: "🏎️"),

    // ═══════════════════════════════════════════════════════════
    // MARK: - PAGANI
    // ═══════════════════════════════════════════════════════════

    Car(id: "pag_huayra_r", brand: "Pagani", modelFamily: "Huayra", model: "Huayra R", generation: "Huayra R", year: 2021, category: "Hypercar", rarityLevel: 5, hp: 850, topSpeed: 370, price: "ab 3.000.000 EUR", description: "850 PS V12 Sauger, Strassenzulassung, nur 30 Stueck weltweit.", emoji: "🏎️"),
    Car(id: "pag_utopia", brand: "Pagani", modelFamily: "Utopia", model: "Utopia", generation: "Utopia", year: 2022, category: "Hypercar", rarityLevel: 5, hp: 852, topSpeed: 340, price: "ab 2.200.000 EUR", description: "852 PS AMG V12 Biturbo, nur 99 Exemplare - Pagani-Meisterwerk.", emoji: "🏎️"),
    Car(id: "pag_utopia_roadster", brand: "Pagani", modelFamily: "Utopia", model: "Utopia Roadster", generation: "Utopia", year: 2024, category: "Hypercar", rarityLevel: 5, hp: 852, topSpeed: 340, price: "ab 3.200.000 EUR", description: "Offene Version des Utopia - nur 99 Stueck, alle bereits vergeben.", emoji: "🏎️"),
    Car(id: "pag_zonda_r", brand: "Pagani", modelFamily: "Zonda", model: "Zonda R", generation: "Zonda", year: 2009, category: "Hypercar", rarityLevel: 5, hp: 750, topSpeed: 350, price: "ab 15.000.000 EUR", description: "750 PS V12, nur 15 Stueck - einer der seltensten Strassenwagen ueberhaupt.", emoji: "🏎️"),

    // ═══════════════════════════════════════════════════════════
    // MARK: - RIMAC
    // ═══════════════════════════════════════════════════════════

    Car(id: "rimac_nevera", brand: "Rimac", modelFamily: "Nevera", model: "Nevera", generation: "C_Two", year: 2021, category: "Elektro Hypercar", rarityLevel: 5, hp: 1914, topSpeed: 412, price: "ab 2.400.000 EUR", description: "1914 PS, 0-100 in 1,97 s - schnellstes Serienfahrzeug der Welt.", emoji: "🏎️"),
    Car(id: "rimac_nevera_r", brand: "Rimac", modelFamily: "Nevera", model: "Nevera R", generation: "C_Two R", year: 2024, category: "Elektro Hypercar", rarityLevel: 5, hp: 2107, topSpeed: 415, price: "ab 2.800.000 EUR", description: "2107 PS, 0-100 in 1,81 s - staerkstes Serienfahrzeug aller Zeiten.", emoji: "🏎️"),
    Car(id: "rimac_concept_one", brand: "Rimac", modelFamily: "Klassiker", model: "Concept One", generation: "Concept", year: 2013, category: "Elektro Hypercar", rarityLevel: 5, hp: 1088, topSpeed: 305, price: "ab 1.000.000 EUR", description: "Nur 8 Stueck - das erste Rimac, das alles veraenderte.", emoji: "🏎️"),

    // ═══════════════════════════════════════════════════════════
    // MARK: - ASTON MARTIN
    // ═══════════════════════════════════════════════════════════

    Car(id: "am_vantage_2024", brand: "Aston Martin", modelFamily: "Vantage", model: "Vantage (2024)", generation: "2024", year: 2024, category: "Sportwagen", rarityLevel: 4, hp: 665, topSpeed: 325, price: "ab 180.000 EUR", description: "665 PS AMG V8 - klassisch schoeenstes britisches GT-Coupe.", emoji: "🏎️"),
    Car(id: "am_vantage_f1", brand: "Aston Martin", modelFamily: "Vantage", model: "Vantage F1 Edition", generation: "2021", year: 2021, category: "Sportwagen", rarityLevel: 4, hp: 535, topSpeed: 305, price: "ab 155.000 EUR", description: "535 PS, F1 Safety Car Edition - schaerfstes V8-Vantage-Paket.", emoji: "🏎️"),
    Car(id: "am_db12", brand: "Aston Martin", modelFamily: "DB", model: "DB12", generation: "DB12", year: 2023, category: "Gran Turismo", rarityLevel: 4, hp: 680, topSpeed: 325, price: "ab 230.000 EUR", description: "680 PS V8 - der erste Super Tourer von Aston Martin.", emoji: "🏎️"),
    Car(id: "am_dbs_770", brand: "Aston Martin", modelFamily: "DBS", model: "DBS 770 Ultimate", generation: "DBS", year: 2023, category: "Gran Turismo", rarityLevel: 5, hp: 770, topSpeed: 340, price: "ab 370.000 EUR", description: "770 PS, letzter DBS - Finale des Zwoelfzylinder-DBS.", emoji: "🏎️"),
    Car(id: "am_valkyrie", brand: "Aston Martin", modelFamily: "Valkyrie", model: "Valkyrie AMR Pro", generation: "Valkyrie", year: 2021, category: "Hypercar", rarityLevel: 5, hp: 1000, topSpeed: 360, price: "ab 3.500.000 EUR", description: "F1-Technologie auf der Strasse - Red Bull Racing co-entwickelt.", emoji: "🏎️"),
    Car(id: "am_dbx707", brand: "Aston Martin", modelFamily: "DBX", model: "DBX707", generation: "DBX707", year: 2022, category: "Super SUV", rarityLevel: 4, hp: 707, topSpeed: 310, price: "ab 260.000 EUR", description: "707 PS - leistungsstaerkstes Serien-SUV Europas.", emoji: "🚙"),

    // ═══════════════════════════════════════════════════════════
    // MARK: - MASERATI
    // ═══════════════════════════════════════════════════════════

    Car(id: "mas_mc20", brand: "Maserati", modelFamily: "MC20", model: "MC20 Coupe", generation: "MC20", year: 2021, category: "Supersportwagen", rarityLevel: 4, hp: 630, topSpeed: 325, price: "ab 220.000 EUR", description: "630 PS V6 Nettuno, Mittelmotor - Maseratis Rueckkehr im Supercar-Segment.", emoji: "🏎️"),
    Car(id: "mas_mc20_cielo", brand: "Maserati", modelFamily: "MC20", model: "MC20 Cielo", generation: "MC20", year: 2022, category: "Supersportwagen", rarityLevel: 4, hp: 630, topSpeed: 325, price: "ab 260.000 EUR", description: "Spider-Version mit Glaspanel-Dach - offener Luxus-Supersportler.", emoji: "🏎️"),
    Car(id: "mas_granturismo_folgore", brand: "Maserati", modelFamily: "GranTurismo", model: "GranTurismo Folgore", generation: "M139 E", year: 2023, category: "Elektro Gran Turismo", rarityLevel: 4, hp: 760, topSpeed: 325, price: "ab 220.000 EUR", description: "760 PS vollelektrisch - schnellstes Elektro-GT-Coupe Europas.", emoji: "🏎️"),
    Car(id: "mas_granturismo_trofeo", brand: "Maserati", modelFamily: "GranTurismo", model: "GranTurismo Trofeo", generation: "M139", year: 2023, category: "Gran Turismo", rarityLevel: 4, hp: 550, topSpeed: 320, price: "ab 190.000 EUR", description: "550 PS V6 Nettuno - Rueckkehr des GranTurismo in neuer Generation.", emoji: "🏎️"),

    // ═══════════════════════════════════════════════════════════
    // MARK: - NISSAN
    // ═══════════════════════════════════════════════════════════

    Car(id: "nis_gtr_r35_nismo", brand: "Nissan", modelFamily: "GT-R", model: "GT-R NISMO (R35)", generation: "R35 2024", year: 2024, category: "Supersportwagen", rarityLevel: 4, hp: 600, topSpeed: 315, price: "ab 200.000 EUR", description: "600 PS Nismo-Version - letztes Modelljahr des R35, Legende.", emoji: "🏎️"),
    Car(id: "nis_gtr_r35_track", brand: "Nissan", modelFamily: "GT-R", model: "GT-R Track Edition (R35)", generation: "R35", year: 2019, category: "Supersportwagen", rarityLevel: 4, hp: 570, topSpeed: 315, price: "ab 130.000 EUR", description: "570 PS, auf Rennstrecke optimiert - Godzilla im Trackday-Anzug.", emoji: "🏎️"),
    Car(id: "nis_gtr_r34", brand: "Nissan", modelFamily: "GT-R", model: "Skyline GT-R V-Spec (R34)", generation: "R34", year: 1999, category: "Oldtimer", rarityLevel: 5, hp: 280, topSpeed: 250, price: "ab 200.000 EUR", description: "Japanische Legende - exportiert mit 280 PS (tatsaechlich mehr), kultivierter Allrad.", emoji: "🏎️"),
    Car(id: "nis_z_rz34", brand: "Nissan", modelFamily: "Z", model: "Z (RZ34)", generation: "RZ34", year: 2022, category: "Sportwagen", rarityLevel: 3, hp: 400, topSpeed: 250, price: "ab 45.000 EUR", description: "400 PS V6 Twin-Turbo - Rueckkehr einer Legende nach langer Pause.", emoji: "🏎️"),

    // ═══════════════════════════════════════════════════════════
    // MARK: - TOYOTA GR
    // ═══════════════════════════════════════════════════════════

    Car(id: "toy_gr_yaris", brand: "Toyota", modelFamily: "GR Yaris", model: "GR Yaris", generation: "GXPA16", year: 2020, category: "Hot Hatch", rarityLevel: 3, hp: 261, topSpeed: 230, price: "ab 40.000 EUR", description: "261 PS, 4WD, Homologationsmodell - Rallye-DNA fuer die Strasse.", emoji: "🏎️"),
    Car(id: "toy_gr_yaris_morizo", brand: "Toyota", modelFamily: "GR Yaris", model: "GR Yaris Morizo Edition", generation: "GXPA16 ME", year: 2022, category: "Hot Hatch", rarityLevel: 4, hp: 304, topSpeed: 230, price: "ab 60.000 EUR", description: "304 PS, auf Kursusleistung optimiert - schaerfste GR Yaris Version.", emoji: "🏎️"),
    Car(id: "toy_gr86", brand: "Toyota", modelFamily: "GR86", model: "GR86 (2. Gen)", generation: "ZN8", year: 2021, category: "Sportwagen", rarityLevel: 2, hp: 234, topSpeed: 226, price: "ab 33.000 EUR", description: "234 PS Saugmotor, Hinterradantrieb - Drifter-Favorit aller Zeit.", emoji: "🏎️"),
    Car(id: "toy_gr_supra_a90", brand: "Toyota", modelFamily: "GR Supra", model: "GR Supra A90 (3.0)", generation: "A90", year: 2019, category: "Sportwagen", rarityLevel: 3, hp: 387, topSpeed: 250, price: "ab 58.000 EUR", description: "387 PS BMW-Motor - Kultname zurueck auf der Strasse.", emoji: "🏎️"),
    Car(id: "toy_gr_supra_final", brand: "Toyota", modelFamily: "GR Supra", model: "GR Supra A90 Final Edition", generation: "A90", year: 2023, category: "Sportwagen", rarityLevel: 4, hp: 387, topSpeed: 250, price: "ab 70.000 EUR", description: "Final Edition - letztes Sondermodell des A90 Supra.", emoji: "🏎️"),

    // ═══════════════════════════════════════════════════════════
    // MARK: - FORD
    // ═══════════════════════════════════════════════════════════

    Car(id: "ford_gt_gen3", brand: "Ford", modelFamily: "Ford GT", model: "Ford GT (3. Gen)", generation: "Gen3", year: 2017, category: "Supersportwagen", rarityLevel: 5, hp: 660, topSpeed: 347, price: "ab 500.000 EUR", description: "660 PS EcoBoost V6 - Le Mans-Sieger auf der Strasse, nur 1350 Stueck.", emoji: "🏎️"),
    Car(id: "ford_mustang_dark_horse", brand: "Ford", modelFamily: "Mustang", model: "Mustang Dark Horse (S650)", generation: "S650", year: 2024, category: "Muscle Car", rarityLevel: 3, hp: 500, topSpeed: 270, price: "ab 60.000 EUR", description: "500 PS V8 Saugmotor - schaerfstes Serien-Mustang-Coupe.", emoji: "🏎️"),
    Car(id: "ford_mustang_shelby_gt500", brand: "Ford", modelFamily: "Mustang", model: "Mustang Shelby GT500 (S550)", generation: "S550", year: 2020, category: "Muscle Car", rarityLevel: 4, hp: 771, topSpeed: 290, price: "ab 100.000 EUR", description: "771 PS Supercharger V8 - staerkster Serien-Ford aller Zeiten.", emoji: "🏎️"),

    // ═══════════════════════════════════════════════════════════
    // MARK: - CHEVROLET / DODGE
    // ═══════════════════════════════════════════════════════════

    Car(id: "chevy_c8_z06", brand: "Chevrolet", modelFamily: "Corvette", model: "Corvette Z06 (C8)", generation: "C8 Z06", year: 2023, category: "Supersportwagen", rarityLevel: 5, hp: 670, topSpeed: 312, price: "ab 130.000 EUR", description: "670 PS V8 Saugmotor, GT3-Sound - spektakulaerstes Preis-Leistungs-Verhaeltnis.", emoji: "🏎️"),
    Car(id: "chevy_c8_stingray", brand: "Chevrolet", modelFamily: "Corvette", model: "Corvette Stingray (C8)", generation: "C8", year: 2020, category: "Sportwagen", rarityLevel: 4, hp: 490, topSpeed: 312, price: "ab 80.000 EUR", description: "490 PS Mittelmotor - erste Mittelmotor-Corvette seit Jahrzehnten.", emoji: "🏎️"),
    Car(id: "chevy_c8_zr1", brand: "Chevrolet", modelFamily: "Corvette", model: "Corvette ZR1 (C8)", generation: "C8 ZR1", year: 2025, category: "Supersportwagen", rarityLevel: 5, hp: 1064, topSpeed: 330, price: "ab 175.000 EUR", description: "1064 PS Biturbo V8 - staerkste Corvette aller Zeiten.", emoji: "🏎️"),
    Car(id: "dodge_challenger_demon_170", brand: "Dodge", modelFamily: "Challenger", model: "Challenger SRT Demon 170", generation: "LC", year: 2023, category: "Muscle Car", rarityLevel: 5, hp: 1025, topSpeed: 330, price: "ab 100.000 EUR", description: "1025 PS, 0-100 in 1,66 s auf E85 - schnellstes Serien-Dragster-Auto.", emoji: "🏎️"),
    Car(id: "dodge_viper_acr", brand: "Dodge", modelFamily: "Viper", model: "Viper ACR", generation: "VX", year: 2016, category: "Supersportwagen", rarityLevel: 5, hp: 645, topSpeed: 330, price: "ab 200.000 EUR", description: "645 PS V10, haelt 13 Nordschleife-Streckenrekorde - brutal und schoen.", emoji: "🏎️"),

    // ═══════════════════════════════════════════════════════════
    // MARK: - ALFA ROMEO
    // ═══════════════════════════════════════════════════════════

    Car(id: "alfa_giulia_qv", brand: "Alfa Romeo", modelFamily: "Giulia", model: "Giulia Quadrifoglio", generation: "952", year: 2016, category: "Sport Limousine", rarityLevel: 3, hp: 510, topSpeed: 307, price: "ab 90.000 EUR", description: "510 PS Ferrari-V6 - schnellste Nordschleife-Zeit fuer Vierturer.", emoji: "🏎️"),
    Car(id: "alfa_stelvio_qv", brand: "Alfa Romeo", modelFamily: "Stelvio", model: "Stelvio Quadrifoglio", generation: "949", year: 2017, category: "Sport SUV", rarityLevel: 3, hp: 510, topSpeed: 283, price: "ab 90.000 EUR", description: "510 PS V6 im SUV - schnellstes SUV auf der Nordschleife beim Erscheinen.", emoji: "🚙"),
    Car(id: "alfa_33_stradale", brand: "Alfa Romeo", modelFamily: "33 Stradale", model: "33 Stradale (2023)", generation: "2023", year: 2023, category: "Hypercar", rarityLevel: 5, hp: 620, topSpeed: 333, price: "ab 1.500.000 EUR", description: "620 PS V6 oder Elektro - nur 33 Exemplare, alle verkauft.", emoji: "🏎️"),
    Car(id: "alfa_8c_competizione", brand: "Alfa Romeo", modelFamily: "8C", model: "8C Competizione", generation: "8C", year: 2007, category: "Oldtimer", rarityLevel: 5, hp: 450, topSpeed: 292, price: "ab 400.000 EUR", description: "450 PS Ferrari-V8, nur 500 Stueck - schoeenstes Alfa Romeo des Jahrtausends.", emoji: "🏎️"),

    // ═══════════════════════════════════════════════════════════
    // MARK: - SUBARU
    // ═══════════════════════════════════════════════════════════

    Car(id: "sub_wrx_sti_va", brand: "Subaru", modelFamily: "WRX STI", model: "WRX STI (VA)", generation: "VA", year: 2014, category: "Sport Limousine", rarityLevel: 3, hp: 300, topSpeed: 255, price: "ab 40.000 EUR", description: "300 PS Boxer, Allrad - Rallye-DNA auf der Strasse.", emoji: "🏎️"),
    Car(id: "sub_brz_zd8", brand: "Subaru", modelFamily: "BRZ", model: "BRZ (ZD8)", generation: "ZD8", year: 2021, category: "Sportwagen", rarityLevel: 2, hp: 234, topSpeed: 226, price: "ab 32.000 EUR", description: "234 PS Saugmotor, Hinterradantrieb - puristischer Drifter.", emoji: "🏎️"),
    Car(id: "sub_impreza_22b", brand: "Subaru", modelFamily: "Impreza", model: "Impreza 22B STi", generation: "GC8", year: 1998, category: "Oldtimer", rarityLevel: 5, hp: 280, topSpeed: 240, price: "ab 100.000 EUR", description: "Nur 424 Stueck - Homologations-Legende der WRC-Aera.", emoji: "🏎️"),

    // ═══════════════════════════════════════════════════════════
    // MARK: - HONDA
    // ═══════════════════════════════════════════════════════════

    Car(id: "hon_civic_type_r_fl5", brand: "Honda", modelFamily: "Civic Type R", model: "Civic Type R (FL5)", generation: "FL5", year: 2023, category: "Hot Hatch", rarityLevel: 3, hp: 329, topSpeed: 275, price: "ab 48.000 EUR", description: "329 PS, schnellster FWD-Wagen auf der Nordschleife (7:44).", emoji: "🏎️"),
    Car(id: "hon_nsx_2", brand: "Honda", modelFamily: "NSX", model: "NSX Type S (2. Gen)", generation: "NC1 TS", year: 2021, category: "Supersportwagen", rarityLevel: 5, hp: 600, topSpeed: 307, price: "ab 180.000 EUR", description: "600 PS Hybrid V6, finale Type-S-Version - Abschluss einer Aera.", emoji: "🏎️"),
    Car(id: "hon_s2000", brand: "Honda", modelFamily: "S2000", model: "S2000 AP2", generation: "AP2", year: 2003, category: "Roadster", rarityLevel: 3, hp: 237, topSpeed: 240, price: "ab 25.000 EUR", description: "237 PS bei 8.000 U/min - hoehere spezifische Leistung als Ferraris V8 seiner Zeit.", emoji: "🏎️"),

    // ═══════════════════════════════════════════════════════════
    // MARK: - MAZDA
    // ═══════════════════════════════════════════════════════════

    Car(id: "maz_rx7_fd", brand: "Mazda", modelFamily: "RX-7", model: "RX-7 FD", generation: "FD3S", year: 1992, category: "Oldtimer", rarityLevel: 4, hp: 255, topSpeed: 255, price: "ab 40.000 EUR", description: "Wankelmotor-Legende - bis 2002 gebaut, heute weltweit selten.", emoji: "🏎️"),
    Car(id: "maz_mx5_nd", brand: "Mazda", modelFamily: "MX-5", model: "MX-5 RF (ND)", generation: "ND", year: 2016, category: "Roadster", rarityLevel: 2, hp: 184, topSpeed: 219, price: "ab 30.000 EUR", description: "Meistgebauter Roadster der Welt - pure Fahrfreude, jetzt als FastBack.", emoji: "🏎️"),

    // ═══════════════════════════════════════════════════════════
    // MARK: - MITSUBISHI / LANCIA
    // ═══════════════════════════════════════════════════════════

    Car(id: "mit_evo_x", brand: "Mitsubishi", modelFamily: "Lancer Evo", model: "Lancer Evolution X Final Edition", generation: "X", year: 2015, category: "Sport Limousine", rarityLevel: 4, hp: 303, topSpeed: 263, price: "ab 30.000 EUR", description: "Finale Edition des letzten Evo - 2016 eingestellt, wird rarer.", emoji: "🏎️"),
    Car(id: "lan_delta_integrale", brand: "Lancia", modelFamily: "Delta", model: "Delta HF Integrale Evoluzione II", generation: "Evoluzione II", year: 1993, category: "Oldtimer", rarityLevel: 4, hp: 215, topSpeed: 220, price: "ab 60.000 EUR", description: "6x Rallye-Weltmeister - Integrale Evo II, Kult-Klassiker.", emoji: "🏎️"),
    Car(id: "lan_stratos", brand: "Lancia", modelFamily: "Stratos", model: "Stratos HF", generation: "Stratos", year: 1973, category: "Oldtimer", rarityLevel: 5, hp: 190, topSpeed: 220, price: "ab 500.000 EUR", description: "3x WRC-Champion, Bertone-Design - das wildeste Rallye-Strassenauto je.", emoji: "🏎️"),

    // ═══════════════════════════════════════════════════════════
    // MARK: - BENTLEY / ROLLS-ROYCE
    // ═══════════════════════════════════════════════════════════

    Car(id: "bent_cont_gt_speed", brand: "Bentley", modelFamily: "Continental GT", model: "Continental GT Speed", generation: "W12 III", year: 2021, category: "Gran Turismo", rarityLevel: 4, hp: 659, topSpeed: 335, price: "ab 280.000 EUR", description: "659 PS W12 - 335 km/h, Luxus und Leistung in Perfektion.", emoji: "🏎️"),
    Car(id: "bent_bacalar", brand: "Bentley", modelFamily: "Sondermodelle", model: "Bacalar", generation: "Bacalar", year: 2021, category: "Hypercar", rarityLevel: 5, hp: 730, topSpeed: 320, price: "ab 1.900.000 EUR", description: "730 PS Barchetta, nur 12 Stueck - exklusivster Bentley ueberhaupt.", emoji: "🏎️"),
    Car(id: "rr_spectre", brand: "Rolls-Royce", modelFamily: "Spectre", model: "Spectre", generation: "Spectre", year: 2023, category: "Elektro Luxus", rarityLevel: 5, hp: 585, topSpeed: 250, price: "ab 430.000 EUR", description: "585 PS Elektro-Coupe - Rolls-Royces erstes E-Auto.", emoji: "🏎️"),
    Car(id: "rr_ghost", brand: "Rolls-Royce", modelFamily: "Ghost", model: "Ghost Black Badge", generation: "RR12 BB", year: 2022, category: "Luxuslimousine", rarityLevel: 5, hp: 600, topSpeed: 250, price: "ab 450.000 EUR", description: "600 PS V12 Black Badge - dunkelste und sportlichste Ghost-Version.", emoji: "🚗"),

    // ═══════════════════════════════════════════════════════════
    // MARK: - TESLA
    // ═══════════════════════════════════════════════════════════

    Car(id: "tes_model_s_plaid", brand: "Tesla", modelFamily: "Model S", model: "Model S Plaid", generation: "Plaid", year: 2021, category: "Elektro Sportwagen", rarityLevel: 3, hp: 1020, topSpeed: 322, price: "ab 110.000 EUR", description: "1020 PS, 0-100 in 2,1 s - schnellste Serienproduktionslimousine.", emoji: "🏎️"),
    Car(id: "tes_roadster_2", brand: "Tesla", modelFamily: "Roadster", model: "Roadster (2. Gen)", generation: "2025", year: 2025, category: "Elektro Hypercar", rarityLevel: 5, hp: 1300, topSpeed: 400, price: "ab 200.000 EUR", description: "1300 PS+ Elektro-Roadster - 0-100 unter 1,9 s angekuendigt.", emoji: "🏎️"),
    Car(id: "tes_cybertruck", brand: "Tesla", modelFamily: "Cybertruck", model: "Cybertruck", generation: "CT", year: 2023, category: "Elektro Pickup", rarityLevel: 4, hp: 845, topSpeed: 209, price: "ab 100.000 EUR", description: "Stainless-Steel Pickup - in Europa extrem selten und ikonisch.", emoji: "🚙"),

    // ═══════════════════════════════════════════════════════════
    // MARK: - HYUNDAI N / KIA
    // ═══════════════════════════════════════════════════════════

    Car(id: "hyu_ioniq5_n", brand: "Hyundai", modelFamily: "IONIQ 5 N", model: "IONIQ 5 N", generation: "NE", year: 2023, category: "Elektro Sportwagen", rarityLevel: 3, hp: 650, topSpeed: 260, price: "ab 70.000 EUR", description: "650 PS Elektro mit simulierten Gangwechseln - irrsinnig guter Hot Hatch.", emoji: "🏎️"),
    Car(id: "hyu_i30n_pd", brand: "Hyundai", modelFamily: "i30 N", model: "i30 N Performance", generation: "PD", year: 2017, category: "Hot Hatch", rarityLevel: 2, hp: 280, topSpeed: 250, price: "ab 35.000 EUR", description: "280 PS, bestes Preis-Leistungs-Verhaeltnis im Hot-Hatch-Segment.", emoji: "🏎️"),
    Car(id: "kia_ev6_gt", brand: "Kia", modelFamily: "EV6 GT", model: "EV6 GT", generation: "CV", year: 2022, category: "Elektro Sportwagen", rarityLevel: 3, hp: 585, topSpeed: 260, price: "ab 65.000 EUR", description: "585 PS, 0-100 in 3,5 s - Kias schnellstes Serienfahrzeug.", emoji: "🏎️"),
    Car(id: "kia_stinger_gt", brand: "Kia", modelFamily: "Stinger", model: "Stinger GT", generation: "CK", year: 2017, category: "Sport Limousine", rarityLevel: 3, hp: 369, topSpeed: 270, price: "ab 35.000 EUR", description: "369 PS V6 Biturbo - 2023 eingestellt, wird seltener.", emoji: "🏎️"),

    // ═══════════════════════════════════════════════════════════
    // MARK: - VW
    // ═══════════════════════════════════════════════════════════

    Car(id: "vw_golf_r_mk8", brand: "VW", modelFamily: "Golf R", model: "Golf R (Mk8)", generation: "Mk8", year: 2021, category: "Hot Hatch", rarityLevel: 3, hp: 333, topSpeed: 270, price: "ab 52.000 EUR", description: "333 PS Allrad-Sportler im Golf-Kleid.", emoji: "🏎️"),
    Car(id: "vw_golf_gti_mk8", brand: "VW", modelFamily: "Golf GTI", model: "Golf GTI (Mk8)", generation: "Mk8", year: 2020, category: "Hot Hatch", rarityLevel: 2, hp: 245, topSpeed: 250, price: "ab 42.000 EUR", description: "Der Urvater aller Hot Hatches - nun in der 8. Generation.", emoji: "🚗"),
    Car(id: "vw_golf_gti_mk1", brand: "VW", modelFamily: "Golf GTI", model: "Golf GTI (Mk1)", generation: "Mk1", year: 1976, category: "Oldtimer", rarityLevel: 4, hp: 110, topSpeed: 182, price: "ab 20.000 EUR", description: "Der Begruender der Hot-Hatch-Klasse.", emoji: "🚗"),

    // ═══════════════════════════════════════════════════════════
    // MARK: - RENAULT / PEUGEOT
    // ═══════════════════════════════════════════════════════════

    Car(id: "ren_megane_rs_trophy", brand: "Renault", modelFamily: "Megane RS", model: "Megane RS Trophy-R", generation: "Mk4", year: 2019, category: "Hot Hatch", rarityLevel: 3, hp: 300, topSpeed: 257, price: "ab 45.000 EUR", description: "300 PS, Nordschleife-Rekord FWD - extremer Kompaktsportler.", emoji: "🏎️"),
    Car(id: "peug_208_rally4", brand: "Peugeot", modelFamily: "208 Rally", model: "208 Rally4", generation: "208", year: 2020, category: "Rennwagen", rarityLevel: 3, hp: 208, topSpeed: 220, price: "ab 60.000 EUR", description: "Offizieller Einstiegs-Rallyewagen - Peugeot Sport.", emoji: "🏎️"),

    // ═══════════════════════════════════════════════════════════
    // MARK: - JAGUAR / LAND ROVER
    // ═══════════════════════════════════════════════════════════

    Car(id: "jag_f_type_r", brand: "Jaguar", modelFamily: "F-Type", model: "F-Type R (2020)", generation: "X152 FL", year: 2020, category: "Sportwagen", rarityLevel: 3, hp: 575, topSpeed: 300, price: "ab 120.000 EUR", description: "575 PS V8 Kompressor - britischer Sportwagen mit unvergleichlichem Sound.", emoji: "🏎️"),
    Car(id: "lr_defender_v8", brand: "Land Rover", modelFamily: "Defender", model: "Defender 90 V8 (2021)", generation: "L663 V8", year: 2021, category: "Gelände SUV", rarityLevel: 3, hp: 525, topSpeed: 240, price: "ab 140.000 EUR", description: "525 PS V8 im Offroad-Klassiker - Ikone mit Muscle-Power.", emoji: "🚙"),

    // ═══════════════════════════════════════════════════════════
    // MARK: - DE TOMASO / GORDON MURRAY / SSC / HENNESSEY / CZINGER
    // ═══════════════════════════════════════════════════════════

    Car(id: "det_pantera", brand: "De Tomaso", modelFamily: "Pantera", model: "Pantera (1971)", generation: "Pantera", year: 1971, category: "Oldtimer", rarityLevel: 5, hp: 330, topSpeed: 260, price: "ab 100.000 EUR", description: "Ford V8, Mittelmotor - die erschwingliche Supercar-Alternative der 70er.", emoji: "🏎️"),
    Car(id: "det_p72", brand: "De Tomaso", modelFamily: "P72", model: "P72", generation: "P72", year: 2024, category: "Hypercar", rarityLevel: 5, hp: 700, topSpeed: 320, price: "ab 750.000 EUR", description: "700 PS Ford V8, nur 72 Stueck - Rueckkehr einer Legende.", emoji: "🏎️"),
    Car(id: "gma_t50", brand: "Gordon Murray", modelFamily: "T.50", model: "T.50", generation: "T.50", year: 2022, category: "Hypercar", rarityLevel: 5, hp: 654, topSpeed: 370, price: "ab 3.100.000 EUR", description: "654 PS V12 Sauger, 12.100 U/min, nur 100 Stueck - geistiger McLaren F1-Nachfolger.", emoji: "🏎️"),
    Car(id: "gma_t50s", brand: "Gordon Murray", modelFamily: "T.50", model: "T.50s Niki Lauda", generation: "T.50s", year: 2023, category: "Hypercar", rarityLevel: 5, hp: 725, topSpeed: 360, price: "ab 3.500.000 EUR", description: "Rennwagen-Version des T.50 - gewidmet Niki Lauda, nur 25 Stueck.", emoji: "🏎️"),
    Car(id: "ssc_tuatara", brand: "SSC", modelFamily: "Tuatara", model: "Tuatara", generation: "Tuatara", year: 2020, category: "Hypercar", rarityLevel: 5, hp: 1750, topSpeed: 455, price: "ab 1.600.000 EUR", description: "1750 PS V8 Biturbo - Anwaerter auf den Topspeed-Weltrekord.", emoji: "🏎️"),
    Car(id: "hen_venom_gt", brand: "Hennessey", modelFamily: "Venom", model: "Venom GT", generation: "Venom GT", year: 2011, category: "Hypercar", rarityLevel: 5, hp: 1244, topSpeed: 435, price: "ab 1.200.000 EUR", description: "1244 PS, 435 km/h - Lotus-basierter Hypercar-Wahnsinn.", emoji: "🏎️"),
    Car(id: "hen_venom_f5", brand: "Hennessey", modelFamily: "Venom", model: "Venom F5", generation: "Venom F5", year: 2021, category: "Hypercar", rarityLevel: 5, hp: 1817, topSpeed: 484, price: "ab 2.100.000 EUR", description: "1817 PS, 484 km/h angestrebt - eigene Plattform, extremster US-Hypercar.", emoji: "🏎️"),
    Car(id: "czing_21c", brand: "Czinger", modelFamily: "21C", model: "21C", generation: "21C", year: 2022, category: "Hypercar", rarityLevel: 5, hp: 1350, topSpeed: 440, price: "ab 2.000.000 EUR", description: "1350 PS, 3D-gedruckte Teile, Tandem-Sitze - Zukunft des Hypercar-Baus.", emoji: "🏎️"),

]

// MARK: - Helper
var allBrands: [String] {
    Array(Set(allCars.map { $0.brand })).sorted()
}

var allCategories: [String] {
    Array(Set(allCars.map { $0.category })).sorted()
}

var allModelFamilies: [String: [String]] {
    var result: [String: Set<String>] = [:]
    for car in allCars {
        result[car.brand, default: []].insert(car.modelFamily)
    }
    return result.mapValues { Array($0).sorted() }
}
