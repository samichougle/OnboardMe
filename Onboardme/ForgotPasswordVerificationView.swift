//
//  Forgotpassword2.swift
//  Test
//
//  Created by sami chougle on 27/12/24.
//

import SwiftUI
import Combine // Import Combine to use Just

struct ForgotPasswordVerificationView: View {
    
    @State private var showForgotPassword = false
    @State private var pinOne: String = ""
    @State private var pinTwo: String = ""
    @State private var pinThree: String = ""
    @State private var pinFour: String = ""
    @FocusState private var focusedField: Field?

    enum Field: Hashable {
            case first, second, third, fourth
        }
    
    var body: some View {
        NavigationStack {
            ZStack {
                RadialGradient(colors: [.white, .yellow], center: .bottomLeading, startRadius: 5, endRadius: 500)
                    .ignoresSafeArea(.all)
                VStack {
                    HStack {
                        Text("SaaC-Blend")
                            .font(.largeTitle)
                            .foregroundColor(.black)
                            .padding()
                        Spacer()
                    }
                    .padding(.bottom, 40)
                    
                    HStack {
                        Text("We sent a reset link to your mail. Enter the 4-digit code mentioned in the email.")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding()
                        Spacer()
                    }
                    
// OTP TextField Over here
                    HStack(spacing: 15) {
                        TextField("", text: $pinOne)
                            .keyboardType(.numberPad)
                            .modifier(OtpModifier(pin: $pinOne))
                            .focused($focusedField, equals: .first)
                            .onChange(of: pinOne) { newVal in
                                if newVal.count == 1 { pinTwo = "" } // Move to next field
                            }

                        TextField("", text: $pinTwo)
                            .keyboardType(.numberPad)
                            .modifier(OtpModifier(pin: $pinTwo))
                            .focused($focusedField, equals: .second)
                            .onChange(of: pinTwo) { newVal in
                                if newVal.count == 1 { pinThree = "" } // Move to next field
                                else if newVal.isEmpty { pinOne = "" } // Move back to previous field
                            }

                        TextField("", text: $pinThree)
                            .keyboardType(.numberPad)
                            .modifier(OtpModifier(pin: $pinThree))
                            .focused($focusedField, equals: .third)
                            .onChange(of: pinThree) { newVal in
                                if newVal.count == 1 { pinFour = "" } // Move to next field
                                else if newVal.isEmpty { pinTwo = "" } // Move back to previous field
                            }

                        TextField("", text: $pinFour)
                            .keyboardType(.numberPad)
                            .modifier(OtpModifier(pin: $pinFour))
                            .focused($focusedField, equals: .fourth)
                            .onChange(of: pinFour) { newVal in
                                if newVal.isEmpty { pinThree = "" } // Move back to previous field
                            }
                    }
                    .padding(.vertical)

// Button Verify Code
                    HStack {
                        Button {
                            showForgotPassword = true
                        } label: {
                            Text("Verify Code")
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(
                                    Color.black
                                        .cornerRadius(12)
                                ).padding(.top)
                        }
                        .background(
                            NavigationLink(destination: ForgotPasswordSuccessView(),
                                           isActive: $showForgotPassword) {
                                EmptyView()
                            }
                            .hidden()
                        )
                    }
                    .padding(.horizontal)
                    Spacer()
                    
// NavigationLink to Sign-In page
                    HStack {
                        NavigationLink(destination: SignInView()) {
                            Text("Back to Sign-In")
                                .foregroundColor(.black)
                                .underline(true, pattern: .solid, color: .black)
                        }
                        .padding(.horizontal)
                        .padding(.top, 10)
                    }
                }.onAppear {
                    focusedField = .first // Set focus to the first field on appear
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

// OTP Modifier for styling
struct OtpModifier: ViewModifier {
    @Binding var pin: String
    var textLimit = 1

    func limitText(_ upper: Int) {
        if pin.count > upper {
            self.pin = String(pin.prefix(upper))
        }
    }

    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.center)
            .keyboardType(.numberPad)
            .onReceive(Just(pin)) { _ in limitText(textLimit) }
            .frame(width: 45, height: 45)
            .background(Color.white.cornerRadius(5))
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.blue, lineWidth: 2)
            )
    }
}

struct ForgotPasswordVerificationView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordVerificationView()
    }
}
