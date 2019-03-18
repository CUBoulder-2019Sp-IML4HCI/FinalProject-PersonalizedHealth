
<h1 align="center"> Personalized Health </h1>
<p align="center">
  <img src="objects/images/readme1.jpg" alt="Title-Image" />
</p>

<p align="center">
 <b>Robert Renecker - Jacob Munoz - Akshit Arora</b>
</p>

## The Idea and Mission Statement

The goal for our project is to build a personalized goal application for running. Given a broad spectrum ranging from never-have-run-before to I-run-every-day, a regression model will be able to provide inference to a recommendation that a potential runner should carry out in order to meet a goal. The goals may be weight loss or the ability to run a certain distance. By using this application, hopefully a potential runner will be able to achieve these goals in a way that is personalized to their health and ability.

The problem that we hope to solve is that right now, running for some people is difficult. However, most of the problem is just figuring out a realistic goal that will encourage them to attempt to run. By using this web-app, we hope to give them a realistic goal that may not be too difficult for them to do. Thus, it will encourage them to continue making progress towards a longer-term goal with which they feel proud of achieving.

As a team, we feel that this project is more than feasible given we understand our problem statement and we understand the data we are working with. The scope of our project isn’t too large and it encompasses minimal things which will make it possible to do with the time constraints we’ve been given.

In regards to our machine learning (ML) model, we believe that multiple linear regression will be a good interpreter for recommending goals to a potential runner because there is most likely a linear relationship between various features in ones health and that of their running ability.

The user will input some initial training data(how much are you currently running, age, weight, distance goal, more?) to provide some baseline for running experience. This will give them an initial running goal to attempt. The model will then collect data during the run(distance traveled vs. goal, heart rate, pace, more?) and adjust accordingly. We want our model to be able to adjust itself based on user performance. For example, if the user crushes the first goal given by the app, we want it to adjust and give the user a much more rigorous running plan. If the user struggled to reach the goal or didn’t complete the run, it should adjust accordingly to give a more reasonable goal. Ideally the app would underestimate rather than overestimate the user so as to not demotivate them!

## Challenges

Our biggest challenge right now is understanding the limitations/capabilities of the fitbit to figure out how to get real-time data. Originally we were going to use an apple watch to do that, but quickly learned this would require us to build and iOS exclusive app to stream the data (like here). That doesn’t sound fun. We know it is possible to request messages from fitbit with customizable arguments including what previous data we want(i.e. heart rate from the last 10 minutes.) We want to overcome the challenge of real-time monitoring/analysis by requesting data in close-enough-time. If we can GET streams of data every 30 seconds or so that should be close enough to real time to feed our model to provide the runner real-time feedback(i.e. “Your heart is about to explode, maybe take it down a notch!” or “I don’t think you’re actually running… pick it up!”)

Another challenge we face is quantifying user data into running capabilities and more generally how to quantify running ability as a whole. We will need to do some research to determine the input encoding to our ML model and what specific use-cases to focus on. There seems to be data out there regarding this information so hopefully we can successfully translate that information into an accurate model to build upon. Maybe we could get in touch with one of the many CU running clubs for some insider knowledge.

## The Technologies
- Tensorflow
  - TensorFlow is an open-source python library. It contains tons of different ML APIs that enable a user to use state-of-the-art ML models
  - TensorFlow also provides a variety of solutions to deploy ML into production with its JavaScript API (TFJS), Mobile and IoT solution (TF Lite) and cloud based solutions (TF Extended)

- Flask
  - Flask is a highly scalable micro web-framework available in python. It is extremely well documented and contains tons of examples to give a user all the information needed in order to get a web application up and running.
- Fitbit
  - Only offline health data available
- HealthKit
  - To access vitals in real-time
  - ECG data available in real-time

## Risks of failure

In regards to our ML model, if there is no linear relationship between the features a users health and that of our recommendations, then that will make it so we have to completely re-do our ML approach to find other relationships that may not be linear.

Fitbit is a technology that requires the hardware to be in working order. Like any other, there are things that we cannot control during demo times and during our data gathering and testing phases. We will have to make sure our data looks appropriate for the instance it is associated with.

## Ethical questions

The only ethical question we can see as of right now is our application providing unhealthy recommendations. If our model is over/under fit we could potentially provide someone with an overly intense running routine that could cause physical harm. If our app tells someone they should be able to run 10 miles on their first run and they attempt it, they could injure themselves based off of our recommendations. To avoid this we will have to conduct thorough running research to that we are able to gage our model’s suggestions and provide realistic goals for users.

## Open Source and Closed Source Components
1. Tensorflow (partly open sourced)
2. FitBit API (closed source)
3. Apple’s HealthKit (closed source)

## User Interaction
<p align="center">
  <img src="objects/images/Personalized_Health_User_Story_1.png" alt="User-Story--Image" />
</p>

## The Timeline

Week 9 (3/10 - 3/16) - Concept
- Finalize the project proposal
- Figure out the input, deciding between FitBit/Apple Watch (Studying APIs)
- Extensive storyboarding / wireframing to develop use-cases
- Envisioning the minimum viable product/demos leading to the finals week

Week 10 (3/17 - 3/23) - Planning
- Talk with possible users
- Close the dev loop, which involves figuring out (and learning) exactly the frameworks, architecture, UI (watchOS / iOS / webapp) and libraries to use.
- Deliverable: A small app that displays and responds to features we are targeting to use in our ML model

Week 11 (3/24 - 3/30) - Spring Break

Week 12 (3/31 - 4/6) - Design & Development
- Basic ML model using the available features and couch to 5k plan
- Iterate over UI, building interaction design
- Deliverable: App with better interaction design (using only couch to 5K data, no ML yet) and ML model separately

Week 13 (4/7 - 4/13) - Design & Development
- Making better model, using more features
- Thinking ML deployment solutions, choosing from available deployment frameworks MLKit / TensorFlow.
- Deliverable: First iteration with ML deployed into the app

Week 14 (4/14 - 4/20) - Quality Checks
- Testing the final app, fine-tuning ML model
- Looking for corner cases and finalizing interaction design
- Deliverable: An application with a ML model fully integrated

Week 15 (4/20 - 4/27) - Final Presentation
- Complete materials around final submission

## Bibliography

1. Couch to 5K running plan ([link](https://crcphp.arizona.edu/sites/default/files/images/Couch-to-5k%20Running%20Plan.pdf))
2. TFJS ([link](https://www.tensorflow.org/js))
3. TF Lite ([link](https://www.tensorflow.org/lite))
4. TF Extended ([link](https://www.tensorflow.org/tfx))
5. FitBit Web APIs ([link](https://dev.fitbit.com/build/reference/web-api/))
6. Apple HealtKit ([link](https://developer.apple.com/healthkit/))
7. Inspired by other teams’ time table
8. TF for Swift ([link](https://www.tensorflow.org/swift))
9. Swift App Tutorial ([link(https://developer.apple.com/library/archive/referencelibrary/GettingStarted/DevelopiOSAppsSwift/BuildABasicUI.html#//apple_ref/doc/uid/TP40015214-CH5-SW1))
