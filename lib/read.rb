class MyFile
  def read_file
    file = File.new('./lib/description.txt', 'r:UTF-8')
    content = file.read
    puts content
  end
end
