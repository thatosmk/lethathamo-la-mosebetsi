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
git chekout [BRANCH_NAME] # either hotwire-release or react-release
bundle
rails assets:precompile
rails db:create db:migrate
./bin/dev # If you use overmind then, overmind s -f Procfile.dev
```

access the app from [http:://localhost:3005](http://localhost:3005)

## Two projects instead of 1

The first project is submitted using the complete Rails 7 package, using the Rails backend and front-end frameworks, (Turbo and Tailwindcss). This is the framework I have the most combined experience in to-date. This project is on the `hotwire-release` branch.

The second project is submitted with a Rails 7 backend and Reactjs front-end, because I have a little experience with Reactjs, and because the assessment specifications required the use of Reactjs. This project is on the `react-release`

The motivation behind submitting two projects instead of one was to demonstrate my know of SPA architecture using the default Rails 7 tools and to show that rails can successfully accomplish this. However, I have a keen interest in Reactjs as well, and while I am still learning a lot of it, I may not be accustomed to the best-practices yet.

I hope the desire to showcase my knowledge in this manner does not limit my chances of success in this assessment.

## Front-end

### The use of Reactjs

This uses Tailwindcss for frontend styling. With my limited knowledge of using Rails 7 with Reactjs, I tried to build a front-end but could not get past the routing stage, so the app only loads on one link `/`.

I have knowledge on using routing library for React, see my [react project here](https://github.com/thatosmk/sefofane). But the new configuration of Rails 7 with either `importmaps` or `esbuild` was not making this easy. So I was disappointed with how I did on this section.

### The use of Turbojs

Being the default front-end framework that ships with Rails 7. I was able to get the front-end up and running very quickly. I use `turbo_frame_tag` and `turbo_stream_tag` a lot in this project to update the UI.

## Backend

This project is built with a Ruby on Rails backend. The database architecture of the backend was designed to mimick how trello designed theirs, atleast at the most basic level.

## Questions

1. How long did this project take?


  Overall 48 hrs overall,

    - The Trello API integration was pretty quick though, spend around 1 hour on this.
    - Most of the backend logic and tests took a bit longer, overall 24 hours on this.
    - The remaining time was spent working through the front-end and using React.js, this took a lot more to configure and still did not yield great results.

2. Improvements


- Not creating duplicate lists or cards
- Use of UUIDs over integers for table primary_key values
- Use of `form_objects` pattern to design the forms for capturing data and sending it to Trello
- Integration with [Sentry](https://sentry.io) for error tracking
- Use `view_components` to encapsulate some similar view logic
- Use Stimulusjs more for some UI interactions

#### React front-end

- Used Rails 6 instead, then webpacker might have been a better tool for js compilation in this case.
- Added routes to navigate to each page
- Added more componentes for each CRUD-like functionality of cards as shown on the non-react release.
- Added tests for the react components
