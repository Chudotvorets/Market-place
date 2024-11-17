//
//  ProductListView.swift
//  Market place
//
//  Created by dev on 14.11.2024.
//

import Foundation
import SwiftUI

struct ProductListView: View {
    
    @EnvironmentObject var viewModel: ProductViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $viewModel.searchQuery)
                ScrollView {
                    
                }
            }
        }
    }
}

struct SearchBar: UIViewRepresentable {

    @Binding var text: String
    
    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String

        init(text: Binding<String>) {
            _text = text
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }
    
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar()
        searchBar.delegate = context.coordinator
        searchBar.placeholder = "Search products"
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }
    
}
