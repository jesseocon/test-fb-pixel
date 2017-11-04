# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ -> 
  handlePurchaseClick = () ->
    jqXHR = $.ajax({
      url: '/purchases' 
      method: 'POST'
    })
    jqXHR.done((data, textStatus, jqXHR) ->
      console.log('the call is done: ', data)
    )
    jqXHR.fail((jqXHR, textStatus, errorThrown) ->
      console.log('the call did not fail: ', errorThrown)
    )

  $('#purchase-click').on('click', handlePurchaseClick)
