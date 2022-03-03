//
//  Eurosa_AnalyticaApp.swift
//  Eurosa Analytica
//
//  Created by Rasmus Tauts on 04.02.2022.
//

import SwiftUI

@main
struct Eurosa_AnalyticaApp: App {
    
    let marketManager = MarketManager()
    
    init() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = UIColor.clear
        UITableView.appearance().backgroundColor = UIColor.clear
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(marketManager)
        }
    }
}
