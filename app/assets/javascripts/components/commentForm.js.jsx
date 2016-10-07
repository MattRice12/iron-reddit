const Comment = React.createClass({
  postComment: function(e) {
    e.preventDefault();
    console.log('body text', );
    console.log('this.props.link.id', this.props.link.id);
    console.log('this.props.user.id', this.props.user.id);

    $.ajax({
      url: '../comments/',
      method: 'POST',
      dataType: 'JSON',
      data: JSON.stringify({
        link_id: this.props.link.id,
        body: this.refs.body.value,
        user_id: this.props.user.id
      }),
      contentType: "application/json",
      success: (response) => {
        console.log(response);
      }
    }).done(function (response) {
      window.location.reload();
  });
  },

  render: function() {
    return (
        <form className="new_comment" onSubmit={this.postComment}>
          <label name="body">Body</label>
          <input type="text" name="body" ref="body" />
          <input type="submit" value="Post Comment" className="btn"/>
        </form>
    )
  }
});
