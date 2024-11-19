extends Control
var tilescene = preload("res://tile.tscn")
var availabletypes = {
	"pipes": {
		"straight": preload("res://straight_pipe.tscn"),
		"curve": preload("res://curve_pipe.tscn")
		}, 
	"machines": {
		"mixer": preload("res://mixer.tscn")
		}
		}
var layout = []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	changefactorylayoutsize(10,10)
	updatesupply()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _input(event: InputEvent) -> void:
	pass

func changefactorylayoutsize(x: int, y: int) -> void:
	while $TileContainer.get_children().size() < y:
		var hbox = HBoxContainer.new()
		hbox.name="Row_"+str($TileContainer.get_children().size())
		$TileContainer.add_child(hbox)
	var i = $TileContainer.get_children().size()
	while i > y:
		$TileContainer.get_child($TileContainer.get_children().size()-1).queue_free()
		i -= 1
	for row in $TileContainer.get_children():
		while row.get_children().size() < x:
			var newtile = tilescene.instantiate()
			newtile.name="Tile_"+str(row.get_children().size())+str(row.name.right(-3))
			row.add_child(newtile)
		var j = row.get_children().size()
		while j > x:
			row.get_child(row.get_children().size()-1).queue_free()
			j -= 1
			
func updatesupply() -> void:
	for key in availabletypes.keys():
		if not $Supply.has_node(key):
			var label = Label.new()
			label.text=key.capitalize()
			label.set_anchors_preset(PRESET_CENTER_TOP)
			var hbox = HBoxContainer.new()
			hbox.name=key+"Sorter"
			var vbox = VBoxContainer.new()
			vbox.name = key
			$Supply.add_child(vbox)
			$Supply.get_node(key).add_child(label)
			$Supply.get_node(key).add_child(hbox)
		for item in availabletypes[key].keys():
			if not $Supply.get_node(key).get_node(key+"Sorter").has_node(item):
				var itemsc = availabletypes[key][item].instantiate()
				itemsc.in_supply=true
				$Supply.get_node(key).get_node(key+"Sorter").add_child(itemsc)
	if not $Supply.get_children().map(func get_name(input) -> String: return input.name) == availabletypes.keys():
		for category in $Supply.get_children():
			if availabletypes.keys().has(category.name):
				for item in category.get_children():
					if not item.name in availabletypes[category]:
						item.queue_free()
			else: category.queue_free()
