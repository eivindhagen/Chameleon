class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :surround
  def surround
    @layout_files = layout_files
    @style_files = style_files
    @session_style = session_style
  end
  
  before_filter :action_debug
  def action_debug
    logger.info "session_layout=#{session_layout}"
    logger.info "session_style=#{session_style}"
  end
  
  def set_session_layout(name)
    logger.info "session_layout=(#{name})"
    session[:layout_name] = name
  end
  def session_layout
    session[:layout_name]
  end

  def set_session_style(name)
    logger.info "session_style=(#{name})"
    session[:style_name] = name
  end
  def session_style
    session[:style_name]
  end

end
