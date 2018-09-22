//
//  Film.swift
//  Film
//
//  Created by Dương Hoàng on 9/22/18.
//  Copyright © 2018 henry. All rights reserved.
//

import Foundation

class Film{
    var Title: String?
    var Description: String?
    var LogoPath: String?
    var BackDropPath: String?
    
    init(title: String, description: String, logoPath: String, backDropPath: String) {
        self.Title = title
        self.Description = description
        self.LogoPath = logoPath
        self.BackDropPath = backDropPath
    }
    
    init() {
        
    }
    
    func getNowPlayingFilms() -> [Film] {
        var films: [Film] = []
        films.append(Film(title: "The Predator",description: "From the outer reaches of space to the small-town streets of suburbia, the hunt comes home. Now, the universe’s most lethal hunters are stronger, smarter and deadlier than ever before, having genetically upgraded themselves with DNA from other species. When a young boy accidentally triggers their return to Earth, only a ragtag crew of ex-soldiers and a disgruntled science teacher can prevent the end of the human race.", logoPath: "/gjAFM4xhA5vyLxxKMz38ujlUfDL.jpg", backDropPath: "/f4E0ocYeToEuXvczZv6QArrMDJ.jpg"))
        films.append(Film(title: "The Nun",description: "When a young nun at a cloistered abbey in Romania takes her own life, a priest with a haunted past and a novitiate on the threshold of her final vows are sent by the Vatican to investigate. Together they uncover the order’s unholy secret. Risking not only their lives but their faith and their very souls, they confront a malevolent force in the form of the same demonic nun that first terrorized audiences in “The Conjuring 2,” as the abbey becomes a horrific battleground between the living and the damned.", logoPath: "/x1txcDXkcM65gl7w20PwYSxAYah.jpg", backDropPath: "/fgsHxz21B27hOOqQBiw9L6yWcM7.jpg"))
        films.append(Film(title: "The First Purge",description: "A deep sea submersible pilot revisits his past fears in the Mariana Trench, and accidentally unleashes the seventy foot ancestor of the Great White Shark believed to be extinct.", logoPath: "/dscvG9AWLOzxedHcXN7QguJRhsP.jpg", backDropPath: "/r4clWIxKeWoqrHspQP0XunuUmB7.jpg"))
        films.append(Film(title: "The Seven Deadly Sins: Prisoners of the Sky",description: "The Seven Deadly Sins travel to a remote land in search of the phantom ingredient \"sky fish.\" Meliodas and Hawk end up at a \"Sky Palace\" that exists above the clouds, where all the residents have wings. Meliodas is mistaken for a boy who committed a crime and is thrown in prison. Meanwhile, the residents are preparing a ceremony for defense against a ferocious beast that awakens once every 3,000 years. But the Six Knights of Black, a Demon Clan army, arrives and removes the seal on the beast in order to threaten the lives of the residents of Sky Palace. Meliodas and his allies meet the Six Knights of Black in battle.", logoPath: "/uKwOX7MtKlAaGeCQe6c4jc1vZpj.jpg", backDropPath: "/uKwOX7MtKlAaGeCQe6c4jc1vZpj.jpg"))
        films.append(Film(title: "Hereditary",description: "When Ellen, the matriarch of the Graham family, passes away, her daughter's family begins to unravel cryptic and increasingly terrifying secrets about their ancestry.", logoPath: "/dscvG9AWLOzxedHcXN7QguJRhsP.jpg", backDropPath: "/pS9Aub8MPyQbENblGD8mHeaqMuv.jpg"))
        films.append(Film(title: "Mandy",description: "The Shadow Mountains, 1983. Red and Mandy lead a loving and peaceful existence; but when their pine-scented haven is savagely destroyed, Red is catapulted into a phantasmagoric journey filled with bloody vengeance and laced with fire.", logoPath: "/m0yf7J7HsKeK6E81SMRcX8vx6mH.jpg", backDropPath: "/tNa19CK0CQZl5rxZ35QRdKAT2s0.jpg"))
        films.append(Film(title: "Ant-Man and the Wasp",description: "As Scott Lang awaits expiration of his term of house detention, Hope van Dyne and Dr. Hank Pym involve him in a scheme to rescue Mrs. van Dyne from the micro-universe into which she has fallen, while two groups of schemers converge on them with intentions of stealing Dr. Pym's inventions.", logoPath: "/rv1AWImgx386ULjcf62VYaW8zSt.jpg", backDropPath: "/6P3c80EOm7BodndGBUAJHHsHKrp.jpg"))
        films.append(Film(title: "Smallfoot",description: "A Yeti is convinced that the elusive creatures known as \"humans\" really do exist.", logoPath: "/4nKoB6wMVXfsYgRZK5lHZ5VMQ6J.jpg", backDropPath: "/7t88SoT3Dd8DhGnQuVoSbMNUl3W.jpg"))
        films.append(Film(title: "Skyscraper",description: "Framed and on the run, a former FBI agent must save his family from a blazing fire in the world's tallest building.", logoPath: "/5LYSsOPzuP13201qSzMjNxi8FxN.jpg", backDropPath: ""))
        films.append(Film(title: "Assassination Nation",description: "High school senior Lily and her group of friends live in a haze of texts, posts, selfies and chats just like the rest of the world. So, when an anonymous hacker starts posting details from the private lives of everyone in their small town, the result is absolute madness leaving Lily and her friends questioning whether they'll live through the night.", logoPath: "/m39ICHMpFXJqYO8LcR3U39HxjuC.jpg", backDropPath: "/zYxQIKKyyuYpLavX8AhTDDusBDH.jpg"))
        films.append(Film(title: "Adrift",description: "A true story of survival, as a young couple's chance encounter leads them first to love, and then on the adventure of a lifetime as they face one of the most catastrophic hurricanes in recorded history.", logoPath: "/5gLDeADaETvwQlQow5szlyuhLbj.jpg", backDropPath: "/64jAqTJvrzEwncD3ARZdqYLcqbc.jpg"))
        films.append(Film(title: "The Equalizer 2",description: "Robert McCall returns to deliver his special brand of vigilante justice -- but how far will he go when it's someone he loves?", logoPath: "/cQvc9N6JiMVKqol3wcYrGshsIdZ.jpg", backDropPath: "/z6KLDE72SxE1A8JcJTmmnWArOvR.jpg"))
        films.append(Film(title: "Beyond The Sky",description: "A documentary filmmaker travels to a UFO convention in New Mexico where he meets a local artist with a dark secret. As they follow a trail of clues they discover disturbing sightings and question all they believe when they become immersed in the enigmatic culture of the Pueblo Indians.", logoPath: "/baqVcixXztFm5u3dZLUPhm8ZIxJ.jpg", backDropPath: "/hmqS2ZihJZNBVlOWeFIPUTEJUuX.jpg"))
        films.append(Film(title: "A Simple Favor",description: "Mommy vlogger Stephanie joins her best friend Emily's husband, Sean, to investigate her sudden disappearance from their small town.", logoPath: "/aIYsjQM0piKc0ibPBCTWv3sqshj.jpg", backDropPath: "/xXGNyEG2v48q0bVR4AH4Vca2yvy.jpg"))
        films.append(Film(title: "Upgrade",description: "A brutal mugging leaves Grey Trace paralyzed in the hospital and his beloved wife dead. A billionaire inventor soon offers Trace a cure — an artificial intelligence implant called STEM that will enhance his body. Now able to walk, Grey finds that he also has superhuman strength and agility — skills he uses to seek revenge against the thugs who destroyed his life.", logoPath: "/8fDtXi6gVw8WUMWGT9XFz7YwkuE.jpg", backDropPath: "/q9HocL5f8WwPldwpvmpk8ZaNZkC.jpg"))
        
        return films
    }
    
