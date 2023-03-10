module ApplicationHelper
  def title(value = nil)
    @title = "Controller Demo"
    @title += " #{value}" if value
  end

  class DirectoryListing
    def initialize(path)
      @path = path
      @at_top = (@path == '/')
      @path_relative = ".#{@path}"
      @path += '/' unless @path.end_with?('/') && File.directory?(@path_relative)
      @path_relative = ".#{@path}"
    end

    def render
      index_path = "./#{@path}index.html"
      p index_path
      if File.exist?(index_path)
        return File.read(index_path)
      end
      listing = Dir.entries(@path_relative)
        .filter { |e| e if show_entry(e) }
        .map { |e| render_entry(e) }
        .join("\n")
      <<~EOF
        <h2>Directory of #{@path}</h2>
        <pre>#{listing}</pre>
      EOF
    end

    private

    def render_entry(e)
      return '' if e == '.'

      fq = if @at_top
             e
           elsif e == '..'
             if @path == '/'
               '/'
             else
               File.dirname(@path)
             end
           else
             "#{@path_relative}#{e}"
           end
      p "@path=#{@path}; path_relative=#{@path_relative}; e=#{e}; fq=#{fq}"
      e == '..' || File.directory?(fq) ? "<a href='#{fq}'>#{e}</a>" : e
    end

    def show_entry(e)
      this_dir = (e == '.')
      parent_dir = (e == '..')
      hide_parent = parent_dir && @at_top
      !this_dir && !hide_parent
    end
  end
end
