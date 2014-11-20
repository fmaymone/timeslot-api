desc 'Generate Detailed Entity Relationship Diagram'
task :generate_adv_erd do
  system "railroady -o models.dot -M --all-column -t -m -p -i"
  system "dot -Tpdf models.dot > doc/erd_adv.pdf"
  system "rm models.dot"
  puts "Diagram saved to 'doc/erd_adv.pdf'"
end