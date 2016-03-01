//
//  LFDStoryModel.swift
//  LeftForDead
//
//  Created by Charlie Morris on 23/02/2016.
//  Copyright © 2016 Mind Fund Studio. All rights reserved.
//

import Foundation

enum Story {
    case Beginning, Ch1RouteA, Ch1RouteAA, Ch1RouteAAA, Ch1RouteAAB, Ch1RouteAB, Ch1RouteB, Ch1RouteBA, Ch1RouteBAA, Ch1RouteBAB, Ch1RouteBB
    
    var storyText: [String] {
        switch self{
        case .Beginning:
            return ["You are at the bottom of an ocean of darkness.",
            "Down here in the dark, you see the flashes again. You can smell the smoke.",
            "You can hear the screams.",
            "The faces of the other villagers appear before you. They swim around you in the dark. Their lips are moving, but they make no sound.",
            "Even down here in the dark, you know they are dead.",
            "The raiders came through your village, and they leave nobody alive.",
            "This must be what it feels like to be dead.",
            "The faces swim closer. Here are your friends and family. You can hear them now, soft voices in the void.",
            "Come back. Don’t give up.",
            "Come back.",
            "You wake.",
            "You are on your back in the long grass, staring up at a sky stained with smoke. You are cold and wet, but it has never felt so good to be alive.",
            "You sit up. The long grass has hidden you well. In the distance you see the smouldering remains of your village.",
            "You remember running breathlessly through fields, raiders on horseback close in pursuit.",
            "You lost your footing on the wet ground. You went down. Hit your head.",
            "Now you touch the back of your head. It throbs.",
            "You look at the flattened grass around you. You are sitting at the bottom of a slope.",
            "You must slipped, knocked yourself out cold, and slithered down into this ditch.",
            "A great thirst comes over you. Further down the slope you can hear the river where you could slake it.",
            "Perhaps, though, you ought to head back to the village."]
       
        case .Ch1RouteA:
            return ["On weary legs you trudge down the slope towards the river.",
            "At least once you’ve had a drink you’ll be able to think about things more clearly and decide what to do next.",
            "The slope gets steeper as you approach the river. You hang on to the slender trunks of trees on the bank as you clamber down.",
            "You splash into the shallow water. Its icy bite reinvigorates you.",
            "You cup the clear water into your hands and drink deeply several times. You feel replenished.",
            "Then you see a flash of silver.",
            "A fish.",
            "Seeing it makes you realise how hungry you are. You don’t have any means to make a fire, but you could eat a fish raw if it was that fresh.",
            "Still alive, in fact.",
            "The nourishment might do you good for whatever lies ahead. On the other hand, fish can be tricky to catch.",
            "Maybe you ought to head back to the village now."]
        
        case .Ch1RouteAA:
            return ["You stand facing against the flow of the river, staying alert for more silvery flashes.",
                "You see one. You plunge your hands in.",
                "Too slow. Too slow by far.",
                "You wait again.",
                "Another silver flash. Your hands go in again.",
                "Missed.",
                "This could take long than expected. Your stomach growls with hunger - or is it the anxiety you have to get back to your burning home?"]
        
        case .Ch1RouteAAA:
            return ["There are more important things to do right now than waste your time trying to achieve the impossible.",
            "You climb back up the bank and head towards the plume of smoke in the distance.",
            "You pass the spot where you regained consciousness."]
        
        case .Ch1RouteAAB:
            return ["The minutes pass, and so do the fish, slipping easily between your hands. If only you had a net or rod of some kind.",
            "Your feet are beginning to feel numb in the icy water. This can’t be good for you.",
            "One more attempt, and then it’s time to give up and head -",
            "GOT ONE!",
            "You’re so surprised, you nearly let it slip out of your grasp. A wriggling fish, glimmering in the sunlight.",
            "You bite into it while it twists and turns.",
            "It soon stops.",
            "You gobble down the cold, raw flesh.",
            "It’s not the most delicious meal you’ve ever eaten, but you feel better for it.",
            "That extra bit of nourishment might just mean the difference between life and death.",
            "Satisfied, you clamber back up the bank and start to head back to the village.",
            "You pass the spot where you regained consciousness. The thick column of smoke is still rising from the village a short way away."]
            
        case .Ch1RouteAB:
            return ["You turn around and climb back up the bank. There are more important things on your mind right now than eating.",
            "The fact that your entire village has almost certainly been completely wiped out by the Raiders, for one.",
            "You walk towards the column of smoke rising from the village. You pass the spot where you regained consciousness."]
            
        case .Ch1RouteB:
            return ["You head across the grassy plaing towards the village. Fear envelops you in a web of darkness. Is it possible that anybody could be left alive?",
            "What about your family? Your friends?",
            "Of course, you had heard the stories of the Raiders and what they did to other villages. But a part of you always believed the stories were exaggerated.",
            "Images of the carnage and destruction flash back in your mind. Children screaming. Homes burning.",
            "Raiders on horseback cutting down everyone and everything in their path.",
            "You quicken your pace, eager to get back to your home.",
            "A moment later you freeze.",
            "There is a dark shape heading towards you through the grass.",
            "As it gets closer, you can see it’s a man on horseback, but you can’t make out what he looks like.",
            "Your first instinct is to hide. What if it’s another one of the Raiders?",
            "Then another thought occurs to you. What if it’s somebody from the village? Maybe they are looking for survivors.",
            "Maybe they’ve even sent out a search party for you.",
            "You consider your options."]
        
        case .Ch1RouteBA:
            return ["You wave your arms. You shout. ‘Hello!’ You call. ‘Over here! Help!’",
            "The rider slows down. Then he looks towards you and changes course for your direction.",
            "He is getting closer now.",
            "Closer…",
            "Close enough for you to see the bloodstains on his clothing…",
            "Close enough for you to see the curved blade of the Raiders hanging at his side…",
            "His horse picks up speed as he bears down on you.",
            "If you run now, you might be able to get away. But can you outrun a man on horseback?",
            "Maybe it would be better to try and plead with him. But then again, Raiders aren’t known for their empathy."]
        
        case .Ch1RouteBAA:
            return ["You hold your hands up in a gesture of submission.",
            "‘Please,’ you cry. ‘I’m only young.’",
            "The Raider bears down on you.",
            "As he reaches you, you see the burning hatred in his eyes.",
            "It isn’t hatred. Hatred needs a cause.",
            "The burning in his eyes is madness.",
            "It is the burning of pure evil.",
            "His horse pounds towards you and he raises his curved blade.",
            "The last thing you see is the flash of steel.",
            "GAME OVER"]
            
        case .Ch1RouteBAB:
            return ["You turn, and you run.",
            "You run as fast as you can.",
            "The roar of hooves follows you.",
            "What made you think you could outrun a Raider on horseback?",
            "There is a thud in your back. The next moment, your chest bursts into a silver and red bloom.",
            "The tip of a spear is sticking through your chest.",
            "You sink to your knees in the grass.",
            "At least you don’t see the Raider descend on you with his curved silver blade.",
            "Instead you look up at the sky, and the blood-red clouds are the last thing you see.",
            "GAME OVER"]
            
        case .Ch1RouteBB:
            return ["You drop to your knees and press yourself flat against the ground.",
            "The pounding hooves of the Raider’s horse grow louder as he approaches.",
            "He is right on top of you. He’ll see you for sure -",
            "And then the horse and the Raider pass, and you hear them galloping away into the distance.",
            "You stay crouched for a good fifteen minutes more, just in case the Raider is bluffing, and you’re still being watched.",
            "Deep down, though, a part of you knows that that isn’t the Raiders’ style. If he knew you were there, you’d be dead already. No games.",
            "Slowly you peer above the grassline. You appear to be alone.",
            "You stand up and start heading towards the village.",
            "You guess it will take about ten minutes for you to walk there.",
            "[Ten minute pause]",
            "Finally you arrive at your home.",
            "Or, at least, what’s left of it.",
            "The houses are in ruins. Roofs smoulder. Bodies lie in the streets.",
            "You spot the corpses of your brother and your father outside your house.",
            "You step over them.",
            "Your mother is inside.",
            "They died protecting here.",
            "But it was no use.",
            "They found her in here.",
            "Nobody escaped.",
            "In a daze you walk through the village, but even through your shock and your sadness and your pain you sense a plan forming.",
            "Already the anguish is fading away, dying, and it is like a part of your soul dying - not even a part, maybe more than a part, maybe the whole thing.",
            "By nightfall you feel cold and hard, like steel.",
            "You are strong. You are resolute.",
            "You have gathered what food and weapons you can.",
            "Alone and on foot, you set out to the south, to cross the Ragged Mountains.",
            "Towards the home of the Raiders.",
            "It’s a long journey, and there’s no guarantee you will survive. But if you do, you will be the first ten-year-old ever to have done so."]
        }
    }
    
