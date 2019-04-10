
[![Waffle.io - Columns and their card count](https://badge.waffle.io/dylhof/family-stories.svg?columns=all)](https://waffle.io/dylhof/family-stories)

# README

Family Stories is our cross-pollination group project for Module 4 of 4 at the Turing School of Software & Design.

This repository is backend only and includes the following tech: Ruby on Rails & PostgreSQL.  Our frontend can be found at https://github.com/dylhof/family-stories.

#### [**_View Family Stories in Production_**](https://family-secrets.herokuapp.com/)

#### [**_View the backend data for Family Stories_**](https://sheltered-badlands-12986.herokuapp.com/api/v1/families)

## Getting Started

To run Family Stories on your local machine, navigate to the directory in which you would like the project to be located, then execute the following commands:

```
$ git clone git@github.com:le3ah/sweata_weatha.git
$ cd family_stories
$ bundle
$ rails g rspec:install
$ rails db:create
$ rails db:migrate
$ rails db:seed
```

In order to see that the backend data is working appropriately, take the rails server for a spin!  Just type `rails s` in your terminal, and you should be able to find our backend APIs at http://localhost:3000/api/v1/families

## Testing
We ran our tests using `rspec` and followed our coverage percentage with SimpleCov.

<img width="1424" alt="Screen Shot 2019-04-10 at 1 55 10 PM" src="https://user-images.githubusercontent.com/42391567/55909087-5cb47e00-5b98-11e9-960b-06a76aa73faa.png">

## Code Snippets
We used serializers to affect our response data:
```
class StorySerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :content, :author
  belongs_to :family
end
```

## Schema
We did modify our schema slightly, but for our brainstorming, we used the following as our database breakdown:
![IMG_7974](https://user-images.githubusercontent.com/42391567/55909367-0c89eb80-5b99-11e9-978f-4bf0272a5789.JPG)



## Rubric/Project Description
http://backend.turing.io/module4/projects/cross_pollination/cross_pollination_spec

## Authors

* [Ali Benetka](https://github.com/abenetka)
* [Dylan Hoffman](https://github.com/dylhof)
* [Leah K. Miller](https://github.com/le3ah)
