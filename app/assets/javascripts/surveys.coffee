$(document).ready ->
  $('#index-table').on 'change', '#select-all', ->
    if $(this).is(':checked')
      $('#index-table').find('.print-survey').prop 'checked', true
      $('#submit').prop 'disabled', false
    else
      $('#index-table').find('.print-survey').prop 'checked', false
      $('#submit').prop 'disabled', true
    return
  $('#index-table').on 'change', '.print-survey', ->
    tr_length = $('#index-table').find('tbody > tr').length
    if $('#index-table').find('.print-survey:checked').length == 0
      $('#submit').prop 'disabled', true
    else
      $('#submit').prop 'disabled', false
    if $('.print-survey:checked').length == tr_length
      $('#select-all').prop 'checked', true
    else
      $('#select-all').prop 'checked', false
    return
  return