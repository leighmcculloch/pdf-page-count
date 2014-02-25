require 'forkmanager'

module PdfPageCount
  
  class PdfPageCounter
    
    def initialize
      @total_pages = 0
    end
    
    def start_counting
      @forkmanager = Parallel::ForkManager.new(3, {}, 1)
      @forkmanager.run_on_finish do |pid,exit_code,ident,exit_signal,core_dump,data_structure|
         if defined? data_structure
             puts "Received from child process #{pid}: #{data_structure}!"
             increment_pages(data_structure[:pages])
         else
             puts "No message received from child process #{pid}!"
         end
       end
    end
    
    def add_pdf_paths(paths, recursive: false)
      paths.each do |path|
        self.add_pdf_path(path, recursive: recursive) do |file, pages|
          yield file, pages
        end
      end
    end
    
    def add_pdf_path(path, recursive: false)
      files = FileUtil.find_pdf_files(path, recursive: recursive)
      files.each do |file|
        self.add_pdf_file(file) do |file, pages|
          yield file, pages
        end
      end
    end
    
    def add_pdf_file(file)  
      if !@forkmanager.nil?
        @forkmanager.start(file) and return
      end
      
      pages = PdfUtil.count_pages(file)
      puts pages
      increment_pages(pages)
      yield file, pages

      if !@forkmanager.nil?
        @forkmanager.finish(0, { :pages => pages })
      end
    end
    
    def increment_pages(pages = 1)
      @total_pages += pages
    end
    
    def finish_counting
      @forkmanager.wait_all_children
      @forkmanager = nil
    end
    
    def total_pages
      @total_pages
    end
    
  end
  
end
