//
//  ContentView.swift
//  NavigationAndModalDemo
//
//  Created by mark on 10/19/23.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink("ModelWithNavigationView", destination: ModelWithNavigationView())
            }
            .navigationBarTitle("Main List", displayMode: .inline)
        }
    }
}


struct ModelWithNavigationView: View {
    @State private var showModal = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Navigated Content View")
            Button("Show Modal") {
                showModal.toggle()
            }
            .sheet(isPresented: $showModal, content: {
                NavViewDemo()
            })
        }
    }
}

struct NavViewDemo: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            List {
                NavigationLink("Item 1", destination: Text("Detail for Item 1"))
                NavigationLink("Item 2", destination: Text("Detail for Item 2"))
            }
            .navigationBarTitle("Modal Navigation", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Dismiss") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}




#Preview {
    ContentView()
}
