#!/usr/bin/env python3

root = ["", "root"]
dirs = []
path = []
current_path = [] or ["", "root"]


"""
 * mkdir method is used to make/create directories
 * [dirs delared global list for directories]
"""
def mkdir():
    global dirs
    if dir in dirs:
        print("ERR: DIRECTORY ALREADY EXISTS")
    else:
        dirs.append(dir)
        path.append(dir)
        print("SUCC: CREATED")


"""
 * ls method is used to list all the directries
 * path declared globally
"""
def ls():
    global path
    if path == root:
        path = dirs
        path = path[0]
    print("DIRS: ")
    print(*path, sep="\t")


"""
 * cd method is used to change the directory
 * current_path, dir, path declared globally
"""
def cd():
    global current_path, dir, path
    if dir == "":
        current_path = root
        path = root
    elif dir in dirs:
        current_path.append(dir)
        path.clear()
    elif dir == "..":
        current_path.pop()
        print("SUCC: REACHED")
        print(*current_path, sep="/")
        i = len(dirs) - 1
        if dirs[i] in path:
            i = i - 1
            path.pop()
            path.append(dirs[i])
        else:
            path.append(dirs[i])
    else:
        print("ERR: INVALID PATH")


"""
 * pwd method is used to list the current path
 * current_path declared globally
"""
def pwd():
    global current_path
    print("PATH: ")
    print(*current_path, sep="/")


"""
 * rm method is used to remove the directories created.
 * dirs declared globabally
"""
def rm():
    global dirs
    if dir in dirs:
        dirs.remove(dir)
        if dir in path:
            print("SUCC: DELETED")
            path.remove(dir)
    else:
        print("ERR: DIRECTORY DOES NOT EXIST")


"""
 * session_clear method is used to clear the session. Return to root as default.
 * dirs, current_path, path declared globally.
"""
def session_clear():
    global dirs
    dirs.clear()
    global current_path
    current_path.clear()
    current_path = root
    global path
    path.clear()
    print("SUCC: CLEARED: RESET TO ROOT")


"""
 * commands method has all the applied commands.
"""
def commands(argument):
    commands_used = {
        "mkdir": mkdir,
        "ls": ls,
        "cd": cd,
        "pwd": pwd,
        "rm": rm,
        "session_clear": session_clear,
        "exit": exit,
    }
    if char in commands_used:
        # Get the function from commands_used dictionary
        func = commands_used.get(argument)
        # Execute the function
        func()
    else:
        print("ERR: COMMANDS DOES NOT EXIST!")


print("INFO - COMMANDS TO USE : mkdir, ls, cd, pwd, rm, session_clear, exit")
print("<Starting your application...>")

while True:
    char = input("$: ")
    command_list = []
    command_list.append(char.split(" "))
    char = command_list[0][0]
    if char in ["mkdir", "rm"] and len(command_list[0]) == 1:
        print("{}:Operand Missing".format(char))
    elif len(command_list[0]) == 1:
        dir = ""
    elif len(command_list[0]) == 2:
        dir = command_list[0][1]
    else:
        print("ERR: INVALID SYNTAX")
    commands(char)
