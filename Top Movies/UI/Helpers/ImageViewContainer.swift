//
//  ImageViewContainer.swift
//  Top Movies
//
//  Created by Marius Ilie on 01/10/2019.
//  Copyright © 2019 Marius Ilie. All rights reserved.
//

import SwiftUI

struct ImageViewContainer: View {
    @ObservedObject var remoteImageUrl: RemoteImageUrl
    @State private var rotation = 0.0
    
    init(imageUrl: URL?, useModifier: Bool = true) {
        remoteImageUrl = RemoteImageUrl(imageUrl: imageUrl, modifier: useModifier ? TMDBImageRequestModifier() : nil)
    }
    
    var body: some View {
        Group {
            if remoteImageUrl.data.isEmpty || UIImage(data: remoteImageUrl.data) == nil {
                ZStack {
                    Image(uiImage: UIImage(named: "img_placeholder")!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    Image(uiImage: UIImage(systemName: "gear")!)
                        .resizable()
                        .colorInvert()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 48, height: 48, alignment: .center)
                        .rotationEffect(.radians(rotation))
                        .onAppear() {
                            withAnimation(Animation.default.repeatForever()) {
                                self.rotation = Double.pi / 2
                            }
                        }
                }
            } else {
                Image(uiImage: UIImage(data: remoteImageUrl.data)!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
        }
    }
}


struct ImageViewContainer_Previews: PreviewProvider {
    static var previews: some View {
        ImageViewContainer(imageUrl: URL(string: "https://source.unsplash.com/random"))
            .previewLayout(.fixed(width: 200, height: 200))
    }
}
