//
//  MarketDataService.swift
//  SwiftfulCryptoG
//
//  Created by Dhiman Das on 28.09.24.
//

import Foundation
import Combine

class MarketDataService {
    
    @Published var marketdata: MarketDataModel? = nil

    var marketDastaSubscription : AnyCancellable?
    
    init () {
        getdata()
    }
    
     func getdata() {
        
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global") else { return }

        marketDastaSubscription =  NetworkingManager.download(url: url)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedGlobalData) in
                self?.marketdata = returnedGlobalData.data  
                self?.marketDastaSubscription?.cancel()
            })
        
    }
}
