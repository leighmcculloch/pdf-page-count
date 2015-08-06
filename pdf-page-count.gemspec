$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require "pdf-page-count/version"

Gem::Specification.new do |s|
  s.name        = "pdf-page-count"
  s.version     = PdfPageCount::VERSION
  s.summary     = "Counts the pages in single and multiple PDFs."
  s.description = "Counts the pages in single and multiple PDFs. Capable of recursively finding PDFs in directories."
  s.authors     = [ "Leigh McCulloch" ]
  s.email       = "leigh@mcchouse.com"
  s.files       = [
    "lib/pdf-page-count.rb",
    "lib/pdf-page-count/file_util.rb",
    "lib/pdf-page-count/pdf_page_counter.rb",
    "lib/pdf-page-count/pdf_util.rb" ]
  s.homepage    = "http://rubygems.org/gems/pdf-page-count"
  s.license     = "BSD-3-Clause"
  s.executables = [ "pdf-page-count" ]
  s.add_runtime_dependency "thread", ["= 0.1.3"]
  s.add_runtime_dependency "pdf-reader", ["= 1.3.3"]
end
