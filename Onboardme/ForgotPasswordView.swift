//
//  TOYOTA.swift
//  Test
//
//  Created by sami chougle on 19/12/24.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @State private var Email: String = ""
    @State private var password: String = ""
    @State private var showForgotPassword = false

    var body: some View {
        NavigationStack{
            ZStack{
                RadialGradient(colors: [.white,.yellow], center: .bottomLeading, startRadius: 5, endRadius: 500)
                    .ignoresSafeArea(.all)
                
                VStack{
                    HStack{
                        Text("Forgot password")
                            .font(.largeTitle)
                            .foregroundColor(.black)
                            .padding()
                        Spacer()
                    }
                    .padding(.bottom,40)
                    HStack{
                        Text("Please enter your email to reset the password")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding()
                            .padding(.bottom)
                        Spacer()
                    }
//                    TextField
                    VStack(alignment: .leading){
                        Text("Your Email")
                            .foregroundColor(.black)
                            .padding(.horizontal)
                            .padding(.bottom,-20)
                        TextField("johndeo@gmail.com", text: $Email)
                            .textFieldStyle(.roundedBorder)
                            .padding()
                    }
//                    Button Sign up
                    HStack{
                        Button {
                            showForgotPassword = true
                        } label: {
                                Text("Send code")
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(
                                        Color.black
                                            .cornerRadius(12)
                                    ).padding(.top)
                        }.background(
                            NavigationLink(destination: ForgotPasswordVerificationView(),
                            isActive: $showForgotPassword)
                            {
                                EmptyView()
                            }
                                .hidden()
                        )
                    }.padding(.horizontal)
                    
                    Spacer()
                    
                    HStack{                        NavigationLink(destination:SignInView()){
                            Text("Back to Sign-In")
                                .foregroundColor(.black)
                                .underline(true, pattern: .solid, color: .black)
                        }
                        .padding(.horizontal)
                        .padding(.top,10)
                    }
                }
            }.navigationBarBackButtonHidden(true)
        }
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
