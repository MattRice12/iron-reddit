class Clearance::UsersController < Clearance::BaseController
  if respond_to?(:before_action)
    before_action :redirect_signed_in_users, only: [:create, :new]
    skip_before_action :require_login, only: [:create, :new], raise: false
    skip_before_action :authorize, only: [:create, :new], raise: false
  else
    before_filter :redirect_signed_in_users, only: [:create, :new]
    skip_before_filter :require_login, only: [:create, :new], raise: false
    skip_before_filter :authorize, only: [:create, :new], raise: false
  end

  def index
    render template: 'users/index.html.erb', locals: {
      users: User.all
    }
  end

  def show
    if User.exists?(params.fetch(:id))
      render template: 'users/show.html.erb', locals: {
        user: User.find(params.fetch(:id)),
      }
    else
      render html: "Not Found", status: 404
    end
  end

  def new
    @user = user_from_params
    render template: "users/new"
  end

  def create
    @user = user_from_params
    if @user.save
      sign_in @user
      redirect_back_or url_after_create
    else
      render template: "users/new"
    end
  end

  def edit
    @user = user_from_params
    render template: "users/edit"
  end

  def update
    @user = user_from_params
    if @user.update(user_params)
      redirect_to users_path
    else
      flash[:alert] = "Could not be edited due to errors."
      render template: 'users/edit.html.erb', locals: {
        user: @user
      }
    end
  end

  def destroy
    user = User.find(params.fetch(:id))
    user.destroy
    redirect_to users_path, :notice => "The user has been deleted"
  end

  private

  def avoid_sign_in
    warn "[DEPRECATION] Clearance's `avoid_sign_in` before_filter is " +
      "deprecated. Use `redirect_signed_in_users` instead. " +
      "Be sure to update any instances of `skip_before_filter :avoid_sign_in`" +
      " or `skip_before_action :avoid_sign_in` as well"
    redirect_signed_in_users
  end

  def redirect_signed_in_users
    if signed_in?
      redirect_to Clearance.configuration.redirect_url
    end
  end

  def url_after_create
    Clearance.configuration.redirect_url
  end

  def user_from_params
    username = user_params.delete(:username)
    email = user_params.delete(:email)
    password = user_params.delete(:password)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.username = username
      user.email = email
      user.password = password
    end
  end

  def user_params
    params[Clearance.configuration.user_parameter] || Hash.new
  end
end
