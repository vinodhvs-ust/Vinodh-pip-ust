# this is for ignoring lines start with #
image.png

awk '!/^(#|#)/' ignoreline.txt   command can be used to ignore lines starting with #



# how to remove duplicates using awk command
# we can use $ awk '!seen[$0]++' to remove duplicates
vinod@ip-10-199-25-201:~/PIP/shellscript$ awk '!seen[$0]++' duplicate.txt


