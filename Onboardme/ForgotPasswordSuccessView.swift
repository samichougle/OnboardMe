//
//  newpassword.swift
//  Test
//
//  Created by sami chougle on 25/12/24.
//

import SwiftUI

struct ForgotPasswordSuccessView: View {
    @State private var Email: String = ""
    @State private var password: String = ""
    @State private var confirmpass: String = ""
    @State private var showForgotPassword = false
    var body: some View {
        NavigationStack{
            ZStack{
                RadialGradient(colors: [.white,.yellow], center: .bottomLeading, startRadius: 5, endRadius: 500)
                    .ignoresSafeArea(.all)
                
                
                VStack{
                    HStack{
                        Text("Set a new password")
                            .font(.largeTitle)
                            .foregroundColor(.black)
                            .padding()
                        Spacer()
                    }
                    .padding(.bottom,40)
                    HStack{
                        Text("Create a new password. Ensure it differs from previous ones for security")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding()
                        Spacer()
                    }
//                    SecureField
                    VStack(alignment: .leading){
                        Text("Password")
                            .foregroundColor(.black)
                            .padding(.horizontal)
                            .padding(.bottom,-20)
                        SecureField("Password", text: $password)
                            .textFieldStyle(.roundedBorder)
                            .padding()
                    }
//                    SecureField
                    VStack(alignment: .leading){
                        Text("Confirm Password")
                            .foregroundColor(.black)
                            .padding(.horizontal)
                            .padding(.bottom,-20)
                        SecureField("Confirm Password", text: $confirmpass)
                            .textFieldStyle(.roundedBorder)
                            .padding()
                    }
                    
//                    Button Update Password
                    HStack{
                        Button {
                            showForgotPassword = true
                        } label: {
                            Text("Update Password")
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(
                                    Color.black
                                        .cornerRadius(12)
                                ).padding(.top)
                        }.background(
                            NavigationLink(destination: SignInView(),
                            isActive: $showForgotPassword)
                            {
                                EmptyView()
                            }
                            .hidden()
                            )
                    }.padding(.horizontal)
//                    NavigationLink for Back to Sign-In
                    HStack{
                        Spacer()
                        NavigationLink(destination:SignInView()){
                            Text("Back to Sign-in")
                                .foregroundColor(.black)
                                .underline(true, pattern: .solid, color: .black)
                        }
                        .padding(.horizontal)
                        .padding(.top,10)
                    }
            
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct ForgotPasswordSuccessView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordSuccessView()
    }
}
