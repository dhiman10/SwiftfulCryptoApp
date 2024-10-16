//
//  CoinImageViewModel.swift
//  SwiftfulCryptoG
//
//  Created by Dhiman Das on 14.09.24.
//

import Foundation
import Combine
import SwiftUI

class CoinImageViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private let coin: CoinModel
    private let dataService :  CoinImageService
    private var cancellables = Set <AnyCancellable> ()
    
    
    init(coin: CoinModel) {
        self.coin = coin
        self.dataService = CoinImageService(coin: coin)
        self.addSubsctibers()
        self.isLoading = true
    
    }
    
    private func addSubsctibers() {
        
        dataService.$image
            .sink { [weak self] _ in
                self?.isLoading = false
            } receiveValue: { [weak self] (returnImage) in
                self?.image = returnImage
            }
            .store(in: &cancellables)

        
    }
    
    
}
