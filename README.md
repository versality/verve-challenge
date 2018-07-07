# README

## Requirements
* Ruby v2.5.0
* Redis v4.0
* Postgresql 10.3

## Task Spec

- [x]  User can search through products based on name or region
- [x]  Search should be case insensitive, and trigger only after you enter at least 3 characters
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
### API Fetching
`Her` was picked to avoid writing low detail API wrapper as of this scope we only needed read without a need to construct complicated REST operations.
### Data
Data is being fetched by ActiveJob every 10 minutes with 5 minutes ahead bonus in case if API is down or fetch would take longer than expected. 