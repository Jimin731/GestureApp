//
//  ContentView.swift
//  GestureApp
//
//  Created by 박지영 on 2021/07/08.
//

import SwiftUI

struct ContentView: View {
    @State var magnification = CGFloat(1.0)
    @GestureState var offset = CGSize.zero
    var body: some View {
        let tapGesture = TapGesture(count: 2)
            .onEnded{_ in
                NSLog("tapped")
            }
        let longPressGesture = LongPressGesture(minimumDuration: 3, maximumDistance: 5)
            .onEnded{ _ in
                NSLog("Long pressed")
            }
        let magGesture = MagnificationGesture(minimumScaleDelta: 0)
            .onChanged{ value in
                print("Mag value = \(value)")
                self.magnification = value
            }
            .onEnded{ value in
                NSLog("MagGesture Ended : \(value)")
            }
        let dragGesture = DragGesture()
            .updating($offset){ dv, state, transcation in
                state = dv.translation
            }
        return VStack {
            Image(systemName: "hand.point.right.fill")
                .font(.largeTitle)
                .padding()
                .border(Color.black, width: 2)
                .scaleEffect(magnification)
                .offset(offset)
                //.gesture(tapGesture)
                //.gesture(magGesture)
                .gesture(dragGesture)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
