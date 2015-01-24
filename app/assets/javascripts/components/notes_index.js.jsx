/** @jsx React.DOM */

var NotesIndex = React.createClass({

  getInitialState: function () {
    return { book: this.props.book, order: 'page', filter: 'none' }
  },

  applyOrder: function(notes) {
    var sortFunction;
    if (this.state.order === 'page') {
      sortFunction = function(note) { return Number(note.page_number) }
    } else if (this.state.order === 'annotated') {
      sortFunction = function(note) { return Date(note.annotated_at) }
    }

    return _.sortBy(notes, sortFunction)
  },

  applyFilter: function(notes) {
    var filterFunction;
    if (this.state.filter === 'starred') {
      filterFunction = function(note) { return note.starred }
    }

    return _.filter(notes, filterFunction)
  },

  onRemove: function(note) {
    var onSuccess = function() {
      var book = this.props.book
      book.notes = _.reject(book.notes, function(n) { return n == note })
      this.setState({book: book})
    }.bind(this)

    NoteService.destroy(note, onSuccess)
  },

  render: function () {
    var book = this.state.book
    var notes = this.applyOrder(book.kindle_notes)
    var notePanels = _.map(notes, function(note) {
      return <NotePanel key={note.id} note={note} onRemove={this.onRemove}/>
    }, this)

    return (
      <div>
        <h2>Notes from {book.title}</h2>
        { notePanels }
      </div>
    )
  }
});
