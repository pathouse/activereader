/** @jsx React.DOM */

var NoteEditor = React.createClass({

  getInitialState: function() {
    return { note: this.props.note }
  },

  componentDidMount: function () {
    new MediumEditor("#note-" + this.state.note.id)
  },

  render: function() {
    var note = this.state.note
    return (
      <div id={"note-" + note.id} className="panel panel-default">
        <div className="panel-heading">
          <h3 className="panel-title">
            Page: { note.page_number },
            Location: { note.location_info },
            Date: { note.annotated_at } %>
          </h3>
        </div>
        <div className="panel-body">
          <p>
            { note.content }
          </p>
        </div>
      </div>
    )
  }
});
