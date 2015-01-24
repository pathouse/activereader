/** @jsx React.DOM */

var NotePanel = React.createClass({

  getInitialState: function() {
    return { note: this.props.note, mode: "read" }
  },

  componentDidMount: function () {
    var editableSelector = ".editable" + this.state.note.id
    var editor = new MediumEditor(editableSelector)
    editor.deactivate()
    this.setState({editor: editor})
  },

  writeModeActive: function() {
    return this.state.mode === "write"
  },

  saveNote: function() {
    var onSuccess = function(response) {
      this.setState({note: response})
    }.bind(this)

    var note = this.state.note
    var noteText = $(".editable" + note.id).text()

    var noteData = { content: noteText }
    NoteService.save(note.id, noteData, onSuccess)
  },

  onRemove: function() {
    debugger
    this.props.onRemove(this.state.note)
  },

  onModeToggle: function() {
    var newMode, editor = this.state.editor
    if (this.writeModeActive()) {
      newMode = "read"
      editor.deactivate();
      this.saveNote()
    } else {
      newMode = "write"
      editor.activate();
    }

    this.setState({mode: newMode, editor: editor})
  },

  renderModeToggle: function() {
    var buttonText, buttonClass
    if (this.writeModeActive()) {
      buttonText = "DONE"
      buttonClass = "btn btn-success"
    } else {
      buttonText = "EDIT"
      buttonClass = "btn btn-default"
    }

    return (
      <button onClick={this.onModeToggle} className={buttonClass}>
        {buttonText}
      </button>
    )
  },

  render: function() {
    var note = this.state.note
    var modeToggle = this.renderModeToggle()
    return (
      <div id={"note-" + note.id} className="panel panel-default">
        <div className="panel-heading">
          <h3 className="panel-title">
            Page: { note.page_number },
            Location: { note.location_info },
            Date: { note.annotated_at }
            <small>
              { modeToggle }
              <button onClick={this.onRemove} className="btn btn-danger">Delete</button>
            </small>
          </h3>
        </div>
        <div className="panel-body">
          <p>
            <div className={"editable" + this.state.note.id}>
              { this.state.note.content }
            </div>
          </p>
        </div>
      </div>
    )
  }
});
