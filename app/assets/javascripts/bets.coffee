# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


betsInit = ->
  $('[data-toggle="tooltip"]').tooltip 'placement': 'top'
  $('[data-toggle="popover"]').popover
    trigger: 'hover'
    placement: 'top'
    container: 'body'
  if $('#my_bets_table').length || $('#all_bets_table').length
    $.expr[':'].contains = $.expr.createPseudo((arg) ->
      (elem) ->
        $(elem).text().toUpperCase().indexOf(arg.toUpperCase()) >= 0
    )
    
    $('#search_bet_input').keyup ->
      filterBets(@value)
    
    $('#active_bets').change ->
      rows = $('#mbbody').find('tr')
      ch = $(this).is(':checked')
      sessionStorage.setItem('ab_cb_state', ch)
      $('#search_bet_input').keyup()
      if ch
        $.each rows, (i, v) ->
          vis = $(v).is(":visible")
          hc = $(v).hasClass('wait_win')
          if vis && !hc
            $(v).hide()
    
    ab_cb = sessionStorage.getItem('ab_cb_state')
    if ab_cb == 'true'
      $('#active_bets').prop('checked', ab_cb)
      $('#active_bets').change()

    $('.dataTable').DataTable {
        # ajax: ...,
       autoWidth: false,
       pagingType: 'full_numbers',
       processing: true,
      # serverSide: true,
    }
    console.log 'js ready!'
  
filterBets = (value) ->
    rows = $('#mbbody').find('tr').hide()
    data = value.split(' ')
    $.each data, (i, v) ->
        rows.filter(':contains(' + v + ')').show()
    checkSelectFilters(rows)

checkSelectFilters = (rows) ->
  abc = $('#active_bets').prop('checked')
  if abc
      $.each rows, (i, v) ->
          vis = $(v).is(":visible")
          hc = $(v).hasClass('wait_win')
          if vis && !hc
              $(v).hide()


$(document).ready betsInit
$(document).on 'page:load', betsInit
$(document).on 'turbolinks:load', betsInit