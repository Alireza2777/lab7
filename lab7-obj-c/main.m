//
//  main.m
//  lab7-obj-c
//
//  Created by Alireza Karimi on 2023-09-12.
//

#import <Foundation/Foundation.h>

@interface NSString (PigLatin)
- (NSString *)stringByPigLatinization;
@end

@implementation NSString (PigLatin)

- (NSString *)stringByPigLatinization {
    // Create a character set for vowels to identify vowels
    NSCharacterSet *vowelsCharacterSet = [NSCharacterSet characterSetWithCharactersInString:@"AEIOUaeiou"];
    
    // Split the input string into words using whitespace as the delimiter
    NSArray *words = [self componentsSeparatedByString:@" "];
    NSMutableArray *pigLatinWords = [NSMutableArray arrayWithCapacity:[words count]];
    
    for (NSString *word in words) {
        NSRange rangeOfConsonants = [word rangeOfCharacterFromSet:vowelsCharacterSet options:NSCaseInsensitiveSearch];
        
        if (rangeOfConsonants.location != NSNotFound) {
            // Move the consonants (if any) to the end of the word
            NSString *prefix = [word substringToIndex:rangeOfConsonants.location];
            NSString *suffix = [word substringFromIndex:rangeOfConsonants.location];
            
            NSString *pigLatinWord = [NSString stringWithFormat:@"%@%@ay", suffix, prefix];
            [pigLatinWords addObject:pigLatinWord];
        } else {
            // If the word contains no vowels, just append "ay"
            [pigLatinWords addObject:[word stringByAppendingString:@"ay"]];
        }
    }
    
    // Join the Pig Latin words with spaces
    NSString *pigLatinString = [pigLatinWords componentsJoinedByString:@" "];
    
    return pigLatinString;
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *inputString = @"Kale Chips";
        NSString *pigLatinString = [inputString stringByPigLatinization];
        NSLog(@"%@", pigLatinString); // Output: Alekay Ipschay
    }
    return 0;
}

