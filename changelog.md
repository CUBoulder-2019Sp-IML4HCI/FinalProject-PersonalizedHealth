Week 9 (3/10 - 3/16) - Concept:
  - All:
    - Draft and finalize project proposal
    - Compound realistic goals with team
    - Talk with class and other groups; Feedback analysis
    - Storyboarding
    - Tried FitBit API, switched to iOS based on the feedback received and because FitBit only offered offline data

 Week 10 (3/17 - 3/23) - Planning:
  - [Personalized Health - Week 10 Video update](https://youtu.be/LEdRSpescg0)
  - Robert Renecker ([@robertrenecker](https://github.com/robertrenecker))
    - Download software needed
    - Plan out tools needed and find other similar projects done for reference.
    - Boiler Plate application written in Swift. Authorizes users on watchOS/iOS to let App use HealthKit. ([link to iRun](https://github.com/CUBoulder-2019Sp-IML4HCI/FinalProject-PersonalizedHealth/tree/master/iRun))
    - Research of Swift, Xcode, HealthKit API (tutorials + couple hours of reading material)
    - Youtube segment

  - Jacob Munoz ([@jamu0075](https://github.com/jamu0075))
    - Explored UI design tools(Sketch, Adobe XD, and Figma) and decided on Figma for it's ease of use without loss of capabilities
    - Discussed with Robert and Akshit the architecture of our project to better understand the deisgn capabilities of iOS development
    - Further researched iOS UI design through Apple's direct guidelines ([link](https://developer.apple.com/design/human-interface-guidelines/ios/overview/themes/))

  - Akshit Arora ([@aroraakshit](http://github.com/aroraakshit))
    - Completed Udacity course on iOS dev. Built a boilerplate app to understand iOS application lifecycle ([PitchPerfect branch - link](https://github.com/CUBoulder-2019Sp-IML4HCI/FinalProject-PersonalizedHealth/tree/pitchPerfect/pitchPerfect))
    - Studied architectures of sample projects on GitHub that used HealthKit to design an architecture for our app. ([Vimo HeartRate](https://github.com/CUBoulder-2019Sp-IML4HCI/FinalProject-PersonalizedHealth/tree/sampleWatchOS/watchOS-3-heartrate), [Diabetes Monitoring Assist](https://github.com/wytesk133/diabetes-monitoring-assist), [Aima](https://github.com/leonidprovorov/aima))
    - Finalized an architecture where the views for iOS app and WatchOS app are separate, and the logic to control the views (aka. model) for both the apps is separate
    - Finalized versions for XCode, iOS, WatchOS, Swift to avoid dev version conflicts

Week 11 (3/31 - 4/3[6?])
- [Personalized Health - Week 12 Video update](https://youtu.be/pEmbwJ8PBj8)
- Robert Renecker ([@robertrenecker](https://github.com/robertrenecker))
  - Implemented the iOS application. Configured persistence of data that the user will submit on their phone. Helped take from the mock-ups to the design table in Xcode to connect these features to the design we are moving towards. Put together youtube video.
- Akshit Arora ([@aroraakshit](http://github.com/aroraakshit))
  - Explored CreateML and CoreML tutorials to understand workflows for ML in iOS development. To check whether online learning is possible or not. [1](https://www.youtube.com/watch?v=x9_BG2q7XYw), [2](https://www.youtube.com/watch?v=T4t73CXB7CU)
  - Drafted an architecture for ML models based on couch to 5k plan.
- Jacob Munoz ([@jamu0075](https://github.com/jamu0075))
  - Implemented more UX using figma to provide the key features of the application. The [mock-up](https://www.figma.com/proto/DUEEdmnHawuhMYVCu4EsruqB/Personalized-Health?node-id=1%3A2&scaling=scale-down) is intended to demo the applications interactions without a final GUI to ensure it is intuitive.
