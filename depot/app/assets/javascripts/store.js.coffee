# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->                                              # execute on page load
  $('.store .entry > img').click ->               # find all images in entry < store
    $(this).parent().find(':submit').click()      # clicks the submit button if the image is clicked