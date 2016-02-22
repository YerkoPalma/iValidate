#iValidate

> Project for the virtual Hackathon

![screenshot from 2016-02-22 00 16 51](https://cloud.githubusercontent.com/assets/5105812/13208704/5f22f96a-d8fa-11e5-94ec-655eb1810360.png)

![screenshot from 2016-02-22 00 17 07](https://cloud.githubusercontent.com/assets/5105812/13208716/6a2a39a4-d8fa-11e5-957e-dcf9af3a132f.png)

![screenshot from 2016-02-22 00 17 54](https://cloud.githubusercontent.com/assets/5105812/13208717/704b51ba-d8fa-11e5-897e-6c9997547630.png)

![screenshot from 2016-02-22 00 18 50](https://cloud.githubusercontent.com/assets/5105812/13208718/752448b8-d8fa-11e5-9f83-cc7eb3267c61.png)

##Overview

**iValidate** is a project that allows for two things

1. Serve as a public repository of project **ideas**.
2. Compare project ideas as an early validation and helping the authors to know if they have originalls ideas or to get in touch with similar projects.projects

##Usage

The app is very simple. First, there is no session or loggin, the authors of an idea just give a contact mail as authorship (all ideas are public).
 First, there is a general overview and desciprtion of the idea, and later, the author must submit the [Canvas Business Model](https://en.wikipedia.org/wiki/Business_Model_Canvas) to be compared.
 What will happen then, is that, in base of the tags submited by the user, a value is assigned to each part of the canvas business model, and with those values the new idea is compared with each of the actual ideas on the repo.
 
##Actual State

The app isn't finished yet. The idea creation is finished but untested, the idea comparisson and the result display isn't finished.

##Tech stack

iValidate is developed with `Ruby on Rails 4+` for the Backend, and `Vuejs` with `Browserify` (through the `browserify-rails` gem) for the Frontend.
 The database choose was `MongoDB` with the awesome `Mongoid` gem. 

##Final thoughts

I'm plannign to finish the project, some of the changes that I will introduce would be:

* Allow to have public and private segments of each idea 
* Helping to contact authors with developers, investors, etc
* Allow to edit ideas through email confirmation
* Implement email notifications when someone wants to contact an author
* Add ranking and view counter for ideas
* Populate the repo


**author:** [@YerkoPalma](https://github.com/YerkoPalma)
The tech stat was adapted from [here](https://github.com/YerkoPalma/vuejs-rails)
The originall idea was partially developed for my thesis work [here](https://github.com/YerkoPalma/observatorio_web)