<h1 align="center">
  Lethathamo
</h1>

<p align="center">
  <a href="https://github.com/thatosmk/lethathamo-la-mosebetsi/actions/workflows/ruby.yml">
    <img src="https://github.com/thatosmk/lethathamo-la-mosebetsi/actions/workflows/ruby.yml/badge.svg" alt="Build Status">
  </a>
</p>

This is a task management app that integrates with Trello.

## Getting started

- Clone the repository
- Request the encryption key that is saved in `config/master.key`
- Run the following commands
```sh
bundle
rails db:create db:migrate
./bin/dev
```

## Two projects instead of 1

The first project is submitted using the complete Rails 7 package, using the Rails backend and front-end frameworks, (Turbo and Tailwindcss). This is the framework I have the most combined experience in to-date.

The second project is submitted with a Rails 7 backend and Reactjs front-end, because I have a little experience with Reactjs, and because the assessment specifications required the use of Reactjs.

The motivation behind submitting two projects instead of one was to demonstrate my know of SPA architecture using the default Rails 7 tools and to show that rails can successfully accomplish this. However, I have a keen interest in Reactjs as well, and while I am still learning a lot of it, I may not be accustomed to the best-practices yet.

I hope the desire to showcase my knowledge in this manner does not limit my chances of success in this assessment.

## Front-end

### The use of Reactjs

This uses Tailwindcss for frontend styling and Stimulusjs.

### The use of Turbojs

Being the default front-end framework that ships with Rails 7. I was able to get the front-end up and running very quickly. I use `turbo_frames` a lot in this project to update the UI.

## Backend

This project is built with a Ruby on Rails backend. The database architecture of the backend is shown below.

## Questions

1. How long did this project take?

  Overall 48 hrs overall,
    - The Trello API integration was pretty quick though, spend around 1 hour on this.
    - Most of the backend logic and tests took a bit longer, overall 24 hours on this.
    - The remaining time was spent working through the front-end and using React.js
-
2. Improvements


- Not creating duplicate lists or cards
- Use of UUIDs over integers for table primary_key values
- Use of `form_objects` pattern to design the forms for capturing data and sending it to Trello
- Integration with [Sentry](https://sentry.io) for error tracking
- Use `view_components` to encapsulate some similar view logic
- Use Stimulusjs more for some UI interactions

#### React front-end
