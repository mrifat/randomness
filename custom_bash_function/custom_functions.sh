# Add to ~/.bashrc or ~/.bash_profile as needed.
#

# g as git grep
#
function g()
{
  if [ $# -ge 1 ]
  then
    git grep $@
  else
    printf "No arguments supplied\nUse \`git grep --help\` for help\n"
  fi
}

# Connect to Disconnect from a network and
# connect to another.
# TODO: Clean this shit up.
#
function ccc()
{
  if [ $# -gt 2 ]
  then
    if ! [[ -z `nmcli c status | grep $1` ]]
    then
      nmcli dev disconnect iface $2
      nmcli con up id $3
    fi
  else
    if [ "$#" == 1 ]
    then
      nmcli con up id $1
    else
      printf "Wrong number of arguments.\n\nccc Usage:\nccc accepts three arguments:\n1. The id of the connection you want to disconnect from if any.\n2. The device of that connection. i.e wlan0 or eth1 if any.\n3. The id of the connection you want to connect to.\n"
    fi
  fi

  if [ $? -gt 0 ]
  then
    printf "ccc Usage:\nccc accepts three arguments:\n1. The id of the connection you want to disconnect from if any.\n2. The device of that connection. i.e wlan0 or eth1 if any.\n3. The id of the connection you want to connect to.\n"
  fi
}
