# README

## Eventbrite-like

### You want to see the job, go here : https://thawing-dawn-73213.herokuapp.com/

We had to make a great event site to be able to create events and invite other users to these events and see the date and location of the event on the site. But unfortunately the reality is very different :( <br/><br/>

* The app has 2 models: ```users``` and ``events``, a user with a name and can create multiple ```events```, it can also attendee for ```events``` <br/>

* An events have a description, a date and a place. An event can be created by one creator and several ```attended_events```. <br/>

* Then we created a user controller for the #new, #create and #show methods as well as signin forms. <br/>

* Then we created events using the routes and the event creation form. <br/>

* The display of the page of a user must display the events he has created and the index must allow to display all the events and show all the creators. <br/>

* Event management allows us to display the guest list through the "show" page. <br/>

* Page "show" of a user makes it possible to separate past and future events just like the index of events. <br/>

* It is possible to join an event by clicking a button on each event. <br/>

* We use ```devise``` gem to allow people to pay to participate in an event, if you have create an profile and you're connected you can check an event and you can pay to participate (use this code in the card box --> ```4242 4242 4242 4242```) </br>

* Our site is not the most beautiful, it is not hyper complete but it exists then please be indulgent dear corrector :D Thank you ! <br/>


## Now 

You can check the code of the application on github or clone it if the instructions ask for it, in this case do not forget to type ```bundle install``` once in the repo folder.

## Team 

Realized by Cyril M. & Pacôme P.
