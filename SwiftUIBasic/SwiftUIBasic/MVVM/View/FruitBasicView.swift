//
//  FruitBasicView.swift
//  SwiftUIBasic
//
//  Created by 최수훈 on 10/20/25.
//

import SwiftUI

struct FruitBasicView: View {
  
  //ObservedObject 사용하여 ViewModel 객체화 하기 -> SubView에서 사용(부모 View 값을 넘겨 받았을 때)
//  @ObservedObject var fruitViewModel = FruitsViewModel()
  
  // @StateObject 사용하여 ViewMOdel 객체화하기 -> View가 처음 생성, 초기화 할때, 부모 View에서 주로 사용
  @StateObject var fruitViewModel = FruitsViewModel()
  
  var body: some View {
    NavigationView {
      List {
        if fruitViewModel.isLoading {
          ProgressView()
        } else {
          ForEach(fruitViewModel.fruitArray) { fruit in
            HStack {
              Text("\(fruit.count)")
                .foregroundStyle(.red)
              Text(fruit.name)
                .font(.headline)
                .bold()
            } // HStack
            
          } // ForEach
        } // Conditional
      } // Liset
      // onAppear에 하면 계속 배열에 추가해서 중복되는 UI 생김
//      .onAppear {
//        fruitViewModel.getFruit()
//      }
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          NavigationLink(destination: SecondScreen(fruitViewModel: fruitViewModel)) {
            Image(systemName: "arrow.right")
              .font(.title)
          }
        }
      }
      .navigationTitle("과일 리스트")
    }
  }
}

struct SecondScreen: View {
  // MARK: - property
  
  @ObservedObject var fruitViewModel: FruitsViewModel
  @Environment(\.dismiss) var dismiss
  var body: some View {
    ZStack {
      Color.green.ignoresSafeArea()
      
      VStack(spacing: 20) {
        ForEach(fruitViewModel.fruitArray) { fruit in
          Text(fruit.name)
            .font(.headline)
            .foregroundStyle(.white)
        }
        
        Button {
          dismiss()
        } label: {
          Text("뒤로 가기")
            .font(.largeTitle)
            .foregroundStyle(.white)
            .fontWeight(.bold)
        }
      } // vstack
    }// zstack
  }
}

#Preview {
  FruitBasicView()
}
