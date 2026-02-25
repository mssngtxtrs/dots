STARTTIME=$(date +%s)
echo "Updating system..."
yay -Syu
ENDTIME=$(date +%s)
echo "Time elapsed: $((ENDTIME - STARTTIME)) seconds"
echo "Press any key to close window..."
read
kill -9 $PPID
