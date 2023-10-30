//
//  ItemListView.swift
//  RepositoryDemo
//
//  Created by mark on 10/30/23.
//

import SwiftUI

struct ItemListView: View {
    @ObservedObject var itemRepository: ItemRepository

    var body: some View {
        List {
            ForEach(itemRepository.items) { item in
                HStack {
                    Text(item.name)
                    Text(item.created.formatted(.iso8601))
                }

            }
            .onDelete(perform: itemRepository.deleteItems)
            .onMove(perform: itemRepository.moveItem)
        }
        .navigationTitle("Items")
        .toolbar {
            EditButton()
        }
    }
}
