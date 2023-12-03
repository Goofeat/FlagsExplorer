//
//  AppRepository.swift
//  FlagsExplorer
//
//  Created by Raiymbek Azharbayev on 17.11.2023.
//

import Foundation
import UIKit

struct AppRepository {
    
    static let shared = AppRepository()
    
    static func save(gameMode: GameMode) {
        do {
            let encodedData = try JSONEncoder().encode(gameMode)
            UserDefaults.standard.set(encodedData, forKey: "GAME_MODE_\(gameMode.ID)")
        } catch {
            print("Error encoding GameMode: \(error)")
        }
    }
    
    static func load(ID: Int) -> GameMode {
        if let data = UserDefaults.standard.data(forKey: "GAME_MODE_\(ID)"),
           let decodedGameMode = try? JSONDecoder().decode(GameMode.self, from: data) {
            decodedGameMode
        } else {
            GameMode.defaultForID(ID)
        }
    }
    
    var gameModes: [[GameMode]] {
        let defaultGameModes: [[GameMode]] = [
            [AppRepository.load(ID: 0), AppRepository.load(ID: 1)],
            [AppRepository.load(ID: 2), AppRepository.load(ID: 3)],
            [AppRepository.load(ID: 4), AppRepository.load(ID: 5)]
        ]
        
        for row in defaultGameModes {
            for cell in row {
                AppRepository.save(gameMode: cell)
            }
        }
        
        return defaultGameModes
    }
    
    private init() {}
    
