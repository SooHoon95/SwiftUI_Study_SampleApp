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
//      CounterButton(count: $count)
//    }
//  }
//}
//
//struct CounterButton: View {
//  @Binding var count: Int
//  
//  var body: some View {
//    Button {
//      count += 1
//    } label: {
//      Text("Add Count")
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
//    NavigationView {
//      VStack {
//        Text("Parent UserName: \(name)")
//        NavigationLink("Move to Child View",
//                       destination: ChildView(name: $name))  // @State를 @binding 으로 전달
//        }
//      }
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
//  @Published var isDarkMode: Bool = true
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
//    SubButtonView()
//  }
//}
//
//struct SubButtonView: View {
//  @EnvironmentObject var settings: AppSettings
//  var body: some View {
//    Button {
//      settings.isDarkMode.toggle()
//    } label: {
//      Text("SubView Button")
//    }
//  }
//}
//  
//#Preview {
//  ParentView()
//}

// 이 예제 조금 더 흐름을 파악할 수 있도록 설명 필요

/// @Environment
/// SwiftUI 에서 제공하는 시스템 값(예: 화면크기, 다크 모드 여부 등)을 읽어 옵니다.
//struct EnvironmentView: View {
//  @Environment(\.colorScheme) var colorScheme
//      @Environment(\.locale) var locale
//      @Environment(\.verticalSizeClass) var verticalSizeClass
//
//      var body: some View {
//          VStack {
//              Text("Color Scheme: \(colorScheme == .dark ? "Dark" : "Light")")
//              Text("Locale: \(locale.identifier)")
//              Text("Vertical Size Class: \(verticalSizeClass == .compact ? "Compact" : "Regular")")
//          }
//      }
//}
//#Preview {
//  EnvironmentView()
//}

// @Environment 종류 더 필요


/// @AppStage
/// UserDefaults 와 연결하여 데이터를 영구적으로 저장
//struct AppStorageExampleView: View {
//  @AppStorage("username") private var username = "Guest User"
//
//  var body: some View {
//    VStack {
//      Text("Username: \(username)")
//      Button("Change Username") {
//        username = " New User "
//      }
//    }
//  }
//}
//#Preview {
//  AppStorageExampleView()
//}


/// @FocusState
/// SwiftUI 에서 포커스 상태관리 ( 주로 텍스트 필드와 함께 사용 )
//struct FocusStateExampleView: View {
//  @FocusState private var isFocused: Bool
//
//  var body: some View {
//    TextField("Endter text", text: .constant(""))
//      .focused($isFocused)
//      .onAppear {
//        DispatchQueue.main.asyncAfter(deadline: .now()) {
//          isFocused = true
//        }
//      }
//  }
//}
//
//#Preview {
//  FocusStateExampleView()
//}

/// @StateObject
/// ObservableObjet의 인스턴스를 관리하며 뷰가 생성될 떄 초기화 됩니다.
//struct StateObjectExampleView: View {
//
//  @StateObject private var viewModel = UserViewModel()
//
//  var body: some View {
//    Text("Username: \(viewModel.username)")
//  }
//
//}
//#Preview {
//  StateObjectExampleView()
//}

///@Namespace
///애니메이션 및 매칭 요소의 전환을 관리하는 데 사용됩니다.

struct NamespaceExample: View {
    @Namespace private var animationNamespace
    @State private var isExpanded = false

    var body: some View {
        VStack {
            if isExpanded {
                RoundedRectangle(cornerRadius: 25.0)
                    .matchedGeometryEffect(id: "shape", in: animationNamespace)
                    .frame(width: 300, height: 200)
                    .onTapGesture {
                        withAnimation {
                            isExpanded.toggle()
                        }
                    }
            } else {
                RoundedRectangle(cornerRadius: 25.0)
                    .matchedGeometryEffect(id: "shape", in: animationNamespace)
                    .frame(width: 100, height: 100)
                    .onTapGesture {
                        withAnimation {
                            isExpanded.toggle()
                        }
                    }
            }
        }
    }
}
#Preview {
  NamespaceExample()
}

// ?? 그래서 animationNamespace 가 하는 역할이 뭔데?

/*
 1. ObservedObject 와 Publish - Stateobject 의 차이는?
 2.EnvironmentObject 예제를 흐름을 파악할 수 있도록 더 자세히 설명 필요
 3.  @Environment 종류 더 필요
 4. 그래서 animationNamespace 가 하는 역할이 뭔데?
 */

