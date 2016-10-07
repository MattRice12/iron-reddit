
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
      dataType: "json",
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
// <!-- <div>
//   <%= form_for(comment) do |f| %>
//   <div><label for="body">Comment: </label></div>
//   <div><%= f.text_area :body, placeholder: "Respond to Poster"%></div>
//   <%= f.hidden_field :link_id, value: link.id %>
//   <div class="waves-effect waves-light btn create-comment-button">
//     <%= f.submit %>
//   </div>
//   <% end %>
// </div> -->
