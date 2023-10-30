import Foundation

class ItemRepository: ObservableObject {
    @Published var items: [Item] = []

    private let itemsKey = "itemsKey"

    init() {
        loadItems()
    }

    func loadItems() {
        guard let data = UserDefaults.standard.data(forKey: itemsKey),
              let savedItems = try? JSONDecoder().decode([Item].self, from: data) else { return }

        self.items = savedItems
    }

    func saveItems() {
        guard let data = try? JSONEncoder().encode(items) else { return }
        UserDefaults.standard.set(data, forKey: itemsKey)
    }

    func addItem(_ item: Item) {
        items.append(item)
        saveItems()
    }

    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
        saveItems()
    }

    func moveItem(from source: IndexSet, to destination: Int) {
        items.move(fromOffsets: source, toOffset: destination)
        saveItems()
    }
}
