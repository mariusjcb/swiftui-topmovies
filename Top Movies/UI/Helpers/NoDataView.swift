//
//  NoDataView.swift
//  Top Movies
//
//  Created by Marius Ilie on 02/10/2019.
//  Copyright © 2019 Marius Ilie. All rights reserved.
//

import SwiftUI

struct NoDataView: View {
    var body: some View {
        VStack(alignment: .center) {
            Image("no_data")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
            
            Text("No Data Found")
                .font(.title)
                .fontWeight(.bold)
        }
    }
}

struct NoDataView_Previews: PreviewProvider {
    static var previews: some View {
        NoDataView()
    }
}
