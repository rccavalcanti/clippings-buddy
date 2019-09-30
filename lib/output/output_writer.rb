class OutputWriter

  def initialize(library, output_dir, config)
    @library = library
    @output_dir = output_dir
    @config = config
  end

  def write_all
    puts "\nWriting to #{@output_dir}..." unless @library.empty?

    @library.each do |book|
      if ignore?(book)
        puts "Ignored: #{book.author} - #{book.title}"
      else
        MdWriter.new(book, path(book), @config).write
      end
    end
  end


  private

  def ignore?(book)
    if @config["ignored"].nil?
      false
    else
      ! @config["ignored"].find { |ignored| ignored["title"] == book.title && ignored["author"] == book.author }.nil?
    end
  end

  def path(book)
    path = @output_dir + "#{book.basename}.md"

    i = 2
    while(path.exist?)
      path = @output_dir + "#{book.basename} - #{i}.md"
      i += 1
    end

    path
  end
end