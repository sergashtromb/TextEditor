extends Node

var main = null
var p = ''
var direction = ''
func save(path):
	var data = main.get_child(1).get_child(1).get_child(1).get_text()
	var file = File.new()
	file.open(path, File.WRITE)
	file.store_string(data) 
	file.close()

func open(path):
	var file = File.new()
	file.open(path, File.READ) 
	p = path
	main._load_text(file.get_as_text())
	file.close()

func list_files_in_directory(path):
	var files = []
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin()

	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with("."):
			files.append(file)

	dir.list_dir_end()

	return _sorted_files(files)


func _sorted_files(list: Array):
	var rash = [".txt", ".py", ".xml", ".c", ".cpp", ".stag", ".html", ".css", ".ch", ".sh", ".js"] 
	var nl = []
	for i in list:
		for j in rash:
			if i.ends_with(j):
				nl.append(i)
	return nl


func create_new_file(path):
	var file = File.new() 
	file.open(path, File.WRITE) 
	file.close() 
	p = path
	var dir = ''
	var arr = path.split('/')
	for i in range(0, arr.size()-2):
		dir += arr[i] + '/'
	dir += arr[-2] 
	direction = dir 
	main.load_list_file(list_files_in_directory(dir))




