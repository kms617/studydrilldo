==README

ER Diagram (10/10/2014)
```
    +---------------------------+                 +---------------------------+       
    |        User               |                 |         Goal              |       
    +---------------------------+                 +---------------------------+       
    | :username, string, NF     |                 |  :name, string, NF        |       
    | :email, string, NF        |                /|  :user, integer, NF       |       
    | :first_name, string       +-----------------+  :duration, integer, NF   |
    | :last_name, string        |                \|  :secret, boolean, NF     |
    | :role, NF, default: member|                 |  :completed, boolean, NF  | 
    | :password, NF             |                 |  :objective, text         |
    |                           |                 |                           |       
    +---------------------------+                 +-------------+-------------+       
                                                                |                     
                                                                |                     
                                                                |                     
                                                                |                     
                                                                |                     
                                                               /|\                    
    +---------------------------+                             / | \                   
    |                           |                 +-------------+--------------+      
    |         Type              |                 |          Task              |      
    +---------------------------+                 +----------------------------+      
    |   :name, string, NF       |                /|   :goal, integer, NF       |      
    |                           +-----------------+   :user, integer, NF       |      
    |                           |                \|   :focus, string, NF       |     
    |                           |                 |   :methodology, integer, NF|
    |                           |                 |   :completed, boolean, NF  |      
    |                           |                 |   :duration, integer, NF   |     
    |                           |                 |   :description, text       | 
    |                           |                 |   :secret, boolean, NF     |
    +---------------------------+                 +----------------------------+      
```
======================
USER STORIES
----------------------

A. As an authenticated user, I want to be able to log-in and save a profile
    with all of my goals, tasks and progress.
    #Acceptance Criteria
      1. I must specify a valid email address.
      2. I must specify a valid username.
      3. I must specify a password and confirm that password.
      4. If I do not do the above, I get an error message.
      5.  If I specify valid information, I register my account and get confirmation.

B.  As an admin user, I want to be able to manage all the users of the site.
    #Acceptance Criteria
      1. I must login as an admin.
      2. I must be able to see a page with all of the users.
      3. I can delete miscreant users.

C.  As a learner, I want to keep track of my learning goals and progress.
    #Acceptance Criteria
      1.  I can submit a new goal, which must contain: the time I expect to
          complete it in,the focus of the goal and whether or not I completed
          it. I may optionally submit an objective for the goal.
        1a. If I fail to submit a complete form I want to receive an error
            message prompting me to provide the correct information and alerting
            me to my errors.
        1b.  If there are errors in my form, I want to receive an error message
            detailing my mistakes so that I can correct them.
      2.  After I submit my form, I can see all of the information for my goal
          on its own page.
      3.  I can also view a list of all of the goals I have set for myself,
          displaying those which I'm still working on first, followed by my
          most recently set goals.
      4.  I want to be able to revise a goal if I reevaluate my priorities or
          discover something new. Or if I make a mistake.
      5.  If I change my overall focus, I want to be able to remove a goal from
          my learning portfolio.

D.  As a user, I'd like to be able to designate some of my goals and tasks as
    private, so that I can keep them to myself.
      1.  When I submit a new goal, I can mark it as private and only I can view it.
      2.  When I edit a goal, I would like the option to make it public or private,
          in case I change my mind.
      3.  When I submit a new task, I can mark it as private and only I can view it.
      4.  When I edit a task, I would like the option to make it public or private,
          in case I change my mind.

E.  As a learner, I want to keep track of the tasks I've done to reach my goal.
    #Acceptance Criteria
      1.  I can add a task to a session. Each task must include: the name of the
          task, if it's completed or planned, and its duration. I can optionally
          include a description of the task.
        1a. If I fail to submit a complete form, I want to receive an error message
            prompting me to provide correct information and alerting me to my errors.
        1b. If there are errors in my form, I want to receive an error message
            detailing my mistakes so that I can correct them.
      2.  After I submit my task, I want to see a summary of the details for it.
      3.  I also want to view a list of all the tasks in a session, with the most
          recent first.
      4.  I want to be able to revise a task if I enter the wrong information.
      5.  I want to be able to delete a task if I don't want it there anymore.

F. As a savvy learner, I'd like to know if my task allocation optimizes my learning.
      1.  I must be prompted to enter the PPU type of a task when I record it for
          a goal.
      2.  My session shows me an updated, planned and actual PPU allocation for
          for my goal's session.
      3.  I can compare my session to an ideal allocation and get recommendations.

G.  As an engaged learner, I'd like to know what format of activities work best for me.
      1.  I can tag tasks according to their format (eg., video, book, drill, etc.)
          for reference.
      2.  When I open the task managed, I am prompted to review my retention from
          the previous session and rate the task/my progress.
      3.  I can view a list of formats or activities that I rated the highest.

H.   As an active learner, I'd like to know what other people are doing to learn.
...

#####
[![Build Status](https://travis-ci.org/kms617/toy.svg?branch=master)](https://travis-ci.org/kms617/toy)
