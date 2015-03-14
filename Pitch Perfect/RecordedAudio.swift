//
//  RecodedAudio.swift
//  Pitch Perfect
//
//  Created by Boris Alexis Gonzalez Macias on 3/13/15.
//  Copyright (c) 2015 PropiedadFacil. All rights reserved.
//

import Foundation

class RecordedAudio: NSObject{
    var filePathUrl: NSURL
    var title: String
    init(title : String,filePathUrl : NSURL){
        self.title = title
        self.filePathUrl = filePathUrl
    }
}