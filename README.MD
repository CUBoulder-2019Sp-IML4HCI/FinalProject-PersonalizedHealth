
<h1 align="center"> Personalized Health </h1>
<p align="center">
  <img src="objects/images/readme1.jpg" alt="Title-Image" />
</p>

<p align="center">
 <b>Robert Renecker - Jacob Munoz - Akshit Arora</b>
</p>

## Versions Selected

Swift 3 \
WatchOS 5.1.3 \
iOS 12.1.4 \
XCode 10

## The Idea and Mission Statement

The goal for our project is to build a personalized goal application for running. Given a broad spectrum ranging from never-have-run-before to I-run-every-day, a regression model will be able to provide inference to a recommendation that a potential runner should carry out in order to meet a goal. The goals may be weight loss or the ability to run a certain distance. By using this application, hopefully a potential runner will be able to achieve these goals in a way that is personalized to their health and ability.

The problem that we hope to solve is that right now, running for some people is difficult. However, most of the problem is just figuring out a realistic goal that will encourage them to attempt to run. By using this web-app, we hope to give them a realistic goal that may not be too difficult for them to do. Thus, it will encourage them to continue making progress towards a longer-term goal with which they feel proud of achieving.

As a team, we feel that this project is more than feasible given we understand our problem statement and we understand the data we are working with. The scope of our project isn’t too large and it encompasses minimal things which will make it possible to do with the time constraints we’ve been given.

In regards to our machine learning model, we believe that multiple linear regression will be a good interpreter for recommending goals to a potential runner because there is most likely a linear relationship between various features in ones health and that of their running ability.

The user will input some initial training data(how much are you currently running, age, weight, distance goal, more?) to provide some baseline for running experience. This will give them an initial running goal to attempt. The model will then collect data during the run(distance traveled vs. goal, heart rate, pace, more?) and adjust accordingly. We want our model to be able to adjust itself based on user performance. For example, if the user crushes the first goal given by the app, we want it to adjust and give the user a much more rigorous running plan. If the user struggled to reach the goal or didn’t complete the run, it should adjust accordingly to give a more reasonable goal. Ideally the app would underestimate rather than overestimate the user so as to not demotivate them!