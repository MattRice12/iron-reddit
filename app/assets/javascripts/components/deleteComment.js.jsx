var Delete = React.createClass({
  handleDelete: function (e) {
    $.ajax({
      url: "/comments/" + this.props.comment.id,
      method: "DELETE",
      dateType: "JSON",
      contentType: "application/json",
    }).done(function (response) {
      window.location.href="/links" + this.props.link.id
    });
  },

  render: function() {
    return (
      <a onClick={this.handleDelete} className="react-clear" id="delete-tab" title="Delete Tab">Delete
      </a>
    )
  }
});


// <sup><%= link_to "Delete", comment_path(id: comment.id), method: :delete %></sup>
