$(() ->
  options =
    linkType: "direct",
    extensions: ["text"],
    succcess: (files) ->
      alert("Here's the file link: " + files[0].link)


  button = Dropbox.createChooseButton(options)
  $("js-dropbox-button").appendChild(button)
)