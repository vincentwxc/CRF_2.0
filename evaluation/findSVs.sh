ls *.log | while read fn; do grep -iH "Number of SV:" "$fn" | tail -1; done > SV.txt