    var buttonATitle: String {
        switch self{
        case .Beginning:
            return "Head for the river"
            
        case .Ch1RouteA:
            return "Try to catch a fish"
            
        case .Ch1RouteAA:
            return "Get back to the village. Now."
            
        case .Ch1RouteAAA:
            return "NO CHOICE"
            
        case .Ch1RouteAAB:
            return "NO CHOICE"
            
        case .Ch1RouteAB:
            return "NO CHOICE"
            
        case .Ch1RouteB:
            return "Call and wave to the rider"
            
        case .Ch1RouteBA:
            return "Try and plead with him"
            
        case .Ch1RouteBAA:
            return "GAME OVER"
            
        case .Ch1RouteBAB:
            return "GAME OVER"
            
        case .Ch1RouteBB:
            return "END OF STORY"
        }
    }
    
    var buttonBTitle: String {
        switch self{
        case .Beginning:
            return "Go back to the village"
            
        case .Ch1RouteA:
            return "Head back to the village"
            
        case .Ch1RouteAA:
            return "Keep trying for a fish"
            
        case .Ch1RouteAAA:
            return "NO CHOICE"
            
        case .Ch1RouteAAB:
            return "NO CHOICE"
            
        case .Ch1RouteAB:
            return "NO CHOICE"
            
        case .Ch1RouteB:
            return "Duck and hide in the long grass"
            
        case .Ch1RouteBA:
            return "Run!"
            
        case .Ch1RouteBAA:
            return "GAME OVER"
            
        case .Ch1RouteBAB:
            return "GAME OVER"
            
        case .Ch1RouteBB:
            return "END OF STORY"
        }
    }

}