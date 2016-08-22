class WelcomeController < ApplicationController

  # by default all actions will render with
  # views/layouts/application.html.erb
  # unless you specify something like:
  # layout 'special' - will look for views/layouts/special.html.erb

  # this defines a controller `Action`

  def index
    # this will render 'index.html.erb' in the welcome folder under views
    # index: refers to the controller action
    # html: refers to the format (default is html)
    # erb: refers to the templating system (erb is built-in with Rails)


  end

  def about

  end


end
