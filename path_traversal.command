#!/usr/bin/env python3

# root = ["", "root"]
# dirs = []
# path = []
# current_path = [] or ["", "root"]

dict_path = {
    "root": ["", "root"],
    "current_path": [] or ["", "root"],
    "dirs": [],
    "path": []
}


"""
 * mkdir method is used to make/create directories
 * [dirs delared global list for directories]
"""
def mkdir():
    global dict_path
    if dir in dict_path["path"] and dir in dict_path["dirs"]:
            print("ERR: DIRECTORY ALREADY EXISTS")
    else:
        dict_path["dirs"].append(dir)
        print("SUCC: CREATED")
        dict_path["path"].append(dir)


"""
 * ls method is used to list all the directries
 * path declared globally
"""
def ls():
    if dict_path["path"] == dict_path["root"]:
        dict_path["path"] = dict_path["dirs"]
        # dict_path["path"] = dict_path["path"]
    print("DIRS: ")
    print(*dict_path["path"], sep="\t")


"""
 * cd method is used to change the directory
 * current_path, dir, path declared globally
"""
def cd():
    global dict_path
    if dir == "":
        dict_path["current_path"] = dict_path["root"]
        dict_path["path"] = dict_path["root"]
        print("ENTERED IN ROOT DIRECTORY")
    elif dir in dict_path["dirs"] and dir in dict_path["path"]:
        dict_path["current_path"].append(dir)
        dict_path["path"].clear()
        print("ENTERED IN DIRECTORY: ", dict_path["current_path"])
    else:
        print("ERR: INVALID PATH")


"""
 * pwd method is used to list the current path
 * current_path declared globally
"""
def pwd():
    global dict_path
    print("PATH: ")
    print(*dict_path["current_path"], sep="/")


"""
 * rm method is used to remove the directories created.
 * dirs declared globabally
"""
def rm():
    global dict_path
    if dir in dict_path["dirs"]:
        dict_path["dirs"].remove(dir)
        dict_path["path"].remove(dir)
        print("SUCC: DELETED")
    else:
        print("ERR: DIRECTORY DOES NOT EXIST")


"""
 * session_clear method is used to clear the session. Return to root as default.
 * dirs, current_path, path declared globally.
"""
def session_clear():
    global dict_path
    dict_path["dirs"].clear()
    dict_path["current_path"].clear()
    dict_path["current_path"] = dict_path["root"] or dict_path[""]
    dict_path["path"].clear()
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
        print("ERR: COMMAND ENTERED DOES NOT EXIST!")


print("INFO - COMMANDS TO USE : mkdir, ls, cd, pwd, rm, session_clear, exit")
print("<Starting your application...>")

while True:
    char = input("$:")
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
