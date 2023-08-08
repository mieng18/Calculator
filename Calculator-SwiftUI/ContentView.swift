//
//  ContentView.swift
//  Calculator-SwiftUI
//
//  Created by mai nguyen on 8/7/23.
//

import SwiftUI

enum CalculatorButton: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "x"
    case equal = "="
    case clear = "AC"
    case decimal = "."
    case percent = "%"
    case negtive = "-/+"
    
    var buttonColor: Color {
        switch self{
            case .add, .subtract,.multiply,.divide,.equal:
            return Color.blue0060E5
            case .clear ,.negtive,.percent:
            return Color.gray363E4D
            default:
            return .darkGray242933
        }
    }
}

enum Operation {
    case add, substract, multiply,divide, none
}



struct ContentView: View {
    
    @State var value = "0"
    @State var runningNumber = 0
    @State var currentOperation: Operation = .none
    
    let buttons: [[CalculatorButton]] = [
        [.clear,.negtive,.percent,.divide],
        [.seven,.eight,.nine,.multiply],
        [.four,.five,.three,.add],
        [.one,.two,.six,.subtract],
        [.zero,.decimal,.equal],
    ]
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack{
                
                Spacer()
                
                HStack {
                    Spacer()
                    Text(value)
                        .bold()
                        .font(.system(size: 72))
                        .foregroundColor(.white)
                }
                .padding()
                
                ForEach(buttons,id: \.self) {row in
                    HStack{
                        ForEach(row,id:\.self) {
                            item in
                                
                                Button(action:
                                        
                                        {
                                    self.didTap(button: item)
                                }
                                ,label: {
                                    Text(item.rawValue)
                                        .font(.system(size: 32))
                                        .frame(width: buttonWidth(item: item), height: buttonHeight())
                                        .background(item.buttonColor)
                                        .foregroundColor(.textCBE1FF)
                                        .cornerRadius((buttonWidth(item: item))/2)
                                }
                            )

                        }
                    }
                    .padding(.bottom,3)
                }
            }
        }
    }
    
    func didTap(button: CalculatorButton ){
        switch button {
            
            case .add,.subtract,.divide,.multiply,.equal:
                if button == .add {
                    self.currentOperation = .add
                    self.runningNumber  = Int(self.value) ?? 0
                } else if button == .subtract {
                    self.currentOperation = .substract
                    self.runningNumber  = Int(self.value) ?? 0
                } else if button == .multiply {
                    self.currentOperation = .multiply
                    self.runningNumber  = Int(self.value) ?? 0
                    
                } else if button == .divide {
                    self.currentOperation = .divide
                    self.runningNumber  = Int(self.value) ?? 0
                    
                } else if button == .equal {
                    let runningValue = self.runningNumber
                    let currentValue = Int(self.value) ?? 0
                    
                    switch self.currentOperation {
                        case .add: self.value = "\(runningValue + currentValue)"
                        case .substract: self.value = "\(runningValue - currentValue)"
                        case .multiply: self.value = "\(runningValue * currentValue)"
                        case .divide: self.value = "\(runningValue / currentValue)"
                        case .none:
                            break
                        
                    }
                    
                }
            
            
            if button != .equal {
                self.value = "0"
            }
            case .clear:
                self.value = "0"
            case .decimal,.negtive,.percent:
                break
        default:
            let number = button.rawValue
            if self.value == "0" {
                value = number
            } else {
                self.value =  "\(self.value)\(number))"
            }
                
                
        }
    
    }
    
    func buttonWidth(item: CalculatorButton) -> CGFloat {
        if item == .zero {
            return ((UIScreen.main.bounds.width - (4*12)) / 4) * 2
        }
        return (UIScreen.main.bounds.width - (5*12))/4
    }
    
    func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - (5*12))/4
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
