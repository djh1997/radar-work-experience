 set compiled 1 
 while {$compiled==1} {
    try {
      compile
      set compiled 0
    } on error {43022} {
      puts "error"
      }
    }
