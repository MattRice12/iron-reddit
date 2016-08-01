var Nav = React.createClass({
  render: function() {
    return (
      <div className="row">
        <div className="col 2 nav-boards">
          <a className="home-link" href="/">Home</a>
          <a className="board-link" href="/r">All Boards</a>
          <a className="user-link" href="/users">All Users</a>
        </div>
      </div>
    )
  }
});

var SignInOutUp = React.createClass({
  authLinks: function() {
    if (this.props.sign_in) {
      return (<div>
        <b className="welcome">Welcome {this.props.current_user.username}</b>
        <a className="waves-effect waves-light btn sign-out" data-method="delete" href="/sign_out">Sign out</a>
      </div>);
    } else {
      return (<div>
        <a className="waves-effect waves-light btn sign-up" data-method="post" href="/sign_up">Sign Up </a>
        <a className="waves-effect waves-light btn sign-in" data-method="get" href="/sign_in">Sign In</a>
      </div>);
    }
  },
  render: function() {
    return (<div>
      <div className="row sign-in-out-row">
        <div className="sign-in-out">{this.authLinks()}</div>
      </div>
      <div className="title">
        <a className="blueit" href="/">Blueit</a>
      </div>
    </div>);
  }
});

var CreateNewStuff = React.createClass({
  render: function() {
    return (
      <div>
        <div className="create-new-stuff">
          <a className="waves-effect waves-light btn new-board" href="../r/new">New Board</a>
        </div>
        <div>
          <a className="waves-effect waves-light btn new-board" href="../links/new">New Post</a>
        </div>
      </div>
    )
  }
});
