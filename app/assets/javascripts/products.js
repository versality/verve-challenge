// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


// TODO migrate to Vue.js or React in case of expansion to other pages with more integrations
// TODO cover with front-end tests (right now taken care with Capybara)
$(function() {
  $('.q, .q-sort').on('input change', function() {
    search()
  })

  function search() {
    let searchQuery = stripQuotes($('.q').val())
    let searchOrder = $('.q-sort').val()
    if (isOutsideSearchTreshold(searchQuery)) return
    
    $.get('/products_search', generateParams(searchQuery, searchOrder))
  }

  function generateParams(searchQuery, searchOrder) {
    let params = null

    if (searchQuery.length > 0) {
      return { query: searchQuery, order: searchOrder }
    } else {
      return { order: searchOrder }
    }
  }

  function stripQuotes(string) {
    return string.replace(/['"]+/g, '')
  }

  function isOutsideSearchTreshold(searchQuery) {
    return searchQuery.length < 3 && searchQuery.length > 0
  }
})