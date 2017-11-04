# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ -> 
  addPurchaseConfirmation = () ->
    $('#confirmation').text('Thank you for your purchase')

  handlePurchaseClick = () ->
    $('#confirmation').empty()
    if window.fbq
      jqXHR = $.ajax({
        url: '/purchases' 
        method: 'POST'
      })

      jqXHR.done((data, textStatus, jqXHR) ->
        fbq('track', 'Purchase', {
          value: 90.00,
          currency: 'USD',
        });
        addPurchaseConfirmation()
      )

      jqXHR.fail((jqXHR, textStatus, errorThrown) ->
        console.log('the call did not fail: ', errorThrown)
      )
    else
      addPurchaseConfirmation()
      console.log('purchase click happening without fbq and no db save')

  $('#purchase-click').one('click', handlePurchaseClick)