# pingtest-bat
Pingtest to check if local range of networked IPs are reachable.

# FILE: pingtest.bat
  Runs through range of internally specified IPs with exception IPs.
  Pings each IP and tests the returned value.
  Reports on failed pings and server status.
  Current range of IPs = 192.168.([1-29]&&!12).250
  
  
  
# FILE: test.bat
  Outputs 1000 runs of pingtest.bat to results.txt
