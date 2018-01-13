//
//  FileManagerHelper.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/13/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit
class FileManagerHelper {
    private init() {}
    static let manager = FileManagerHelper()
    struct FavoriteImage: Codable {
        let city: String
        let url: String
    }
    
    let filePath = "FavoriteImages.plist"
    
    private var favoriteImages = [FavoriteImage]() {
        didSet {
            saveFavoritedImages()
        }
    }
    
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    
    private func dataFilePath(withPathName path: String) -> URL {
        return FileManagerHelper.manager.documentsDirectory().appendingPathComponent(path)
    }
    
    
    func loadFavoriteImages() {
        var data = Data()
        do {
            data = try Data.init(contentsOf: FileManagerHelper.manager.dataFilePath(withPathName: filePath))
        } catch {
            print(error.localizedDescription)
            return
        }
        do {
            favoriteImages = try PropertyListDecoder().decode([FavoriteImage].self, from: data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    func getFavoritedImages() -> [FavoriteImage] {
        return favoriteImages
    }
    
    func saveImage(with imgUrl: String, image: UIImage) -> Bool {
        
        let imageToSave = UIImagePNGRepresentation(image)!
        let imagePath = dataFilePath(withPathName: UUID().description)
        
        
        
        do {
            try imageToSave.write(to: imagePath, options: .atomic)
        } catch {
            print("Error saving image. \(error.localizedDescription)")
            return false
        }
        return true
    }
    
    func getImage(with imgUrl: String) -> UIImage? {
        do {
            let imgPath = dataFilePath(withPathName: "\(imgUrl.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!)")
            let data = try Data(contentsOf: imgPath)
            return UIImage(data: data)
        }
        catch {
            
            return nil
        }
    }

    
    private func saveFavoritedImages() {
        var data = Data()
        
        do {
            data = try PropertyListEncoder().encode(favoriteImages)
        } catch {
            print("Plist encoding error. \(error.localizedDescription)")
            return
        }
        
        do {
            try data.write(to: FileManagerHelper.manager.dataFilePath(withPathName: filePath), options: .atomic)
            
        } catch {
            print("Writing to disk error. \(error.localizedDescription)")
        }
        
    }
    
    func addFavoritedImage(city: String, imageUrl: String, image: UIImage) -> Bool {
        
        if saveImage(with: imageUrl, image: image) {
            let favImage = FavoriteImage(city: city, url: imageUrl)
            favoriteImages.append(favImage)
            return true
        }
        return false
    }
    
    func alreadyFavorited(imgUrl: String) -> Bool {
        
        let indexExist = favoriteImages.index{$0.url == imgUrl}
        if indexExist != nil { return true }
        
        return false
        
    }
    
    func removeFavorite(from index: Int, favorite: FavoriteImage) -> Bool {
        favoriteImages.remove(at: index)
        let url = FileManagerHelper.manager.dataFilePath(withPathName: favorite.url)
        do {
            try FileManager.default.removeItem(at: url)
            return true
        }
        catch {
            print(error.localizedDescription)
            return false
        }
    }
    
    
}
