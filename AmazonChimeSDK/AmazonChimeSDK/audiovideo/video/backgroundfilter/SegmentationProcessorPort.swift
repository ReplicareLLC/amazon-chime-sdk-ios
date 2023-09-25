//
//  SegmentationProcessorPort.swift
//  
//
//  Created by Devin McKaskle on 9/25/23.
//


// You cannot mix and match Objective-C and Swift files in a package.
// I am porting these Objective-C types over to Swift language so that
// the package will compile.


public protocol SegmentationProcessor {

    
    func initialize(_ height: Int, width: Int, channels: Int) -> Bool

    
    func predict() -> Bool

    
    func getModelState() -> Int

    
    func getInputBuffer() -> UnsafeMutablePointer<UInt8>

    
    func getOutputBuffer() -> UnsafeMutablePointer<UInt8>
}
