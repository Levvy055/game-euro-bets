# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

countriesInit = ->
    if $('#countries_table').length
        $.expr[':'].contains = $.expr.createPseudo((arg) ->
            (elem) ->
                $(elem).text().toUpperCase().indexOf(arg.toUpperCase()) >= 0
        )
        
        $('#search_country_input').keyup ->
            filterCountries(@value)
        
        console.log 'js ready!'

filterCountries = (value) ->
    rows = $('#cbody').find('tr').hide()
    data = value.split(' ')
    $.each data, (i, v) ->
        rows.filter(':contains(' + v + ')').show()
    checkSelectFilters(rows)

$(document).ready countriesInit
$(document).on 'page:load', countriesInit
$(document).on 'turbolinks:load', countriesInit