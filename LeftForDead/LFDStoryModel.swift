//
//  LFDStoryModel.swift
//  LeftForDead
//
//  Created by Charlie Morris on 23/02/2016.
//  Copyright © 2016 Mind Fund Studio. All rights reserved.
//

enum Story {
    case Beginning, Ch1RouteA, Ch1RouteAA, Ch1RouteAAA, Ch1RouteAAB, Ch1RouteAB, Ch1RouteB, Ch1RouteBA, Ch1RouteBAA, Ch1RouteBAB, Ch1RouteBB
    
    var storyText: [Sentence] {
        switch self{
        case .Beginning:
            return [
                Sentence(text: "You are at the bottom of an ocean of darkness.", delayInSeconds: 3),
                Sentence(text: "Down here in the dark, you see the flashes again. You can smell the smoke.", delayInSeconds: 4),
                Sentence(text: "You can hear the screams.", delayInSeconds: 3),
                Sentence(text: "The faces of the other villagers appear before you. They swim around you in the dark. Their lips are moving, but they make no sound.", delayInSeconds: 5),
                Sentence(text: "Even down here in the dark, you know they are dead.", delayInSeconds: 3),
                Sentence(text: "The raiders came through your village, and they leave nobody alive.", delayInSeconds: 3),
                Sentence(text: "This must be what it feels like to be dead.", delayInSeconds: 5),
                Sentence(text: "The faces swim closer. Here are your friends and family. You can hear them now, soft voices in the void.", delayInSeconds: 5),
                Sentence(text: "Come back. Don’t give up.", delayInSeconds: 3),
                Sentence(text: "Come back.", delayInSeconds: 3),
                Sentence(text: "You wake.", delayInSeconds: 3),
                Sentence(text: "You are on your back in the long grass, staring up at a sky stained with smoke. You are cold and wet, but it has never felt so good to be alive.", delayInSeconds: 6),
                Sentence(text: "You sit up. The long grass has hidden you well. In the distance you see the smouldering remains of your village.", delayInSeconds: 5),
                Sentence(text: "You remember running breathlessly through fields, raiders on horseback close in pursuit.", delayInSeconds: 3),
                Sentence(text: "You lost your footing on the wet ground. You went down. Hit your head.", delayInSeconds: 3),
                Sentence(text: "Now you touch the back of your head. It throbs.", delayInSeconds: 3),
                Sentence(text: "You look at the flattened grass around you. You are sitting at the bottom of a slope.", delayInSeconds: 3),
                Sentence(text: "You must slipped, knocked yourself out cold, and slithered down into this ditch.", delayInSeconds: 3),
                Sentence(text: "A great thirst comes over you. Further down the slope you can hear the river where you could slake it.", delayInSeconds: 5),
                Sentence(text: "Perhaps, though, you ought to head back to the village.",
                    delayInSeconds: 3,
                    specialAttribute: "last sentence",
                    decisionAText: "Head for the river",
                    decisionBText: "Go back to the village",
                    decisionARoute: .Ch1RouteA,
                    decisionBRoute: .Ch1RouteB
                )
            ]
       
        case .Ch1RouteA:
            return [
                Sentence(text: "On weary legs you trudge down the slope towards the river.", delayInSeconds: 3),
                Sentence(text: "At least once you’ve had a drink you’ll be able to think about things more clearly and decide what to do next.", delayInSeconds: 5),
                Sentence(text: "The slope gets steeper as you approach the river. You hang on to the slender trunks of trees on the bank as you clamber down.", delayInSeconds: 5),
                Sentence(text: "You splash into the shallow water. Its icy bite reinvigorates you.", delayInSeconds: 3),
                Sentence(text: "You cup the clear water into your hands and drink deeply several times. You feel replenished.", delayInSeconds: 3),
                Sentence(text: "Then you see a flash of silver.", delayInSeconds: 3),
                Sentence(text: "A fish.", delayInSeconds: 3),
                Sentence(text: "Seeing it makes you realise how hungry you are. You don’t have any means to make a fire, but you could eat a fish raw if it was that fresh.", delayInSeconds: 7),
                Sentence(text: "Still alive, in fact.", delayInSeconds: 3),
                Sentence(text: "The nourishment might do you good for whatever lies ahead. On the other hand, fish can be tricky to catch.", delayInSeconds: 4),
                Sentence(text: "Maybe you ought to head back to the village now.",
                    delayInSeconds: 3,
                    specialAttribute: "last sentence",
                    decisionAText: "Try to catch a fish",
                    decisionBText: "Head back to the village",
                    decisionARoute: .Ch1RouteAA,
                    decisionBRoute: .Ch1RouteAB
                    )
            ]
        
        case .Ch1RouteAA:
            return [
                Sentence(text: "You stand facing against the flow of the river, staying alert for more silvery flashes.", delayInSeconds: 5),
                Sentence(text: "You see one. You plunge your hands in.", delayInSeconds: 3),
                Sentence(text: "Too slow. Too slow by far.", delayInSeconds: 3),
                Sentence(text: "You wait again.", delayInSeconds: 3),
                Sentence(text: "Another silver flash. Your hands go in again.", delayInSeconds: 3),
                Sentence(text: "Missed.", delayInSeconds: 3),
                Sentence(text: "This could take long than expected. Your stomach growls with hunger - or is it the anxiety you have to get back to your burning home?",
                    delayInSeconds: 3,
                    specialAttribute: "last sentence",
                    decisionAText: "Get back to the village. Now.",
                    decisionBText: "Keep trying for a fish",
                    decisionARoute: .Ch1RouteAAA,
                    decisionBRoute: .Ch1RouteAAB
                )
            ]
        
        case .Ch1RouteAAA:
            return [
                Sentence(text: "There are more important things to do right now than waste your time trying to achieve the impossible.", delayInSeconds: 5),
                Sentence(text: "You climb back up the bank and head towards the plume of smoke in the distance.", delayInSeconds: 3),
                Sentence(text: "You pass the spot where you regained consciousness.",
                    delayInSeconds: 3,
                    specialAttribute: "last sentence",
                    decisionAText: "NO CHOICE",
                    decisionBText: "NO CHOICE",
                    decisionARoute: .Ch1RouteB,
                    decisionBRoute: .Ch1RouteB
                )
            ]
        
        case .Ch1RouteAAB:
            return [
                Sentence(text: "The minutes pass, and so do the fish, slipping easily between your hands. If only you had a net or rod of some kind.", delayInSeconds: 5),
                Sentence(text: "Your feet are beginning to feel numb in the icy water. This can’t be good for you.", delayInSeconds: 4),
                Sentence(text: "One more attempt, and then it’s time to give up and head -", delayInSeconds: 3),
                Sentence(text: "GOT ONE!", delayInSeconds: 3),
                Sentence(text: "You’re so surprised, you nearly let it slip out of your grasp. A wriggling fish, glimmering in the sunlight.", delayInSeconds: 6),
                Sentence(text: "You bite into it while it twists and turns.", delayInSeconds: 3),
                Sentence(text: "It soon stops.", delayInSeconds: 3),
                Sentence(text: "You gobble down the cold, raw flesh.", delayInSeconds: 3),
                Sentence(text: "It’s not the most delicious meal you’ve ever eaten, but you feel better for it.", delayInSeconds: 3),
                Sentence(text: "That extra bit of nourishment might just mean the difference between life and death.", delayInSeconds: 4),
                Sentence(text: "Satisfied, you clamber back up the bank and start to head back to the village.", delayInSeconds: 4),
                Sentence(text: "You pass the spot where you regained consciousness. The thick column of smoke is still rising from the village a short way away.",
                    delayInSeconds: 5,
                    specialAttribute: "last sentence",
                    decisionAText: "NO CHOICE",
                    decisionBText: "NO CHOICE",
                    decisionARoute: .Ch1RouteB,
                    decisionBRoute: .Ch1RouteB
                )
            ]
            
        case .Ch1RouteAB:
            return [
                Sentence(text: "You turn around and climb back up the bank. There are more important things on your mind right now than eating.", delayInSeconds: 5),
                Sentence(text: "The fact that your entire village has almost certainly been completely wiped out by the Raiders, for one.", delayInSeconds: 5),
                Sentence(text: "You walk towards the column of smoke rising from the village. You pass the spot where you regained consciousness.",
                    delayInSeconds: 5,
                    specialAttribute: "last sentence",
                    decisionAText: "NO CHOICE",
                    decisionBText: "NO CHOICE",
                    decisionARoute: .Ch1RouteB,
                    decisionBRoute: .Ch1RouteB
                )
            ]
            
        case .Ch1RouteB:
            return [
                Sentence(text: "You head across the grassy plaing towards the village. Fear envelops you in a web of darkness. Is it possible that anybody could be left alive?", delayInSeconds: 7),
                Sentence(text: "What about your family? Your friends?", delayInSeconds: 3),
                Sentence(text: "Of course, you had heard the stories of the Raiders and what they did to other villages. But a part of you always believed the stories were exaggerated.", delayInSeconds: 7),
                Sentence(text: "Images of the carnage and destruction flash back in your mind. Children screaming. Homes burning.", delayInSeconds: 4),
                Sentence(text: "Raiders on horseback cutting down everyone and everything in their path.", delayInSeconds: 3),
                Sentence(text: "You quicken your pace, eager to get back to your home.", delayInSeconds: 3),
                Sentence(text: "A moment later you freeze.", delayInSeconds: 3),
                Sentence(text: "There is a dark shape heading towards you through the grass.", delayInSeconds: 3),
                Sentence(text: "As it gets closer, you can see it’s a man on horseback, but you can’t make out what he looks like.", delayInSeconds: 4),
                Sentence(text: "Your first instinct is to hide. What if it’s another one of the Raiders?", delayInSeconds: 4),
                Sentence(text: "Then another thought occurs to you. What if it’s somebody from the village? Maybe they are looking for survivors.", delayInSeconds: 5),
                Sentence(text: "Maybe they’ve even sent out a search party for you.", delayInSeconds: 3),
                Sentence(text: "You consider your options.",
                    delayInSeconds: 3,
                    specialAttribute: "last sentence",
                    decisionAText: "Call and wave to the rider",
                    decisionBText: "Duck and hide in the long grass",
                    decisionARoute: .Ch1RouteBA,
                    decisionBRoute: .Ch1RouteBB
                )
            ]
        
        case .Ch1RouteBA:
            return [
                Sentence(text: "You wave your arms. You shout. ‘Hello!’ You call. ‘Over here! Help!’", delayInSeconds: 4),
                Sentence(text: "The rider slows down. Then he looks towards you and changes course for your direction.", delayInSeconds: 4),
                Sentence(text: "He is getting closer now.", delayInSeconds: 3),
                Sentence(text: "Closer…", delayInSeconds: 3),
                Sentence(text: "Close enough for you to see the bloodstains on his clothing…", delayInSeconds: 3),
                Sentence(text: "Close enough for you to see the curved blade of the Raiders hanging at his side…", delayInSeconds: 3),
                Sentence(text: "His horse picks up speed as he bears down on you.", delayInSeconds: 3),
                Sentence(text: "If you run now, you might be able to get away. But can you outrun a man on horseback?", delayInSeconds: 3),
                Sentence(text: "Maybe it would be better to try and plead with him. But then again, Raiders aren’t known for their empathy.",
                    delayInSeconds: 4,
                    specialAttribute: "last sentence",
                    decisionAText: "Try and plead with him",
                    decisionBText: "Run!",
                    decisionARoute: .Ch1RouteBAA,
                    decisionBRoute: .Ch1RouteBAB
                )
            ]
        
        case .Ch1RouteBAA:
            return [
                Sentence(text: "You hold your hands up in a gesture of submission.", delayInSeconds: 3),
                Sentence(text: "‘Please,’ you cry. ‘I’m only young.’", delayInSeconds: 3),
                Sentence(text: "The Raider bears down on you.", delayInSeconds: 3),
                Sentence(text: "As he reaches you, you see the burning hatred in his eyes.", delayInSeconds: 3),
                Sentence(text: "It isn’t hatred. Hatred needs a cause.", delayInSeconds: 3),
                Sentence(text: "The burning in his eyes is madness.", delayInSeconds: 3),
                Sentence(text: "It is the burning of pure evil.", delayInSeconds: 3),
                Sentence(text: "His horse pounds towards you and he raises his curved blade.", delayInSeconds: 3),
                Sentence(text: "The last thing you see is the flash of steel.", delayInSeconds: 3),
                Sentence(text: "GAME OVER",
                    delayInSeconds: 3,
                    specialAttribute: "last sentence",
                    decisionAText: "GAME OVER",
                    decisionBText: "RESTART",
                    decisionARoute: .Beginning,
                    decisionBRoute: .Beginning
                )
            ]
            
        case .Ch1RouteBAB:
            return [
                Sentence(text: "You turn, and you run.", delayInSeconds: 3),
                Sentence(text: "You run as fast as you can.", delayInSeconds: 3),
                Sentence(text: "The roar of hooves follows you.", delayInSeconds: 3),
                Sentence(text: "What made you think you could outrun a Raider on horseback?", delayInSeconds: 3),
                Sentence(text: "There is a thud in your back. The next moment, your chest bursts into a silver and red bloom.", delayInSeconds: 4),
                Sentence(text: "The tip of a spear is sticking through your chest.", delayInSeconds: 3),
                Sentence(text: "You sink to your knees in the grass.", delayInSeconds: 3),
                Sentence(text: "At least you don’t see the Raider descend on you with his curved silver blade.", delayInSeconds: 3),
                Sentence(text: "Instead you look up at the sky, and the blood-red clouds are the last thing you see.", delayInSeconds: 3),
                Sentence(text: "GAME OVER",
                    delayInSeconds: 3,
                    specialAttribute: "last sentence",
                    decisionAText: "GAME OVER",
                    decisionBText: "RESTART",
                    decisionARoute: .Beginning,
                    decisionBRoute: .Beginning
                )
            ]
            
        case .Ch1RouteBB:
            return [
                Sentence(text: "You drop to your knees and press yourself flat against the ground.", delayInSeconds: 4),
                Sentence(text: "The pounding hooves of the Raider’s horse grow louder as he approaches.", delayInSeconds: 3),
                Sentence(text: "He is right on top of you. He’ll see you for sure -", delayInSeconds: 3),
                Sentence(text: "And then the horse and the Raider pass, and you hear them galloping away into the distance.", delayInSeconds: 5),
                Sentence(text: "You stay crouched for a good fifteen minutes more, just in case the Raider is bluffing, and you’re still being watched.", delayInSeconds: 6),
                Sentence(text: "Deep down, though, a part of you knows that that isn’t the Raiders’ style. If he knew you were there, you’d be dead already. No games.", delayInSeconds: 7),
                Sentence(text: "Slowly you peer above the grassline. You appear to be alone.", delayInSeconds: 3),
                Sentence(text: "You stand up and start heading towards the village.", delayInSeconds: 3),
                Sentence(text: "You guess it will take about ten minutes for you to walk there.", delayInSeconds: 3),
                Sentence(text: "[Ten minute pause]", delayInSeconds: 3),
                Sentence(text: "Finally you arrive at your home.", delayInSeconds: 3),
                Sentence(text: "Or, at least, what’s left of it.", delayInSeconds: 3),
                Sentence(text: "The houses are in ruins. Roofs smoulder. Bodies lie in the streets.", delayInSeconds: 3),
                Sentence(text: "You spot the corpses of your brother and your father outside your house.", delayInSeconds: 4),
                Sentence(text: "You step over them.", delayInSeconds: 3),
                Sentence(text: "Your mother is inside.", delayInSeconds: 3),
                Sentence(text: "They died protecting here.", delayInSeconds: 3),
                Sentence(text: "But it was no use.", delayInSeconds: 3),
                Sentence(text: "They found her in here.", delayInSeconds: 3),
                Sentence(text: "Nobody escaped.", delayInSeconds: 3),
                Sentence(text: "In a daze you walk through the village, but even through your shock and your sadness and your pain you sense a plan forming.", delayInSeconds: 5),
                Sentence(text: "Already the anguish is fading away, dying, and it is like a part of your soul dying - not even a part, maybe more than a part, maybe the whole thing.", delayInSeconds: 7),
                Sentence(text: "By nightfall you feel cold and hard, like steel.", delayInSeconds: 3),
                Sentence(text: "You are strong. You are resolute.", delayInSeconds: 3),
                Sentence(text: "You have gathered what food and weapons you can.", delayInSeconds: 3),
                Sentence(text: "Alone and on foot, you set out to the south, to cross the Ragged Mountains.", delayInSeconds: 3),
                Sentence(text: "Towards the home of the Raiders.", delayInSeconds: 3),
                Sentence(text: "It’s a long journey, and there’s no guarantee you will survive. But if you do, you will be the first ten-year-old ever to have done so.",
                    delayInSeconds: 5,
                    specialAttribute: "last sentence",
                    decisionAText: "END OF STORY",
                    decisionBText: "RESTART",
                    decisionARoute: .Beginning,
                    decisionBRoute: .Beginning
                )
            ]
        }
    }
    
    var backgroundColor: String {
        switch self{
        case .Beginning:
            return "#140074"
            
        case .Ch1RouteA:
            return "#2C00FF"
            
        case .Ch1RouteAA:
            return "#836AFF"
            
        case .Ch1RouteAAA:
            return "#9B9B9B"
            
        case .Ch1RouteAAB:
            return "#F8FF83"
            
        case .Ch1RouteAB:
            return "#9B9B9B"
            
        case .Ch1RouteB:
            return "#006F10"
            
        case .Ch1RouteBA:
            return "#6F3B00"
            
        case .Ch1RouteBAA:
            return "#B80000"
            
        case .Ch1RouteBAB:
            return "#B80000"
            
        case .Ch1RouteBB:
            return "#FFFFFF"
        }
    }
}