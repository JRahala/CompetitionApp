//
//  APIController.swift
//  CompetitionApp
//
//  Created by Rahala, Jasamrit (Coll) on 18/06/2021.
//

import Foundation

let api_url: String = "https://api.dictionaryapi.dev/api/v2/entries/en_GB/"

func requestDefinition(from url: String, callback: @escaping (WordResponse) -> ()){
    let url_string = URL(string: url)!
    let task = URLSession.shared.dataTask(with: url_string, completionHandler: { (data: Data?, url_response: URLResponse?, error: Error?) in
        // check that we actually have any data
        guard let data = data, error == nil else{
            print("Something went wrong!")
            return
        }
        var result: WordResponse?
        do{
            result = try JSONDecoder().decode(WordResponse.self, from: data)
        }
        catch{
            print("Could not convert response to definition")
        }
        guard let json = result else{
            return
        }
        
        DispatchQueue.main.async {
            callback(json)
        }
    })
    task.resume()
}

/*
 Example response
 [
    {
      "word": "hello",
      "phonetics": [
        {
          "text": "/həˈloʊ/",
          "audio": "https://lex-audio.useremarkable.com/mp3/hello_us_1_rr.mp3"
        },
        {
          "text": "/hɛˈloʊ/",
          "audio": "https://lex-audio.useremarkable.com/mp3/hello_us_2_rr.mp3"
        }
      ],
      "meanings": [
        {
          "partOfSpeech": "exclamation",
          "definitions": [
            {
              "definition": "Used as a greeting or to begin a phone conversation.",
              "example": "hello there, Katie!"
            }
          ]
        },
        {
          "partOfSpeech": "noun",
          "definitions": [
            {
              "definition": "An utterance of “hello”; a greeting.",
              "example": "she was getting polite nods and hellos from people",
              "synonyms": [
                "greeting",
                "welcome",
                "salutation",
                "saluting",
                "hailing",
                "address",
                "hello",
                "hallo"
              ]
            }
          ]
        },
        {
          "partOfSpeech": "intransitive verb",
          "definitions": [
            {
              "definition": "Say or shout “hello”; greet someone.",
              "example": "I pressed the phone button and helloed"
            }
          ]
        }
      ]
    }
  ]
 */

struct WordResponse: Codable{
    var meanings: [Meaning]
}

struct Meaning: Codable{
    var partOfSpeech: String
    var definitions: Definition
}

struct Definition: Codable{
    var definition: String
    var example: String
}
