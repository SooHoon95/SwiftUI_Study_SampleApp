//
//  ContentView.swift
//  ProperyWrapperExample
//
//  Created by 최수훈 on 1/21/25.
//

import SwiftUI

/// @State
/// SwiftUI에서 뷰의 상태를 관리하기 위해 사용됩니다. 상태가 변경되면 뷰가 다시 렌더링됩니다.
//struct ContentView: View {
//  @State private var count = 0
//  var body: some View {
//    VStack {
//      Text("Count: \(count)")
//      Button("Increase Count") {
//        count += 1
//      }
//    }
//  }
//}
//#Preview {
//  ContentView()
//}

///@Binding
///다른 뷰에서 관리하는 상태를 바인딩하여 값을 읽거나 쓸 수 있도록 합니다.
//struct ParentView: View {
//  @State private var name = "User"
//  
//  var body: some View {
//    ChildView(name: $name)  // @State를 @binding 으로 전달
//  }
//}
//
//struct ChildView: View {
//  @Binding var name: String
//  
//  var body: some View {
//    TextField("Enter your name",
//              text: $name)
//  }
//}
//#Preview {
//  ParentView()
//}

/// @Published
/// Combine에서 사용되며, ObservableObject의 속성 값 변경을 알릴 때 사용됩니다.
//class UserViewModel: ObservableObject {
//  @Published var username: String = "Guest"
//}
//
//struct ContentView: View {
//  @StateObject private var viewModel = UserViewModel()
//  
//  var body: some View {
//    VStack {
//      Text("Username: \(viewModel.username)")
//      Button("Change Username") {
//        viewModel.username = "SwiftUser" // 변경 시 UI 가 업데이트
//      }
//    }
//  }
//}
//#Preview {
//  ContentView()
//}


///@ObservedObject
///ObservableObject를 감시하며, 변경 사항이 있을 때 뷰를 업데이트합니다.
//class UserViewModel: ObservableObject {
//  @Published var username: String = "Guest"
//}
//
//struct ContentView: View {
//  @ObservedObject private var viewModel = UserViewModel()
//  
//  var body: some View {
//    VStack {
//      Text("Username: \(viewModel.username)")
//      Button("Change Username") {
//        viewModel.username = "SwiftUser" // 변경 시 UI 가 업데이트
//      }
//    }
//  }
//}
//#Preview {
//  ContentView()
//}

// ObservedObject 와 Publish - Stateobject 의 차이는?


///@EnvironmentObject
///앱 전반에서 공유 상태를 주입하고 사용할 수 있습니다.
//class AppSettings: ObservableObject {
//  @Published var isDarkMode: Bool = false
//}
//
//struct ParentView: View {
//  @StateObject private var settings = AppSettings()
//  
//  var body: some View {
//    ChildView().environmentObject(settings)
//      .padding()
//  }
//    
//}
//
//struct ChildView: View {
//  @EnvironmentObject var settings: AppSettings
//  
//  var body: some View {
//    Toggle("Dark Mode", isOn: $settings.isDarkMode)
//  }
//}
//#Preview {
//  ParentView()
//}

// 이 예제 조금 더 흐름을 파악할 수 있도록 설명 필요

///@Environment
/// SwiftUI 에서 제공하는 시스템 값(예: 화면크기, 다크 모드 여부 등)을 읽어 옵니다.
struct EnvironmentView: View {
  @Environment(\.colorScheme) var colorScheme
  var body: some View {
    Text(colorScheme == .dark ? "DarkMode" : "LightMode")
  }
}
#Preview {
  EnvironmentView()
}
