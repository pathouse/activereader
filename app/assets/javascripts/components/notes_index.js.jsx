/** @jsx React.DOM */

var NotesIndex = React.createComponent({

  render: function () {
    var notes = this.props.notes
    var noteRows = _.map(notes, function(note) {
      return <NoteEditor note={note} />
    })

    return (
      <div className="col-md-10">
        <h2>Notes</h2>
        { noteRows }
      </div>
    )
  }
});
