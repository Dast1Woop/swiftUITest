//
//  ContentView.swift
//  OutlineGroupTest
//
//  Created by LongMa on 2022/10/11.
//

import SwiftUI

/// For structs whose stored properties are all Hashable, and for enum types that have all-Hashable associated values, the compiler is able to provide an implementation of hash(into:) automatically.
///  Many types in the standard library conform to Hashable: Strings, integers, floating-point and Boolean values, and even sets are hashable by default. Some other types, such as optionals, arrays and ranges automatically become hashable when their type arguments implement the same.
struct CourseCategory:Hashable,Identifiable,CustomStringConvertible {
    
    var id: Self {
        self
    }
    
//    var id: Self { self }
    var name:String
    var children:[CourseCategory]?
    
    var description:String {
        switch children {
        case nil:
            return "📃：\(name)"
        case .some(let child):
            return child.isEmpty ? "📃：\(name)" : "📂：\(name)"
        }
    }
}

struct Data {
    static let data =  CourseCategory(name: "DevTechie", children:
                                        [
                                            CourseCategory(name: "DevTechie Video Courses", children:
                                                            [
                                                                CourseCategory(name: "iOS", children:
                                                                                [CourseCategory(name: "Machine Learning in iOS"),
                                                                                 CourseCategory(name: "Mastering iOS Development")]),
                                                                CourseCategory(name: "Flutter", children:
                                                                                [CourseCategory(name: "Practical Flutter Development")]),
                                                                CourseCategory(name: "Android", children: [
                                                                    CourseCategory(name: "Mastering Kotlin for Android")
                                                                ])
                                                            ])
                                        ])
}

struct ContentView: View {
    var body: some View {
        List {
            
            /// Creates an outline group from a root data element and a key path to
            /// its children.
            ///
            /// This initializer creates an instance that uniquely identifies views
            /// across updates based on the identity of the underlying data element.
            ///
            /// All generated disclosure groups begin in the collapsed state.
            ///
            /// Make sure that the identifier of a data element only changes if you
            /// mean to replace that element with a new element, one with a new
            /// identity. If the ID of an element changes, then the content view
            /// generated from that element will lose any current state and animations.
            ///
            /// - Parameters:
            ///   - root: The root of a collection of tree-structured, identified
            ///     data.
            ///   - children: A key path to a property whose non-`nil` value gives the
            ///     children of `data`. A non-`nil` but empty value denotes an element
            ///     capable of having children that's currently childless, such as an
            ///     empty directory in a file system. On the other hand, if the property
            ///     at the key path is `nil`, then the outline group treats `data` as a
            ///     leaf in the tree, like a regular file in a file system.
            ///   - content: A view builder that produces a content view based on an
            ///    element in `data`.
            OutlineGroup(Data.data, children: \.children) { item in
                Text(item.description)
//                    .onTapGesture {
//                        print("taping:\(item.description)")
//                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