    let countries: [Country] = [
        Country(level: .Easy, code: "AL", name: "Albania", capital: "Tirana"),
        Country(level: .Easy, code: "DZ", name: "Algeria", capital: "Algiers"),
        Country(level: .Easy, code: "AO", name: "Angola", capital: "Luanda"),
        Country(level: .Easy, code: "AR", name: "Argentina", capital: "Buenos Aires"),
        Country(level: .Easy, code: "AU", name: "Australia", capital: "Canberra"),
        Country(level: .Easy, code: "AT", name: "Austria", capital: "Vienna"),
        Country(level: .Easy, code: "BD", name: "Bangladesh", capital: "Dhaka"),
        Country(level: .Easy, code: "BY", name: "Belarus", capital: "Minsk"),
        Country(level: .Easy, code: "BE", name: "Belgium", capital: "Brussels"),
        Country(level: .Easy, code: "BT", name: "Bhutan", capital: "Thimphu"),
        Country(level: .Easy, code: "BR", name: "Brazil", capital: "Brasilia"),
        Country(level: .Easy, code: "BG", name: "Bulgaria", capital: "Sofia"),
        Country(level: .Easy, code: "CM", name: "Cameroon", capital: "Yaoundé"),
        Country(level: .Easy, code: "CA", name: "Canada", capital: "Ottawa"),
        Country(level: .Easy, code: "CL", name: "Chile", capital: "Santiago"),
        Country(level: .Easy, code: "CN", name: "China", capital: "Beijing"),
        Country(level: .Easy, code: "CO", name: "Colombia", capital: "Bogotá"),
        Country(level: .Easy, code: "CR", name: "Costa Rica", capital: "San José"),
        Country(level: .Easy, code: "HR", name: "Croatia", capital: "Zagreb"),
        Country(level: .Easy, code: "CU", name: "Cuba", capital: "Havana"),
        Country(level: .Easy, code: "CY", name: "Cyprus", capital: "Nicosia"),
        Country(level: .Easy, code: "CZ", name: "Czechia", capital: "Prague"),
        Country(level: .Easy, code: "DK", name: "Denmark", capital: "Copenhagen"),
        Country(level: .Easy, code: "EC", name: "Ecuador", capital: "Quito"),
        Country(level: .Easy, code: "EG", name: "Egypt", capital: "Cairo"),
        Country(level: .Easy, code: "EE", name: "Estonia", capital: "Tallinn"),
        Country(level: .Easy, code: "ET", name: "Ethiopia", capital: "Addis Ababa"),
        Country(level: .Easy, code: "FI", name: "Finland", capital: "Helsinki"),
        Country(level: .Easy, code: "FR", name: "France", capital: "Paris"),
        Country(level: .Easy, code: "DE", name: "Germany", capital: "Berlin"),
        Country(level: .Easy, code: "GH", name: "Ghana", capital: "Accra"),
        Country(level: .Easy, code: "GR", name: "Greece", capital: "Athens"),
        Country(level: .Easy, code: "GN", name: "Guinea", capital: "Conakry"),
        Country(level: .Easy, code: "HU", name: "Hungary", capital: "Budapest"),
        Country(level: .Easy, code: "IS", name: "Iceland", capital: "Reykjavik"),
        Country(level: .Easy, code: "IN", name: "India", capital: "New Delhi"),
        Country(level: .Easy, code: "ID", name: "Indonesia", capital: "Jakarta"),
        Country(level: .Easy, code: "IR", name: "Iran", capital: "Tehran"),
        Country(level: .Easy, code: "IQ", name: "Iraq", capital: "Baghdad"),
        Country(level: .Easy, code: "IE", name: "Ireland", capital: "Dublin"),
        Country(level: .Easy, code: "IL", name: "Israel", capital: "Jerusalem"),
        Country(level: .Easy, code: "IT", name: "Italy", capital: "Rome"),
        Country(level: .Easy, code: "JM", name: "Jamaica", capital: "Kingston"),
        Country(level: .Easy, code: "KZ", name: "Kazakhstan", capital: "Astana"),
        Country(level: .Easy, code: "KE", name: "Kenya", capital: "Nairobi"),
        Country(level: .Easy, code: "LA", name: "Laos", capital: "Vientiane"),
        Country(level: .Easy, code: "LV", name: "Latvia", capital: "Riga"),
        Country(level: .Easy, code: "LB", name: "Lebanon", capital: "Beirut"),
        Country(level: .Easy, code: "LY", name: "Libya", capital: "Tripoli"),
        Country(level: .Easy, code: "LT", name: "Lithuania", capital: "Vilnius"),
        Country(level: .Easy, code: "MG", name: "Madagascar", capital: "Antananarivo"),
        Country(level: .Easy, code: "MY", name: "Malaysia", capital: "Kuala Lumpur"),
        Country(level: .Easy, code: "MT", name: "Malta", capital: "Valletta"),
        Country(level: .Easy, code: "MX", name: "Mexico", capital: "Mexico City"),
        Country(level: .Easy, code: "MN", name: "Mongolia", capital: "Ulaanbaatar"),
        Country(level: .Easy, code: "MA", name: "Morocco", capital: "Rabat"),
        Country(level: .Easy, code: "MZ", name: "Mozambique", capital: "Maputo"),
        Country(level: .Easy, code: "NP", name: "Nepal", capital: "Kathmandu"),
        Country(level: .Easy, code: "NL", name: "Netherlands", capital: "Amsterdam"),
        Country(level: .Easy, code: "NZ", name: "New Zealand", capital: "Wellington"),
        Country(level: .Easy, code: "NG", name: "Nigeria", capital: "Abuja"),
        Country(level: .Easy, code: "KP", name: "North Korea", capital: "Pyongyang"),
        Country(level: .Easy, code: "NO", name: "Norway", capital: "Oslo"),
        Country(level: .Easy, code: "PK", name: "Pakistan", capital: "Islamabad"),
        Country(level: .Easy, code: "PA", name: "Panama", capital: "Panama City"),
        Country(level: .Easy, code: "PG", name: "Papua New Guinea", capital: "Port Moresby"),
        Country(level: .Easy, code: "PE", name: "Peru", capital: "Lima"),
        Country(level: .Easy, code: "PH", name: "Philippines", capital: "Manila"),
        Country(level: .Easy, code: "PL", name: "Poland", capital: "Warsaw"),
        Country(level: .Easy, code: "PT", name: "Portugal", capital: "Lisbon"),
        Country(level: .Easy, code: "QA", name: "Qatar", capital: "Doha"),
        Country(level: .Easy, code: "RO", name: "Romania", capital: "Bucharest"),
        Country(level: .Easy, code: "RU", name: "Russia", capital: "Moscow"),
        Country(level: .Easy, code: "SA", name: "Saudi Arabia", capital: "Riyadh"),
        Country(level: .Easy, code: "SN", name: "Senegal", capital: "Dakar"),
        Country(level: .Easy, code: "RS", name: "Serbia", capital: "Belgrade"),
        Country(level: .Easy, code: "SG", name: "Singapore", capital: "Singapore"),
        Country(level: .Easy, code: "SK", name: "Slovakia", capital: "Bratislava"),
        Country(level: .Easy, code: "SI", name: "Slovenia", capital: "Ljubljana"),
        Country(level: .Easy, code: "ZA", name: "South Africa", capital: "Pretoria"),
        Country(level: .Easy, code: "KR", name: "South Korea", capital: "Seoul"),
        Country(level: .Easy, code: "ES", name: "Spain", capital: "Madrid"),
        Country(level: .Easy, code: "LK", name: "Sri Lanka", capital: "Sri Jayawardenepura Kotte"),
        Country(level: .Easy, code: "SE", name: "Sweden", capital: "Stockholm"),
        Country(level: .Easy, code: "CH", name: "Switzerland", capital: "Bern"),
        Country(level: .Easy, code: "SY", name: "Syria", capital: "Damascus"),
        Country(level: .Easy, code: "TW", name: "Taiwan", capital: "Taipei"),
        Country(level: .Easy, code: "TH", name: "Thailand", capital: "Bangkok"),
        Country(level: .Easy, code: "TN", name: "Tunisia", capital: "Tunis"),
        Country(level: .Easy, code: "TR", name: "Turkey", capital: "Ankara"),
        Country(level: .Easy, code: "UA", name: "Ukraine", capital: "Kyiv"),
        Country(level: .Easy, code: "AE", name: "United Arab Emirates", capital: "Abu Dhabi"),
        Country(level: .Easy, code: "GB", name: "United Kingdom", capital: "London"),
        Country(level: .Easy, code: "US", name: "United States", capital: "Washington, D.C."),
        Country(level: .Easy, code: "UY", name: "Uruguay", capital: "Montevideo"),
        Country(level: .Easy, code: "VA", name: "Vatican City", capital: "Vatican City"),
        Country(level: .Easy, code: "VE", name: "Venezuela", capital: "Caracas"),
        Country(level: .Easy, code: "VN", name: "Vietnam", capital: "Hanoi"),
        Country(level: .Hard, code: "AF", name: "Afghanistan", capital: "Kabul"),
        Country(level: .Hard, code: "AD", name: "Andorra", capital: "Andorra la Vella"),
        Country(level: .Hard, code: "AG", name: "Antigua and Barbuda", capital: "St. John's"),
        Country(level: .Hard, code: "AM", name: "Armenia", capital: "Yerevan"),
        Country(level: .Hard, code: "AZ", name: "Azerbaijan", capital: "Baku"),
        Country(level: .Hard, code: "BS", name: "The Bahamas", capital: "Nassau"),
        Country(level: .Hard, code: "BH", name: "Bahrain", capital: "Manama"),
        Country(level: .Hard, code: "BB", name: "Barbados", capital: "Bridgetown"),
        Country(level: .Hard, code: "BZ", name: "Belize", capital: "Belmopan"),
        Country(level: .Hard, code: "BJ", name: "Benin", capital: "Porto-Novo"),
        Country(level: .Hard, code: "BO", name: "Bolivia", capital: "Sucre"),
        Country(level: .Hard, code: "BA", name: "Bosnia and Herzegovina", capital: "Sarajevo"),
        Country(level: .Hard, code: "BW", name: "Botswana", capital: "Gaborone"),
        Country(level: .Hard, code: "BN", name: "Brunei", capital: "Bandar Seri Begawan"),
        Country(level: .Hard, code: "BF", name: "Burkina Faso", capital: "Ouagadougou"),
        Country(level: .Hard, code: "BI", name: "Burundi", capital: "Bujumbura"),
        Country(level: .Hard, code: "CV", name: "Cabo Verde", capital: "Praia"),
        Country(level: .Hard, code: "KH", name: "Cambodia", capital: "Phnom Penh"),
        Country(level: .Hard, code: "CF", name: "Central African Republic", capital: "Bangui"),
        Country(level: .Hard, code: "TD", name: "Chad", capital: "N'Djamena"),
        Country(level: .Hard, code: "KM", name: "Comoros", capital: "Moroni"),
        Country(level: .Hard, code: "CI", name: "Côte d'Ivoire", capital: "Yamoussoukro"),
        Country(level: .Hard, code: "CD", name: "Democratic Republic of the Congo", capital: "Kinshasa"),
        Country(level: .Hard, code: "DJ", name: "Djibouti", capital: "Djibouti"),
        Country(level: .Hard, code: "DM", name: "Dominica", capital: "Roseau"),
        Country(level: .Hard, code: "DO", name: "Dominican Republic", capital: "Santo Domingo"),
        Country(level: .Hard, code: "SV", name: "El Salvador", capital: "San Salvador"),
        Country(level: .Hard, code: "GQ", name: "Equatorial Guinea", capital: "Malabo"),
        Country(level: .Hard, code: "ER", name: "Eritrea", capital: "Asmara"),
        Country(level: .Hard, code: "SZ", name: "Eswatini", capital: "Mbabane"),
        Country(level: .Hard, code: "FM", name: "Federated States of Micronesia", capital: "Palikir"),
        Country(level: .Hard, code: "FJ", name: "Fiji", capital: "Suva"),
        Country(level: .Hard, code: "GA", name: "Gabon", capital: "Libreville"),
        Country(level: .Hard, code: "GM", name: "The Gambia", capital: "Banjul"),
        Country(level: .Hard, code: "GE", name: "Georgia", capital: "Tbilisi"),
        Country(level: .Hard, code: "GD", name: "Grenada", capital: "St. George's"),
        Country(level: .Hard, code: "GT", name: "Guatemala", capital: "Guatemala City"),
        Country(level: .Hard, code: "GW", name: "Guinea-Bissau", capital: "Bissau"),
        Country(level: .Hard, code: "GY", name: "Guyana", capital: "Georgetown"),
        Country(level: .Hard, code: "HT", name: "Haiti", capital: "Port-au-Prince"),
        Country(level: .Hard, code: "HN", name: "Honduras", capital: "Tegucigalpa"),
        Country(level: .Hard, code: "KI", name: "Kiribati", capital: "South Tarawa"),
        Country(level: .Hard, code: "XK", name: "Kosovo", capital: "Pristina"),
        Country(level: .Hard, code: "KW", name: "Kuwait", capital: "Kuwait City"),
        Country(level: .Hard, code: "KG", name: "Kyrgyzstan", capital: "Bishkek"),
        Country(level: .Hard, code: "LS", name: "Lesotho", capital: "Maseru"),
        Country(level: .Hard, code: "LR", name: "Liberia", capital: "Monrovia"),
        Country(level: .Hard, code: "LI", name: "Liechtenstein", capital: "Vaduz"),
        Country(level: .Hard, code: "LU", name: "Luxembourg", capital: "Luxembourg City"),
        Country(level: .Hard, code: "MW", name: "Malawi", capital: "Lilongwe"),
        Country(level: .Hard, code: "MV", name: "Maldives", capital: "Malé"),
        Country(level: .Hard, code: "ML", name: "Mali", capital: "Bamako"),
        Country(level: .Hard, code: "MH", name: "Marshall Islands", capital: "Majuro"),
        Country(level: .Hard, code: "MR", name: "Mauritania", capital: "Nouakchott"),
        Country(level: .Hard, code: "MU", name: "Mauritius", capital: "Port Louis"),
        Country(level: .Hard, code: "MD", name: "Moldova", capital: "Chisinau"),
        Country(level: .Hard, code: "MC", name: "Monaco", capital: "Monaco"),
        Country(level: .Hard, code: "ME", name: "Montenegro", capital: "Podgorica"),
        Country(level: .Hard, code: "MM", name: "Myanmar (Burma)", capital: "Naypyidaw"),
        Country(level: .Hard, code: "NA", name: "Namibia", capital: "Windhoek"),
        Country(level: .Hard, code: "NR", name: "Nauru", capital: "Yaren"),
        Country(level: .Hard, code: "NI", name: "Nicaragua", capital: "Managua"),
        Country(level: .Hard, code: "NE", name: "Niger", capital: "Niamey"),
        Country(level: .Hard, code: "MK", name: "North Macedonia", capital: "Skopje"),
        Country(level: .Hard, code: "OM", name: "Oman", capital: "Muscat"),
        Country(level: .Hard, code: "PW", name: "Palau", capital: "Ngerulmud"),
        Country(level: .Hard, code: "PY", name: "Paraguay", capital: "Asunción"),
        Country(level: .Hard, code: "CG", name: "Republic of the Congo", capital: "Brazzaville"),
        Country(level: .Hard, code: "RW", name: "Rwanda", capital: "Kigali"),
        Country(level: .Hard, code: "KN", name: "Saint Kitts and Nevis", capital: "Basseterre"),
        Country(level: .Hard, code: "LC", name: "Saint Lucia", capital: "Castries"),
        Country(level: .Hard, code: "VC", name: "Saint Vincent and the Grenadines", capital: "Kingstown"),
        Country(level: .Hard, code: "WS", name: "Samoa", capital: "Apia"),
        Country(level: .Hard, code: "SM", name: "San Marino", capital: "San Marino"),
        Country(level: .Hard, code: "ST", name: "São Tomé and Príncipe", capital: "São Tomé"),
        Country(level: .Hard, code: "SC", name: "Seychelles", capital: "Victoria"),
        Country(level: .Hard, code: "SL", name: "Sierra Leone", capital: "Freetown"),
        Country(level: .Hard, code: "SB", name: "Solomon Islands", capital: "Honiara"),
        Country(level: .Hard, code: "SO", name: "Somalia", capital: "Mogadishu"),
        Country(level: .Hard, code: "SS", name: "South Sudan", capital: "Juba"),
        Country(level: .Hard, code: "PS", name: "State of Palestine", capital: "Ramallah"),
        Country(level: .Hard, code: "SD", name: "Sudan", capital: "Khartoum"),
        Country(level: .Hard, code: "SR", name: "Suriname", capital: "Paramaribo"),
        Country(level: .Hard, code: "TJ", name: "Tajikistan", capital: "Dushanbe"),
        Country(level: .Hard, code: "TZ", name: "Tanzania", capital: "Dodoma"),
        Country(level: .Hard, code: "TL", name: "Timor-Leste", capital: "Dili"),
        Country(level: .Hard, code: "TG", name: "Togo", capital: "Lomé"),
        Country(level: .Hard, code: "TO", name: "Tonga", capital: "Nuku'alofa"),
        Country(level: .Hard, code: "TT", name: "Trinidad and Tobago", capital: "Port of Spain"),
        Country(level: .Hard, code: "TM", name: "Turkmenistan", capital: "Ashgabat"),
        Country(level: .Hard, code: "TV", name: "Tuvalu", capital: "Funafuti"),
        Country(level: .Hard, code: "UG", name: "Uganda", capital: "Kampala"),
        Country(level: .Hard, code: "UZ", name: "Uzbekistan", capital: "Tashkent"),
        Country(level: .Hard, code: "VU", name: "Vanuatu", capital: "Port Vila"),
        Country(level: .Hard, code: "YE", name: "Yemen", capital: "Sana'a"),
        Country(level: .Hard, code: "ZM", name: "Zambia", capital: "Lusaka"),
        Country(level: .Hard, code: "ZW", name: "Zimbabwe", capital: "Harare")
    ]
}
