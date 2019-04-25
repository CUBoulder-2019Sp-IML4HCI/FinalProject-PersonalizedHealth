### Week 9 (3/10 - 3/16) - Concept:
  - All:
    - Draft and finalize project proposal
    - Compound realistic goals with team
    - Talk with class and other groups; Feedback analysis
    - Storyboarding
    - Tried FitBit API, switched to iOS based on the feedback received and because FitBit only offered offline data

 ### Week 10 (3/17 - 3/23) - Planning:
  - [Personalized Health - Week 10 Video update](https://youtu.be/LEdRSpescg0)
  - Robert Renecker ([@robertrenecker](https://github.com/robertrenecker))
    - Download software needed
    - Plan out tools needed and find other similar projects done for reference.
    - Boiler Plate application written in Swift. Authorizes users on watchOS/iOS to let App use HealthKit. ([link to iRun](https://github.com/CUBoulder-2019Sp-IML4HCI/FinalProject-PersonalizedHealth/tree/master/iRun))
    - Research of Swift, Xcode, HealthKit API (tutorials + couple hours of reading material)
    - Youtube segment

  - Jacob Munoz ([@jamu0075](https://github.com/jamu0075))
    - Explored UI design tools (Sketch, Adobe XD, and Figma) and decided on Figma for it's ease of use without loss of capabilities
    - Discussed with Robert and Akshit the architecture of our project to better understand the deisgn capabilities of iOS development
    - Further researched iOS UI design through Apple's direct guidelines ([link](https://developer.apple.com/design/human-interface-guidelines/ios/overview/themes/))

  - Akshit Arora ([@aroraakshit](http://github.com/aroraakshit))
    - Completed Udacity course on iOS dev. Built a boilerplate app to understand iOS application lifecycle ([PitchPerfect branch - link](https://github.com/CUBoulder-2019Sp-IML4HCI/FinalProject-PersonalizedHealth/tree/pitchPerfect/pitchPerfect))
    - Studied architectures of sample projects on GitHub that used HealthKit to design an architecture for our app. ([Vimo HeartRate](https://github.com/CUBoulder-2019Sp-IML4HCI/FinalProject-PersonalizedHealth/tree/sampleWatchOS/watchOS-3-heartrate), [Diabetes Monitoring Assist](https://github.com/wytesk133/diabetes-monitoring-assist), [Aima](https://github.com/leonidprovorov/aima))
    - Finalized an architecture where the views for iOS app and WatchOS app are separate, and the logic to control the views (aka. model) for both the apps is separate
    - Finalized versions for XCode, iOS, WatchOS, Swift to avoid dev version conflicts

### Week 11 (3/24 - 3/30) - Spring Break

### Week 12 (3/31 - 4/6) - Design & Development:
- [Personalized Health - Week 12 Video update](https://youtu.be/pEmbwJ8PBj8)
- Robert Renecker ([@robertrenecker](https://github.com/robertrenecker))
  - Implemented the iOS application. Configured persistence of data that the user will submit on their phone. Helped take from the mock-ups to the design table in Xcode to connect these features to the design we are moving towards. Put together youtube video.

- Akshit Arora ([@aroraakshit](http://github.com/aroraakshit))
  - Explored CreateML and CoreML tutorials to understand workflows for ML in iOS development. To check whether online learning is possible or not. ([Better Rest branch - link](https://github.com/CUBoulder-2019Sp-IML4HCI/FinalProject-PersonalizedHealth/tree/createML), [Tutorial 1](https://www.youtube.com/watch?v=x9_BG2q7XYw), [Tutorial 2](https://www.youtube.com/watch?v=T4t73CXB7CU))
  - Drafted an architecture for ML models based on couch to 5k plan.

- Jacob Munoz ([@jamu0075](https://github.com/jamu0075))
  - Implemented more UX using figma to provide the key features of the application. The [mock-up](https://www.figma.com/proto/DUEEdmnHawuhMYVCu4EsruqB/Personalized-Health?node-id=1%3A2&scaling=scale-down) is intended to demo the applications interactions without a final GUI to ensure it is intuitive.

### Week 13 (4/7 - 4/13) - Design & Development:
- [Personalized Health - Week 13 Video update](https://youtu.be/XtAauaUkJPM)

- Akshit Arora ([@aroraakshit](http://github.com/aroraakshit))
  - Created first draft of our ML Model and coded a script using Apple's [CreateML](https://developer.apple.com/documentation/createml) to create a .mlmodel file.
  - Integrated the first iteration of ML model into iRun basic interface using a pre-trained model file (.mlmodel) through Apple's [CoreML](https://developer.apple.com/documentation/coreml).
  - Identified more features that can be used and explored options to have the model end-user trainable.

- Robert Renecker ([@robertrenecker](https://github.com/robertrenecker))
  - Iterated over UI. Adapted different Swift projects to use in alignment of our goal and UI design.
  - Incorporated machine learning model into iOS application that we will be using with the user.
  - Ran inference on model to test UI compatibility with feature output data.
  - Found / researched libraries for visualization methods that we want to incorporate into swift.

- Jacob Munoz ([@jamu0075](https://github.com/jamu0075))
  - Researched the Charts library for swift data visualizations to help Robert when we get there.
  - Worked with Robert and Akshit to define a MVP
  - Design a simple first iteration application page for accepting user running input and providing output
  - Began designing an application flow to 'gameify' the stages of running training to keep users motivated


### Week 14 (4/14-4/20) - Quality Checks:
- [Personalized Health - Week 14 Video update](https://youtu.be/2pR7CaKURUU)

- Robert Renecker ([@robertrenecker](https://github.com/robertrenecker))
  - Found available dataset to train model on
  - Cleaned dataset, synchronized with data available from user input in iOS application.
  - Data feature analysis.
  - Incorporated this model in MLKit. Trained given dataset found from Kaggles' Boston Marathon Runner Times 15'16'17 Dataset.
  - Updated UI to be more friendly to users
  - Updated UI to handle navigation from 1 main controller versus decoupled-navigation-controllers.
  - Youtube video
  - Live demo proof of concept

- Akshit Arora ([@aroraakshit](http://github.com/aroraakshit))
  - Finalized ML task: For each workout predict what stage user is in based on time and distance covered while jogging and average heart rate zone in the workout. Checkout [mldev branch](https://github.com/CUBoulder-2019Sp-IML4HCI/FinalProject-PersonalizedHealth/tree/mldev/mldev).
  - Simulated a [dataset](https://github.com/CUBoulder-2019Sp-IML4HCI/FinalProject-PersonalizedHealth/blob/mldev/mldev/simulated.csv) to reflect the above stated ML task based on [Couch to 5k](https://crcphp.arizona.edu/sites/default/files/images/Couch-to-5k%20Running%20Plan.pdf) plan.
  - Trained a [decision tree classifier on sklearn](https://github.com/CUBoulder-2019Sp-IML4HCI/FinalProject-PersonalizedHealth/blob/mldev/mldev/model_prep.ipynb) using 4 features:
    1. Absolute Jogging Time
    2. Fraction Jogging Time (out of walking and jogging combined)
    3. Absolute Jogging Distance Covered
    4. Fraction Jogging Distance Covered (out of walking and jogging combined)
    [Link to Decision Tree picture](https://github.com/CUBoulder-2019Sp-IML4HCI/FinalProject-PersonalizedHealth/blob/mldev/mldev/tree.png).
  - Ran into errors while exporting sklearn's classifier to .mlmodel files using Apple's [CoreMLTools](https://github.com/apple/coremltools). Therefore, wrote a [CreateML script](https://github.com/CUBoulder-2019Sp-IML4HCI/FinalProject-PersonalizedHealth/blob/mldev/mldev/CreateML.playground/Contents.swift) to export the decision tree classifier
  - Worked on a new feature called 'HeartRateZone' as described [here](https://www.healthline.com/health/running-heart-rate#heart-rate-training).

 - Jacob Munoz ([@jamu0075](https://github.com/jamu0075))
    - Designed our new [MVP](https://www.figma.com/file/DUEEdmnHawuhMYVCu4EsruqB/Personalized-Health?node-id=0%3A1)
      - Attempting to keep people engaged with the application by providing multiple indicators of progress(Visualization for total goal progress, user interaction for completing goals, tracking previous goals/miles)
      - Gamify by 'rewarding' the user with progress bars and completion congratulations
    - Tried to replace my old loaner mac with a newer one, the CS/ATLS department only have bricks...
      - CU mac labs only support xcode 8, need 10

### Week 15 (4/21-4/27)
- [Personalized Health - Week 15 Video update](https://youtu.be/U0uOkQCW8_s)

- Robert Renecker ([@robertrenecker](https://github.com/robertrenecker))
  - Updated graphics for UI
  - Enhanced architecture so that we could track health kit variables from past workouts
  - Setup query model to query everytime we need a recommendation the required input variables to push to our models
  - Created and setup feedback page + data flow.
  - Talked with Jacob and Akshit for future UI in the final week. Updating it using libraries found by Jacob should prove much more aesthetically pleasing for the user. 
- Akshit Arora ([@aroraakshit](http://github.com/aroraakshit))
  - Worked on refining app architecture and finalized the interaction design to meet the upcoming deadlines
  - Pivot the app to only reading healthkit datastore instead of writing and reading to it
  - Changed the ML model based on data available from querying Apple's healthkit framework
- Jacob Munoz ([@jamu0075](https://github.com/jamu0075))
  - Worked with Robert and Akshit to determine what UI elements are essential which ones are an unnecessary challenge.
  - Passed off final UX along with helpful iOS UI library's to robert.
  - Final UX agreed upon by the team.
