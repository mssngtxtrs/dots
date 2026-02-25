STARTTIME=$(date +%s)
echo "Cache cleaning..."
# paccache -r
yay -Scc
echo "Cleaning dependencies..."
yay -Yc
ENDTIME=$(date +%s)
echo "Time elapsed: $((ENDTIME - STARTTIME)) seconds"
echo "Press any key to close window..."
read
kill -9 $PPID
