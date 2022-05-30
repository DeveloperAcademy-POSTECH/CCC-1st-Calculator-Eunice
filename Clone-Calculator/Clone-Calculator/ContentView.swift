//
//  ContentView.swift
//  Clone-Calculator
//
//  Created by EuniceNam on 2022/05/29.
//

//Questions
// - Dark mode vs ZStack{Color.black}

import SwiftUI

struct ContentView: View {
    //appstorage 작동하는지 확인 필요함
    @AppStorage("displayNumb") var displayNum: Double = 0.0
//    @State var input: String?
    @State var decPoint = 1
//    @State var opbuffer: String?
    @State var opStack: [String?] = []
    @State var numStack: [Int?] = []
    @State var err: Bool = false
    var body: some View {
                    
        let columnSize = UIScreen.main.bounds.width * 0.25
        let buttonSize = columnSize * 0.9
        let spacingSize = columnSize * 0.1
            
        VStack(spacing: spacingSize){
            Spacer().frame(height: UIScreen.main.bounds.height * 0.1)
            //숫자칸에 최대 9개 숫자 들어감
            //오류시 오류 출력
            if err{
                Text("오류")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .font(
                        .custom("display", size: 96, relativeTo: .largeTitle)
                        .weight(.ultraLight))
                    .minimumScaleFactor(0.6)
                    .textSelection(.enabled)
            }else{
                Text(displayNum, format: .number)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .lineLimit(1)
                    .font(
                        .custom("display", size: 96, relativeTo: .largeTitle)
                        .weight(.ultraLight))
                    .minimumScaleFactor(0.6)
                    // 텍스트 선택 -> 복사 가능
                    .textSelection(.enabled)
            }
            
            // 4종류의 버튼
            //   1) 숫자, 0, '.'
            //   2) 당장 바뀌고 끝남(AC/+-/%)
            //   3) 사칙연산(토글됨)
            //   4) 계산(=)
            
            HStack(spacing: spacingSize){
                VStack(spacing: spacingSize){
                    //Buttons with simple instant changes
                    //AC-C, +/-, %
                    HStack(spacing: spacingSize){
                        //AC-C
                        Button(action:{
                            if displayNum == 0{
                                //all clear
                                opStack.removeAll()
                                numStack.removeAll()
                            }
                            displayNum = 0
                        }){
                            Text(displayNum == 0 ? "AC" : "C")
                                .customTextLightGray(buttonSize)
                        }
                        //+/-
                        Button(action:{
                            displayNum *= -1
                        }){
                            Text("\(Image(systemName: "plus.forwardslash.minus"))")
                                .customTextLightGray(buttonSize)
                        }
                        // %
                        Button(action:{
                            displayNum *= 0.01
                        }){
                            Text("\(Image(systemName: "percent"))")
                                .customTextLightGray(buttonSize)
                        }
                    }
                    //1-9 숫자판
                    //ref: https://www.appcoda.com/learnswiftui/swiftui-gridlayout.html
                    let gridLayout = [GridItem(.fixed(buttonSize)), GridItem(.fixed(buttonSize + spacingSize/2)), GridItem(.fixed(buttonSize))]
                    
                    LazyVGrid(columns: gridLayout, spacing: spacingSize){
                        ForEach([7,8,9,4,5,6,1,2,3], id: \.self){ num in
                            Button(action: {
                                numberInput(num)
                            }){
                                Text("\(num)").customTextDarkGray(buttonSize)
                            }
                        }
                    }
                    .padding(0)
                }
            //사칙연산
                VStack(spacing: spacingSize){
                    ForEach(["divide", "multiply", "minus", "plus"], id:\.self){ op in
                        Button(action: {
                            opInput(op)
                        }){
                            Text("\(Image(systemName: op))")
                                .customTextOrange(buttonSize)
                        }
                    }
                }
                .padding(0)
            }
            // 0, '.', '='
            HStack(spacing: spacingSize){
                //0
                Button(action: {
                    if displayNum != 0{
                        numberInput(0)
                    }
                }){
                    ZStack{
                        Capsule()
                            .fill(Color(UIColor.systemGray4))
                            .frame(width: (buttonSize * 2 + spacingSize), height: buttonSize)
                        Text("0")
                            .font(.system(size: buttonSize * 0.5))
                            .foregroundColor(.white)
                            .frame(width: buttonSize, height: buttonSize)
                            .offset(x: -(buttonSize+spacingSize) * 0.5)
                    }

                }
                //'.'
                Button(action: {
                    if decPoint == 1 {
                        decPoint = 0
                    }
                }){
                    Text(".")
                        .customTextDarkGray(buttonSize)
                }
                //'='
                Button(action: {
                    calculate(opStack: opStack, numStack: numStack)
                }){
                    Text("=")
                        .customTextOrange(buttonSize)
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
