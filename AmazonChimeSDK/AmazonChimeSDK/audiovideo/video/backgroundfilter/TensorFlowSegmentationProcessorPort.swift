//
//  TensorFlowSegmentationProcessorPort.swift
//
//
//  Created by Devin McKaskle on 9/25/23.
//


// You cannot mix and match Objective-C and Swift files in a package.
// I am porting these Objective-C types over to Swift language so that
// the package will compile.


import Foundation



public class TensorFlowSegmentationProcessor : NoopSegmentationProcessor {
    /// This was not properly ported. Do not use until it has been correctly ported.
    open class func isAvailable() -> Bool { false }
}
