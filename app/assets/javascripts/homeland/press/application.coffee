window.PostView = Backbone.View.extend
  el: "body"
  events:
    "click .editor-toolbar .edit a": "toggleEditView"
    "click .editor-toolbar .preview a": "togglePreviewView"

  initialize: (opts) ->
    $("<div id='preview' class='markdown form-control' style='display:none;'></div>").insertAfter( $('#post_body') )
    window._editor = new Editor()

  toggleEditView: (e) ->
    $(e.target).parent().addClass('active')
    $('.preview a').parent().removeClass('active')
    $('#preview').hide()
    $('#post_body').show()
    false

  togglePreviewView: (e) ->
    $(e.target).parent().addClass('active')
    $('.edit a').parent().removeClass('active')
    $('#preview').html('Loading...')
    $('#post_body').hide()
    $('#preview').show()
    $.post '/posts/preview', {body: $('#post_body').val()}, (data)->
      $('#preview').html(data)
      false
    false

document.addEventListener 'turbolinks:load',  ->
  window._postView = new PostView()
