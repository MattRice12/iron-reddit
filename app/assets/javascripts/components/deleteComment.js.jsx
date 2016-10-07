var Delete = React.createClass({
  handleDelete: function (e) {
    $.ajax({
      url: "/comments/" + this.props.comment.id,
      method: "DELETE",
      dateType: "JSON",
      }).done(function (response) {
        window.location.reload();
    });
  },
  //
  // componentDidMount: function() {
  //
  // }

  render: function() {
    return (
      <a onClick={this.handleDelete} className="react-clear" id="delete-tab" title="Delete Tab">Delete
      </a>
    )
  }
});
