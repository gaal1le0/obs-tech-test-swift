//
//  Molecules.swift
//  
//
//  Created by Emanuel Martinez on 8/6/22.
//

import Foundation

public enum Molecules {
    
    public static var Spinner: Loader {
        return Loader()
    }
    
    public enum Views {
        public static var Error: ErrorView {
            return ErrorView()
        }
        
        public static var ProfileView: Profile {
            return Profile()
        }
        
        public static var Medal: MedalCounter {
            return MedalCounter()
        }
        
    }
    
    public enum Cells {
        public static var Game: GameCell {
            return GameCell()
        }
        
        public static var Attlete: AttleteCell {
            return AttleteCell()
        }
        
        public static var Basic: BasicCell {
            return BasicCell()
        }
        
        public static var Medal: MedalsCell {
            return MedalsCell()
        }
        
        public static var Description: DescriptionCell {
            return DescriptionCell()
        }
        
        public static var Photo: PhotoCell {
            return PhotoCell()
        }
    }
    
}
