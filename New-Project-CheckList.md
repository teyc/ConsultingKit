# The Tech Lead’s New Project Checklist

Original: https://insimpleterms.blog/2017/08/07/the-tech-leads-new-project-checklist/

These are my notes from a session on what a tech lead needs to do and know when arriving on a new project. The wisdom came from @JimBarritt at Thoughtworks – I am just the conduit.

Note that this list applies both to projects that existed before the tech lead arrived, and those where the whole team / product is new.

The first two are apparently “the two most likely causes of death or injury”:

1) Infrastructure

   - Where’s the production environment? It’s the most important one! What does it look like? When will it be ready? (Development environments are an afterthought after prod)
   - How are we going to go live? What’s the plan?
   - Load balancers
   - Firewalls
   - Certificates
   
2) Third parties

   - Integration!
   - If environments beyond your control are chaotic, it’s even more important to make sure your own environment is super-organised and disciplined, smooth, automated, with good scope planning, etc
   
3) Find the movers and shakers

   Find all the people who can say No, and the people who hold the purse-strings/can sign off budgets, and the people who can say “Yeah, you did a good job” and get to know them
   Eg: 

   - Architects
   - The person who has control over data protection (Beware “organisational scar tissue”)
   - In the public sector, the SIRO (Senior Information Risk Officer)
   
4) Find any top-level documentation of your team’s work, read it and understand it

5) What’s the budget and the value proposition?

   - How well defined is it? Why are you doing the work? What’s the vision? Do people understand it?
   - Once you find this info, be really repetitive about it
   - If there are assumptions which are crucial to the whole success, keep repeating them at the start of every showcase
   
6) Try to have a one-to-one with each person in the team

   - Try to understand what their goals are, particularly on the project – and be transparent about your own goals. For instance if you have areas you want to move away from, find people who are keen to move INTO those areas
   - What are their main pain points and blockers?
  
7) Befriend a project manager and get to understand how they manage budgets

   - This helps to establish a relationship of trust
   - Get to know “Real Options” from Chris Matts
   - Read “Beyond Budgeting” by Bjarte Bogsnes
   - Brett Ainsley did a great talk at Agile on the Beach in 2016 on money and teams and how to account
   - Read 37 Things One Architect Knows About IT Transformation, by Gregor Hohpe
   - Don’t try and become an expert on the arcane detail of finance, but understand the basics: how does money move around, what are the different types of work, what’s the difference between OpEx and CapEx
   
8) If there are multiple teams, find and get to know the other tech leads

9) Understand the importance of the Trinity of delivery: Delivery manager, product owner, tech lead

   There is often a tension between these three areas, build relationships with these people.
   All three should be present for all decisions, otherwise it’s likely to be skewed.
   Tech leads can sometimes get a bit side-lined in these relationships.

10) Backlog: make sure the scope is clearly structured

   - Use story trees and backlog hierarchies
   - People can struggle with higher levels of grouping / scale
   - You need to get into the helicopter, go up and look down on the thing you’re building
   
11) Code:

   - Make sure you have access to it
   - Remain connected to it
   - Get a couple of the devs to give you a guided tour
   - Can be particularly illuminating to get newer team members to do this
   - You need to be able to visualise the entire code base (overall architecture)
   - How easy is it to run it from scratch for the first time?
   - 
12) What are the pain points and blockers?

Project manager is good person to talk to about that

13) Cross Functional Requirements

   - Resilience & scalability: Is it going to fall over with the load
   - Security: Is someone going to break into it?
   - Automation
     - Although automation is awesome, don’t fall for the trap of thinking you have to set everything up at the start
     - Don’t necessarily prioritise automation – but do prioritise what you need to actually deliver something
   - Once you have something up and running and iterating, it’s all good – but how do you break that initial blank sheet of paper?
   - You want pipelines etc, but as a principle, maybe there are different laws of physics right at the start of a project
   - Don’t spend six weeks building a pipeline with no actual deliverable – make sure you have something iterative
   - Imagine this product that you’re building… imagine you’re doing it with no software at all. Then bring the computer into it, and ask why – what is it going to give you? Where can it give you the most value? Don’t add stuff you don’t need
   - Imagine a walking skeleton in business terms – for instance, delivering whisky by physically posting it*. Your deployment walking skeleton can be over the top – only automate something when you need it
   - It’s a subtle art though – you don’t want to end up with tons of tech debt
   - You can spend a bunch of time working out the concept without having the capability.
   - Could have a simultaneous technical alpha – looking at cross-functional requirements etc
   - Try a walking skeleton of the architecture – a “scale model”

14) As a tech lead, what things are scaring you most about this project?

Do a futurespective graph with time on the x axis and clouds of uncertainty. If the cloud is really close and has a lot of lightning coming out of it… pay attention to it!

This is partly about risk management
* Whisky idea inspired by JK Werner.
