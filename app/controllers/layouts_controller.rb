class LayoutsController < ApplicationController
  def index
    @layout_files = layout_files
  end

  def show
    name = params[:id]
    logger.info "name=#{name}"
    render layout: name
  end

  def layout_files
    layouts_dir ||= File.join(Rails.root, 'app', 'views', 'layouts')
    layouts_path ||= File.join(layouts_dir, 'layout_*')
    paths = Dir.glob(layouts_path)
    files = paths.map{|p| p.gsub("#{layouts_dir}/", "")}
  end
end
