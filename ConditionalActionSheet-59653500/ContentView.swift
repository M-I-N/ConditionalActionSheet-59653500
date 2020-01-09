//
//  ContentView.swift
//  ConditionalActionSheet-59653500
//
//  Created by Mufakkharul Islam Nayem on 1/9/20.
//  Copyright © 2020 Mufakkharul Islam Nayem. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var isActionSheetPresented = false

    var body: some View {
        VStack {
            Text("Hello, World!")
            Button(action: {
                self.isActionSheetPresented = true
            }) {
                Text("Show Action Sheet")
            }
        }
        .modifier(Sheet(presented: $isActionSheetPresented))
    }
}

struct Sheet: ViewModifier {
    @Binding var presented: Bool

    func body(content: Content) -> some View {
        #if os(OSX)
        return content
        #else
        return content
            .actionSheet(isPresented: $presented) {
                ActionSheet(title: Text("Action Title"),
                            message: Text("Action Message"),
                            buttons: [.cancel(), .default(Text("Ok"))]
                )
        }
        #endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
