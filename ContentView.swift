//
//  ContentView.swift
//  CodaMinaPatternLock
//
//  Created by Terry Lou on 2023/9/2.
//  BSD license

import SwiftUI

struct ContentView: View {
    @State var patternpwd: String = ""
    var body: some View {
        NavigationView{
            VStack{
                Text("圖形密碼\(patternpwd)").padding(13)
                PatternLockWrapView(identifier: $patternpwd)
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
