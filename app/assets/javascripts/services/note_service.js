var NoteService = {

  save: function(id, content, onSuccess) {
    $.ajax({
      data: {_method: "put", kindle_note: content},
      type: "post",
      url: "/api/kindle_notes/" + id,
      success: onSuccess
    })
  },

  destroy: function(note, onSuccess) {
    $.ajax({
      data: {_method: "delete"},
      type: "post",
      url: "/api/kindle_notes/" + note.id,
      success: onSuccess
    })
  }
}
