class LayoutsController < ApplicationController

  def index
    @layout_files = layout_files
    render layout: session_layout
  end

  def show
    name = params[:id]
    set_session_layout(name)
    redirect_to :back
  end

  def set_style
    name = params[:id]
    set_session_style(name)
    redirect_to :back
  end

  def sample
    render layout: session_layout
  end

  def layout_files
    layouts_dir ||= File.join(Rails.root, 'app', 'views', 'layouts')
    layouts_path ||= File.join(layouts_dir, 'layout_*')
    paths = Dir.glob(layouts_path)
    files = paths.map{|p| p.gsub("#{layouts_dir}/", "")}
  end

  def style_files
    style_dir ||= File.join(Rails.root, 'public', 'styles')
    style_path ||= File.join(style_dir, 'style_*')
    paths = Dir.glob(style_path)
    files = paths.map{|p| p.gsub("#{style_dir}/", "")}
  end
end
