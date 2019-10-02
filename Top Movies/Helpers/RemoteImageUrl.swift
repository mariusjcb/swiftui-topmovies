//
//  RemoteImageUrl.swift
//  Top Movies
//
//  Created by Marius Ilie on 01/10/2019.
//  Copyright © 2019 Marius Ilie. All rights reserved.
//

import Foundation
import Combine

class RemoteImageUrl: ObservableObject {
    @Published var data = Data()
    
    private var subscription: AnyCancellable? = nil
    
    init(imageUrl: URL?, modifier: ImageRequestModifier?) {
        guard let imageUrl = imageUrl else { return }
        
        if let modifier = modifier {
            let request = URLRequest(url: imageUrl)
            guard let url = modifier.modified(for: request)?.url else { return }
            download(imageUrl: url)
        } else {
            download(imageUrl: imageUrl)
        }
    }
    
    func download(imageUrl: URL) {
        subscription = URLSession.shared
            .dataTaskPublisher(for: imageUrl)
            .map { $0.data }
            .replaceError(with: nil)
            .eraseToAnyPublisher()
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] in self?.data = $0 ?? Data() })
    }
}
