//
//  Previewable.swift
//  FetchTakeHomeExercise
//
//  Created by Andrew Stamm on 10/16/24.
//

import Foundation

protocol Previewable {
    associatedtype PreviewType: Decodable
    static var preview: PreviewType { get }
}

extension Previewable {
    static var preview: PreviewType {
        return loadPreview(from: String(describing: PreviewType.self))
    }

    static func customPreview(from filename: String) -> PreviewType {
        return loadPreview(from: filename)
    }

    private static func loadPreview(from filename: String) -> PreviewType {
        let url = Bundle.main.url(forResource: filename, withExtension: "json")!
        let data = try! Data(contentsOf: url)
        return try! JSONDecoder().decode(PreviewType.self, from: data)
    }
}
