//
//  ContentView.swift
//  TabViewDemo
//
//  Created by mark on 9/28/23.
//

import SwiftUI
import SwiftData

enum Tab: Hashable {
    case one
    case two
    case three
}

struct ContentView: View {
    var body: some View {
        TabView {
            StateListView()
                .tabItem {
                    Label("States", systemImage: "list.bullet")
                }
            Text("Tab 2")
                .tabItem {
                    Label("Tab 2", systemImage: "square.and.pencil")
                }
            Text("Tab 3")
                .tabItem {
                    Label("Tab 3", systemImage: "play.circle")
                }
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    ContentView()
}


import SwiftUI

struct StateDetail: View {
    var stateName: String
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        VStack {
            Text("Details about \(stateName)")
            Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Back")
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct StateListView: View {
    let states = ["Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado"]

    var body: some View {
        NavigationView {
            List(states, id: \.self) { state in
                NavigationLink(destination: StateDetail(stateName: state)) {
                    Text(state)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            //.navigationBarTitle("States")
        }
        .navigationViewStyle(.stack)
    }
}
