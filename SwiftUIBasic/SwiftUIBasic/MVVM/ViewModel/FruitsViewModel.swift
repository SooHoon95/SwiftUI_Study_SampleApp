//
//  FruitsViewModel.swift
//  SwiftUIBasic
//
//  Created by 최수훈 on 10/20/25.
//

import Foundation


class FruitsViewModel: ObservableObject {
  // MARK: - property
  
  // published warpper 는 @State와 비슷하게 상태값을 선언하는데, class 안에서는 @Puvlished를 사용한다.
  // Publihshed 는 Fruit 배열의 값이 View에서 변경이 되면 FruitViewModel 에서 새로운 변경사항을 알아처려서 변경한다는 점이 다르다.
  @Published var fruitArray: [FruitsModel] = []
  @Published var isLoading: Bool = false
  
  init() {
    getFruit()
  }
  
  // MARK: - function
  // fruit 생성하고 Array에 추가하는 함수
  func getFruit() {
    // fruit 의 각각의 값 선언
    let fruit1 = FruitsModel(name: "딸기", count: 1)
    let fruit2 = FruitsModel(name: "사과", count: 3)
    let fruit3 = FruitsModel(name: "바나나", count: 80)
    
    // 3초 딜레이 휘 Fruitarray에 선언된 값을 집어넣기
    isLoading = true
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
      self.fruitArray = [fruit1, fruit2, fruit3]
      self.isLoading = false
    }
  }
  
  func deleteFruit(index: IndexSet) {
    fruitArray.remove(atOffsets: index)
  }
}
 
