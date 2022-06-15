extends Node

var main = null
var p = ''

func save(path):
	var data = main.get_child(1).get_child(1).get_text()
	var file = File.new()
	file.open(path, File.WRITE)
	file.store_string(data) 
	file.close()

func open(path):
	var file = File.new()
	file.open(path, File.READ)
	main.get_child(1).get_child(1).set_text(file.get_as_text()) 
	file.close()

