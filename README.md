[![Coverage Status](https://coveralls.io/repos/github/aterris/simplecov-shield/badge.svg?branch=master)](https://coveralls.io/github/aterris/simplecov-shield?branch=master)

# README

[Challenge on Heroku](https://verve-challenge.herokuapp.com/)

## Requirements
* Ruby v2.5.0
* Redis v4.0
* Postgresql 10.3

## Task Spec

- [x]  User can search through products based on name or region
- [x]  Search should be case insensitive
- [x]  Search should trigger only after you enter at least 3 characters
- [x]  Search should ignore single and double quotes when searching
- [x]  Allow products sorting by name and price (both ascending and descending)
- [x]  Each product should display the image, name, and producer
- [x]  Display only the first 10 results and the total number of results.
- [x]  Use provided API url
- [x]  Data shouldn't be older than 15 minutes if possible.

## Finished Project
![](https://api.monosnap.com/rpc/file/download?id=BXjK0z8gu1wGFYW7Or6oaQDePoUI2h)


## P.S.
Implemented solution tries to heavily avoid "premature optimization". <br>
In normal case scenario, a lot of solutions would have been done differently with more context and more information about possible traffic / load.

### Specs
Due to limited amount of time and desire to meet 100% coverage - feature tests were used cover as much functionality as possible at the cost of performance.
Ideally, hybrid approach using more unit tests would be a better fit test, bringing better spec error reporting as well higher testing speed.

###### What can be improved
* Specs should be less tied to the actual API data, using real names.
If API will get a version update, after cassettes update products can be different, that might require to update all rspec expected values. So if API change versions often, rspec expect values should be more flexible.

Also specs heavily rely on pre-configured cassettes.
For some of the tests something like factory_bot might have been a better choice, but again, due to limited time, this solution has it's strenght as it works with the actual API response rather than mock data.

### API Fetching
`Her` was picked to avoid writing low detail API wrapper as of this scope we only needed read without a need to construct complicated REST operations.

###### What can be improved
* Replace Her with Faraday and implement proper API wrapper to give more flexibility

### Data
Data is being fetched by ActiveJob every 10 minutes with 5 minutes ahead bonus in case if API is down or fetch would take longer than expected.

### Frontend
For the scope of this task jQuery + js.erb were picked to solve the front-end requirements.
Even though it might have been a good opportunity to show React or Vue.js expertise, from software design perspective it would be a major overkill and a sign of overengineering.