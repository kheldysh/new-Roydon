# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
flash = (msg, type) ->
  $('#flash').append("<div class='wrapper'><div class='rounded " + type + "'>" + msg + "</div></div>")
  $('#flash').fadeOut 2500

updateCart = (event, data, status, xhr) ->
  $('#shopping-cart').load(' #shopping-cart > *')
  flash(data.message, xhr.getResponseHeader('X-Message-Type'))

selectSubcategory = (subCategoryName) ->
  if subCategoryName? and subCategoryName.length > 0
    $('#category-menu li').removeClass 'selected'
    $('#'+subCategoryName).parent().addClass 'selected'

$ ->
  pathParts = location.pathname.split '/'
  name = pathParts[pathParts.length-1] # Last item of pathname is either the category or it isn't anything
  [categoryName, subCategoryName] = name.split '~'
  if categoryName? and categoryName.length > 0
    $('#shop-navi > li').removeClass 'selected'
    $('#'+categoryName).parent().addClass 'selected'
    selectSubcategory(subCategoryName)


$ ->
  $('.add-to-cart')
    .on 'ajax:success', updateCart

$ ->
  $('.edit_shop_product')
    .on 'ajax:success', updateCart