    func getUpcomingFilms() -> [Film] {
        var films: [Film] = []
        films.append(Film(title: "Predator",description: "", logoPath: "", backDropPath: ""))
        films.append(Film(title: "Predator",description: "", logoPath: "", backDropPath: ""))
        films.append(Film(title: "Predator",description: "", logoPath: "", backDropPath: ""))
        films.append(Film(title: "Predator",description: "", logoPath: "", backDropPath: ""))
        films.append(Film(title: "Predator",description: "", logoPath: "", backDropPath: ""))
        films.append(Film(title: "Predator",description: "", logoPath: "", backDropPath: ""))
        films.append(Film(title: "Predator",description: "", logoPath: "", backDropPath: ""))
        films.append(Film(title: "Predator",description: "", logoPath: "", backDropPath: ""))
        films.append(Film(title: "Predator",description: "", logoPath: "", backDropPath: ""))
        films.append(Film(title: "Predator",description: "", logoPath: "", backDropPath: ""))
        films.append(Film(title: "Predator",description: "", logoPath: "", backDropPath: ""))
        films.append(Film(title: "Predator",description: "", logoPath: "", backDropPath: ""))
        films.append(Film(title: "Predator",description: "", logoPath: "", backDropPath: ""))
        films.append(Film(title: "Predator",description: "", logoPath: "", backDropPath: ""))
        films.append(Film(title: "Predator",description: "", logoPath: "", backDropPath: ""))
        films.append(Film(title: "Predator",description: "", logoPath: "", backDropPath: ""))
        films.append(Film(title: "Predator",description: "", logoPath: "", backDropPath: ""))
        films.append(Film(title: "Predator",description: "", logoPath: "", backDropPath: ""))
        films.append(Film(title: "Predator",description: "", logoPath: "", backDropPath: ""))
        films.append(Film(title: "Predator",description: "", logoPath: "", backDropPath: ""))
        return films
    }
    
}
