# Specifies who the network messages are sent to.
proc get_net_msg_user {} {
  set fid [open tempnetsend.bat w]
  puts $fid "echo %username% > tempnetsend.txt"
  close $fid
  exec tempnetsend.bat
  set fid [open tempnetsend.txt r]
  gets $fid net_msg_user
  close $fid
  file delete -force tempnetsend.bat
  file delete -force tempnetsend.txt
  set net_msg_user [string trim $net_msg_user]
  return $net_msg_user }
  

# run_time procedure used to print out elasped time during script
proc run_time {start_time message} {
  set stop_time [clock seconds]
  set elapsed_time [expr $stop_time-$start_time]
  set hours  [expr $elapsed_time/3600]
  set minutes  [expr (($elapsed_time - ($hours*3600)) / 60)]
  set seconds  [expr ($elapsed_time - ($hours*3600) - ($minutes*60))]
  puts "##### $message $hours hours $minutes minutes $seconds seconds #####"
}

# run_time procedure used to print out elasped time during script
proc run_time_elapsed {start_time} {
  set stop_time [clock seconds]
  set elapsed_time [expr $stop_time-$start_time]
  set hours  [expr $elapsed_time/3600]
  set minutes  [expr (($elapsed_time - ($hours*3600)) / 60)]
  set seconds  [expr ($elapsed_time - ($hours*3600) - ($minutes*60))]
  set elapsed_time_string "$hours hours $minutes minutes $seconds seconds"
  return $elapsed_time_string
}

proc network_message {user msg} {
  # Copy message to transcript
  puts "sending $msg to $user"
  # Send messgae across network
  exec msg $user $msg
}

proc purge {directory clean_list} {
  set enable_purge 1
  if $enable_purge {
    foreach delete_file $clean_list {
      if [file exists $directory/$delete_file] {
        puts "deleted $directory/$delete_file"
        file delete -force $directory/$delete_file
      } else {
        puts "can't delete $directory/$delete_file"
      }
    }
  } else {
    puts "Purge is not enabled"
  }
}