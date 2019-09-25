$ ->
  $window   = $(window)
  $document = $(document)

  THRESHOLD = $('footer').height()

  $paginationElem     = $('.pagination')
  # check existanse of the pagination block  
  unless $paginationElem.length
    return
  
  paginationUrl       = $paginationElem.attr('data-pagination-endpoint')
  pagesAmount         = $paginationElem.attr('data-pagination-pages')
  paginationContainer = $paginationElem.attr('data-pagination-container')

  currentPage = 1
  baseEndpoint = paginationUrl

  ### validate if the pagination URL has query params ###

  if paginationUrl.indexOf('?') != -1
    baseEndpoint = paginationUrl + '&page='
  else
    baseEndpoint = paginationUrl + '?page='

  ### initialize pagination ###

  $paginationElem.hide()
  isPaginating = false

  ### listen to scrolling ###

  $window.on 'scroll', _.debounce((->
    if !isPaginating and
       currentPage < pagesAmount and
       $window.scrollTop() > $document.height() - $window.height() - THRESHOLD

      isPaginating = true
      currentPage++
      $paginationElem.show()

      # ajax-request      
      $.get baseEndpoint + currentPage, (data) ->
        $(paginationContainer).append data
        isPaginating = false
        $paginationElem.hide()
        return

    return
  ), 100)
  return