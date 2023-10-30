import SwiftUI

struct ContentView: View {
    @StateObject var itemRepository = ItemRepository()
    @State private var newItemName = ""

    var body: some View {
        TabView {
            VStack {
                TextField("Item name", text: $newItemName)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button(action: {
                    let newItem = Item(name: newItemName)
                    itemRepository.addItem(newItem)
                    newItemName = ""
                }) {
                    Text("Add Item")
                }
                .padding()
                Spacer()
                ItemListView(itemRepository: itemRepository)
            }
            .tabItem {
                Label("Add Item", systemImage: "plus.circle")
            }

            ItemListView(itemRepository: itemRepository)
                .tabItem {
                    Label("Item List", systemImage: "list.bullet")
                }
        }
    }
}



#Preview {
    ContentView()
}
