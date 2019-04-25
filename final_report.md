
<h1 align="center"> Personalized Health </h1>
<p align="center">
  <img src="objects/images/readme1.jpg" alt="Title-Image" />
</p>

<p align="center">
 <b>Robert Renecker - Jacob Munoz - Akshit Arora</b>
</p>


## The Idea and Mission Statement

The goal for our project was to build a personalized goal application for running. Given a broad spectrum ranging from never-have-run-before to I-run-every-day, we want the user to be able to use our application in order to get recommendations to increase their ability to run. This project uses a machine learning application and other essentials in order  to carry out this goal.

We hope that for people who find running difficult that by using this application they can gradually build their ability to run longer distances. Though this application is far from what could be possible with it, there is a minimum viable product that seems very beneficial to the end user. These goals of extending our application for us as developers and the goals given to the user are both very realistic and if this project was to continue in the future it would very well be plausible that both parties could stand to gain a lot more.

## Usage
The user will initially use a third party data collection application such as Nike Run. These applications will record workouts for the user. The User can then either enter in the time they started or concurrently start the workout on the phone and then end it on the phone as well.

After a workout has been recorded, the user will be able to get a recommendation from the model that will output a discrete range of numbers associative to a text-based recommendation.

The user will then be able to fulfill the goals set by the recommendation until all goals are met. Once all goals are met, the user will then either be able to say that the recent workout recommendation was too easy, normal or too difficult. Based on the users’ response, the model will be able to get feedback and retrain based on the data that the user has and the response given.

## Challenges
Initially, we wanted the model to collect data during the run(distance traveled vs. goal, heart rate, pace) and adjust accordingly. We wanted our model to be able to adjust itself based on user performance. For example, if the user crushes the first goal given by the app, we want it to adjust and give the user a much more rigorous running plan. If the user struggles to reach the goal or didn’t complete the run, it should adjust accordingly to give a more reasonable goal. Ideally the app would underestimate rather than overestimate the user so as to not demotivate them!

However, due to the difficult dealing with workout sessions and healthkit, collection of streaming data proved to be very difficult. In future iterations of this application, this would definitely be one of the challenges that would have be take priority. The pre-processing of data in swift in addition to what was mentioned proved to be quite difficult as well. Once data was returned from the query via the HealthKit framework, the data would require quite a bit of processing in order to correctly fit it to the desired data type.

Another challenge we struggled with was creating a ‘one size fits all’ routine. Ultimately we decided to use a pre-made plan, Couch-to-5k[1]. We are used this plan as our baseline routine that adjusts to the user based on performance and feedback. After each goal is met the user’s workout data is fetched from Healthkit and cross referenced with the user’s interpretation of difficulty to adjust future goals accordingly.

Lastly, the third challenge we met was finding suitable data for a regression model to realistically output recommendations. Given the input data such as age and weight etc… are intuitively good indicators of the ability one has for running, there are very difficult to find in data sets that also have distance ran and the pace as well. Furthermore, even if we have found a data set such as that, we would most likely be dealing with a data set that is exclusive to experienced runners. We want our model to be trained on data sets that include all levels of running in order to be able to get a use case where a user can have never ran before and be able to take advantage of our application.

## The Technologies
- Apple Developer Frameworks - HealthKit, CreateML, CoreML
- Deployment - iPhone, Apple watch
- IDE - Xcode 10.0
- Language - Swift 4.0

## Risks of Failure
Risks already identified:
- ML Model
  - We ended up taking the Couch To 5k approach and transforming it into set of stages where each stage is represented by 4 features: Absolute time spent jogging, Fractional time spent jogging, Absolute distance jogged and Fractional distance jogged.
  - We then took the 12 data points (we got from 12 stages) and trained a Decision Tree on it using CreateML such that, given 4 features the model would predict the stage user is at.
  - Using this stage, we can examine user’s progress and give recommendations.
- Fitbit -> Apple watch
  - Decided to use apple watch instead after many peer recommendations.
  - Allowed us to develop a mobile application rather than a web app
  - Allowed us to access healthkit data
  - User can start/stop workout
- Risks that we faced later on
  - End User Trainable
    - To build this feature, we looked at using user’s feedback about the workout and the heart rate zone as described in Annexure B
    - Using both the inputs, we can adjust the stage predicted from Decision Tree classifier, which in turn affects the progress of the user. Thus making it end-user trainable.
  - Outsourcing Interaction Design to Figma
    - While we were still on the learning curve of iOS development, we began iterating interaction design on Figma that had no prerequisite whatsoever.
    - This proved to be a useful technique by the time we approached the final deadlines.


## ML Model
We ended up taking the Couch To 5k approach and transforming it into set of stages where each stage is represented by 4 features: Absolute time spent jogging, Fractional time spent jogging, Absolute distance jogged and Fractional distance jogged.
We then took the 12 data points (we got from 12 stages) and trained a Decision Tree on it using CreateML such that, given 4 features the model would predict the stage user is at.
Using this stage, we can examine user’s progress and give recommendations.
Fitbit -> Apple watch
Decided to use apple watch instead after many peer recommendations.
Allowed us to develop a mobile application rather than a web app
Allowed us to access healthkit data
User can start/stop workout
Risks that we faced later on
End User Trainable
To build this feature, we looked at using user’s feedback about the workout and the heart rate zone as described in Annexure B
Using both the inputs, we can adjust the stage predicted from Decision Tree classifier, which in turn affects the progress of the user. Thus making it end-user trainable.
Outsourcing Interaction Design to Figma
While we were still on the learning curve of iOS development, we began iterating interaction design on Figma that had no prerequisite whatsoever.
This proved to be a useful technique by the time we approached the final deadlines.

## Ethical questions
The only ethical question that were raised was that our application could be providing unhealthy recommendations. If our model is over/under fit we could potentially provide someone with an overly intense running routine that could cause physical harm. If our app tells someone they should be able to run 10 miles on their first run and they attempt it, they could injure themselves based off of our recommendations.
Open Source and Closed Source Components
Tensorflow (partly open sourced)
FitBit API (closed source)
Apple’s HealthKit (closed source)
Bibliography
Couch to 5K running plan (link)
Apple HealthKit (link)
Figma (link)
Running Heart Rate Zone (link)


## ANNEXURE A
Initial Sign up screen and their uses:

- Full Name: Referencing throughout application
- Age: To calculate heart rate zone
- Grant Permissions: For accessing healthkit data

## ANNEXURE B
Here are the options presented for User Feedback: Rating between 1 to 5 where 1 is Too Easy and 5 is Too Difficult.

Here are the heart rate zone[4] descriptions:
- Zone 1: 50 to 60 percent of maximum heart rate
- Zone 2: 60 to 70 percent of maximum heart rate
- Zone 3: 70 to 80 percent of maximum heart rate
- Zone 4: 80 to 90 percent of maximum heart rate
- Zone 5: 90 to 100 percent of maximum heart rate

Ideally for long runners, the heart rate zone must be between 1 and 2.
