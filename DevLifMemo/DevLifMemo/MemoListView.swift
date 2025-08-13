//
//  ContentView.swift
//  DevLifMemo
//
//  Created by 최수훈 on 5/11/25.
//

import SwiftUI

struct MemoListView: View {
  @State var itemLists: [MemoItem] = []
  @State private var path = NavigationPath()
  
  var body: some View {
    NavigationStack(path: $path) {
      VStack {
        List {
          ForEach(itemLists, id: \.number) { item in
            Button {
              path.append(item)
            } label: {
              Text(item.title)
            }
            .buttonStyle(.plain)
          }
          .onDelete(perform: deleteMemo)
        
        Button {
          itemLists
            .append(
              MemoItem(
                id: UUID(),
                number: itemLists.count + 1,
                title: "newMemo \(itemLists.count + 1)",
                description: "",
                date: Date().timeIntervalSince1970
              )
            )
        } label: {
          Text("메모 추가")
            .foregroundStyle(.blue)
        }
      }
      .listStyle(.plain)
    }
    .navigationTitle("DevLif's Memo App")
    .navigationBarTitleDisplayMode(.automatic)
    .navigationDestination(for: MemoItem.self) { item in
      MemoDetailView(memo: item)
    }
  }
}

private func deleteMemo(at offsets: IndexSet) {
  itemLists.remove(atOffsets: offsets)
}
}

#Preview {
  MemoListView()
}
