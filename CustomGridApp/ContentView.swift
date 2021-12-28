//
//  ContentView.swift
//  CustomGridApp
//
//  Created by Adam Jemni on 12/28/21.
//


import SwiftUI
import NukeUI
import Combine

struct ContentView: View {
    
    let urls = (0...100).map { "https://picsum.photos/id/\($0*2)/500/600" }.unflattening(dim: 12)
    
    var body: some View {
        
        VStack {
            
            ScrollView {
                
                LazyVStack(spacing:1) {
                    
                    ForEach(Array(urls.enumerated()), id:\.offset) { i,url in
                        Section(images: url)
                    }
                }
            }
        }
    }
}

extension Array {
    func unflattening(dim: Int) -> [[Element]] {
        let hasRemainder = !count.isMultiple(of: dim)
        var result = [[Element]]()
        let size = count / dim
        result.reserveCapacity(size + (hasRemainder ? 1 : 0))
        for i in 0..<size {
            result.append(Array(self[i*dim..<(i + 1) * dim]))
        }
        if hasRemainder {
            result.append(Array(self[(size * dim)...]))
        }
        return result
    }
}

extension Collection {
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

extension MutableCollection {
    subscript(safe index: Index) -> Element? {
        get {
            return indices.contains(index) ? self[index] : nil
        }
        
        set(newValue) {
            if let newValue = newValue, indices.contains(index) {
                self[index] = newValue
            }
        }
    }
}




struct Section:View {
    
    let images: [String]
    
    var body: some View {
        
        VStack(spacing:divider) {
            
            HStack(spacing:divider) {
                
                VStack(spacing:divider) {
                    
                    LazyImage(source: images[safe:0])
                        .frame(width: widthSmall, height: heighSmall)
                    
                    LazyImage(source: images[safe:1])
                        .frame(width: widthSmall, height: heighSmall)
                }
                
                LazyImage(source: images[safe:2])
                    .frame(width: widthBig, height: heightBig)
            }
            
            HStack(spacing:divider) {
                
                LazyImage(source: images[safe:3])
                    .frame(width: ((screen.width / 3) ), height: heighSmall )
                
                LazyImage(source: images[safe:4])
                    .frame(width: ((screen.width / 3)), height: heighSmall )
                
                LazyImage(source: images[safe:5])
                    .frame(width: ((screen.width / 3) ), height: heighSmall )
            }
            
            HStack(spacing:divider) {
                
                LazyImage(source: images[safe:6])
                    .frame(width: widthBig, height: heightBig)
                
                VStack(spacing:divider) {
                    
                    LazyImage(source: images[safe:7])
                        .frame(width: widthSmall, height: heighSmall)
                    
                    LazyImage(source: images[safe:8])
                        .frame(width: widthSmall, height: heighSmall)
                }
            }
            
            HStack(spacing:divider) {
                
                LazyImage(source: images[safe:9])
                    .frame(width: ((screen.width / 3) ), height: heighSmall )
                
                LazyImage(source: images[safe:10])
                    .frame(width: ((screen.width / 3)), height: heighSmall )
                
                LazyImage(source: images[safe:11])
                    .frame(width: ((screen.width / 3) ), height: heighSmall )
            }
        }
    }
}
