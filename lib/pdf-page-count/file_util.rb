module PdfPageCount
  
  module FileUtil
    
    def find_pdf_files(path, recursive: false)
      if File.directory?(path)
        if recursive
          return Dir.glob("#{path}/**/*.pdf")
        else
          return Dir.glob("#{path}/*.pdf")
        end
      elsif path.end_with?(".pdf")
        return [path]
      else
        return []
      end
    end
    
    module_function :find_pdf_files
    
  end
  
end