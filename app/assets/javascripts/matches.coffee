# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
    $.expr[':'].contains = $.expr.createPseudo((arg) ->
        (elem) ->
            $(elem).text().toUpperCase().indexOf(arg.toUpperCase()) >= 0
    )
    
    $('#search_match_input').keyup ->
        filterMatches(@value)
    
    $('#active_bets').change ->
        rows = $('#fbody').find('tr')
        ch = $(this).is(':checked')
        $('#search_match_input').keyup()
        if ch
            $.each rows, (i, v) ->
                vis = $(v).is(":visible")
                hc = $(v).hasClass('bets_active')
                if vis && !hc
                    $(v).hide()
    
    $('.dataTable').DataTable {
        # ajax: ...,
       autoWidth: false,
       pagingType: 'full_numbers',
       processing: true,
      # serverSide: true,
}
  console.log 'js ready!'
  
filterMatches = (value) ->
    rows = $('#fbody').find('tr').hide()
    data = value.split(' ')
    $.each data, (i, v) ->
        rows.filter(':contains(' + v + ')').show()
    checkSelectFilters(rows)

checkSelectFilters = (rows) ->
  abc = $('#active_bets').prop('checked')
  if abc
      $.each rows, (i, v) ->
          vis = $(v).is(":visible")
          hc = $(v).hasClass('bets_active')
          if vis && !hc
              $(v).hide()
          