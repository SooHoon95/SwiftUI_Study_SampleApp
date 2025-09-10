//
//  ListeBasic.swift
//  SwiftUIBasic
//
//  Created by 최수훈 on 9/10/25.
//

import SwiftUI

struct ListBasic: View {
  
  @State var fruits: [String] = ["사과", "오렌지", "바나나", "수박"]
  
  @State var meats: [String] = ["돼지고기", "소고기", "닭고기"]
  
  var body: some View {
    NavigationView {
      List{
        Section {
          ForEach(fruits, id: \.self) { fruit in
            Text(fruit)
              .font(.body)
              .foregroundStyle(.white)
              .padding(.vertical)
          }
          .onDelete(perform: delete)
          .onMove(perform: move)
          .listRowBackground(Color.blue)
        } header: {
          Text("과일종류")
            .font(.headline)
            .foregroundStyle(.brown)
        }
        
        Section {
          ForEach(meats, id: \.self) { meat in
            Text(meat)
              .font(.body)
              .foregroundStyle(.white)
              .padding(.vertical)
          }
        } header: {
          Text("고기종류")
            .font(.headline)
            .foregroundStyle(.red)
        }
      }
    }
    .navigationTitle("우리동네 마트")
    .navigationBarTitleDisplayMode(.inline)
    .navigationBarItems(leading: EditButton())
//    .toolbar {
//      ToolbarItem(placement: .navigationBarLeading) { Button("Edit") {} }
//      ToolbarItem(placement: .navigationBarTrailing) { addButton }
//    }
  }
  
  private func delete(indexSet: IndexSet) {
    fruits.remove(atOffsets: indexSet)
  }
  private func move(indeces: IndexSet, newOffset: Int) {
    fruits.move(fromOffsets: indeces, toOffset: newOffset)
  }
  
  var addButton: some View {
    Button {
      fruits.append("딸기")
    } label: {
      Text("Add")
    }
  }
}

#Preview {
  ListBasic()
}
