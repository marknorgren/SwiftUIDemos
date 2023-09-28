import SwiftUI

struct DemoButton: View {
    let text: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(text)
        }.buttonStyle(.borderedProminent)
    }
}

struct ContentView: View {
    @State private var showFirstCover = false
    @State private var showSecondCover = false
    
    var body: some View {
        VStack {
            DemoButton(text: "Show First Cover") {
                self.showFirstCover.toggle()
            }
            
            DemoButton(text: "Show Second Cover") {
                self.showSecondCover.toggle()
            }
            
            DemoButton(text: "Show Both Covers") {
                self.showFirstCover.toggle()
                self.showSecondCover.toggle()
            }
        }
        .fullScreenCover(isPresented: $showFirstCover) {
            VStack {
                Text("This is the First fullScreenCover")
                DemoButton(text: "Dismiss") {
                    self.showFirstCover = false
                }
            }
        }
        .fullScreenCover(isPresented: $showSecondCover) {
            VStack {
                Text("This is the Second fullScreenCover")
                DemoButton(text: "Dismiss") {
                    self.showSecondCover = false
                }
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