/*
 1. @ObservedObject와 @Published - @StateObject의 차이
 
 @ObservedObject vs @StateObject
 •  @StateObject:
 •  ObservableObject의 인스턴스를 뷰에서 직접 초기화하고 소유합니다.
 •  뷰가 처음 생성될 때 한 번만 초기화됩니다.
 •  같은 뷰가 여러 번 다시 그려져도 상태가 유지됩니다.
 
 •  @ObservedObject:
 •  외부에서 전달받은 ObservableObject를 사용하며, 뷰가 해당 객체를 감시합니다.
 •  상태를 직접 소유하지 않으며, 데이터는 부모 뷰나 다른 객체에서 관리됩니다.
 
 */

//class CounterViewModel: ObservableObject {
//    @Published var count = 0
//}
//
//struct StateObjectExample: View {
//    @StateObject private var viewModel = CounterViewModel() // 직접 관리
//
//    var body: some View {
//        NavigationView {
//          VStack {
//              Text("Count: \(viewModel.count)")
//              Button("Increment") {
//                  viewModel.count += 1
//              }
//            NavigationLink("Move to Empty View", destination: EmptyView())
//          }
//        }
//    }
//}
//
//struct ObservedObjectExample: View {
//    @ObservedObject var viewModel: CounterViewModel // 외부에서 주입받음
//
//    var body: some View {
//        NavigationView {
//          VStack {
//              Text("Count: \(viewModel.count)")
//              Button("Increment") {
//                  viewModel.count += 1
//              }
//            NavigationLink("Move to emptyView", destination: EmptyView())
//          }
//        }
//    }
//}
//
//struct EmptyView: View {
//
//  var body: some View {
//    Text("EmptyView")
//  }
//}
//
//#Preview {
//  StateObjectExample()
//  ObservedObjectExample(viewModel: CounterViewModel())
//}

//class CounterViewModel: ObservableObject {
//  @Published var count: Int = 0
//  
//  init() {
//    print("DEBUG: CountView's ViewModel is initialize")
//  }
//  
//  func increase() { count += 1 }
//}
//
//struct ParentView: View {
//  @State private var count: Int = 0
//  
//  var body: some View {
//    NavigationView {
//      VStack {
//        Text("ParentView's count is \(count)")
//        NavigationLink {
//          CounterView(parentCount: $count, viewModel: CounterViewModel())
//        } label: {
//          Text("Navigate to CountView")
//        }
//      }
//    }
//  }
//}
//
//struct CounterView: View {
//  @Binding var parentCount: Int
//  @StateObject var viewModel: CounterViewModel
//  
//  var body: some View {
//    VStack(spacing: 10) {
//      Text("CountView's Count is \(viewModel.count)")
//      
//      Button(action: {
//        viewModel.increase()
//      }, label: {
//        Text("Add Count")
//      })
//      
//      Text("ParentView's Count is \(parentCount)")
//      
//      Button(action: {
//        parentCount += 1
//      }, label: {
//        
//        Text("Add Count")
//      })
//    }
//  }
//}
//
//#Preview {
//  ParentView()
//}

//=====================================================


// 2.

// 전역적으로 공유할 데이터
//class AppSettings: ObservableObject {
//    @Published var isDarkMode: Bool = false
//}
//
//struct EnvironmentObjectExample: View {
//  @StateObject private var settings = AppSettings() // Root에서 상태 초기화
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                Toggle("Enable Dark Mode", isOn: $settings.isDarkMode)
//                    .padding()
//                NavigationLink("Go to Detail View", destination: DetailView())
//            }
//            .environmentObject(settings) // 하위 뷰로 전달
//        }
//    }
//}
//
//struct DetailView: View {
//    @EnvironmentObject var settings: AppSettings // 전역 상태 참조
//
//    var body: some View {
//        VStack {
//            Text("Dark Mode is \(settings.isDarkMode ? "On" : "Off")")
//            Toggle("Toggle Dark Mode", isOn: $settings.isDarkMode)
//                .padding()
//        }
//    }
//}
//#Preview {
//  EnvironmentObjectExample()
//}

/*
 동작 흐름
 1.  AppSettings를 @StateObject로 초기화합니다.
 2.  environmentObject(_:)를 사용하여 settings를 하위 뷰에 전달합니다.
 3.  DetailView는 @EnvironmentObject로 settings에 접근하여 값을 읽고 수정합니다.
 4.  전역 상태이므로 수정이 어디에서 일어나도 모든 관련 뷰가 업데이트됩니다.
 */



// =====================================================

