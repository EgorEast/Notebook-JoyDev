//
//  EventsViewModel.swift
//  Notebook-JoyDev
//
//  Created by Egor Slobodskoy on 12.01.2022.
//

import Foundation

protocol EventsViewModel {
    var data: [String] { get set }
}

class EventsViewModelImpl: EventsViewModel {
    
    var data = ["Jeremy", "Maria Lul", "Jony Stark"]
    
    init() {
        
    }
}
