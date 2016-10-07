const Comment = React.createClass({
  postComment: function(e) {
    e.preventDefault();
    console.log('body text', );
    console.log('this.props.link.id', this.props.link.id);

    $.ajax({
      url: '../comments/',
      method: 'POST',
      data: JSON.stringify({
        link_id: this.props.link.id,
        body: this.refs.body.value
      }),
      contentType: "application/json",
      success: (response) => {
        console.log(response);
      }.bind(this)
    });
  },
  render: function() {
    return (
        <form className="new_comment" onSubmit={this.postComment}>
          <label name="body">Body</label>
          <input type="text" name="body" ref="body" />
          <input type="submit" value="Post Comment" />
        </form>
    )
  }
});
