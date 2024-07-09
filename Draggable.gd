extends Sprite2D

var startpos = null
var startoffset = null

func commit(pos : Vector2):
    if !startoffset:
        return
    global_position = pos - startoffset
    global_position = round(global_position/8.0)*8.0

func _unhandled_input(event : InputEvent):
    if event is InputEventMouseButton:
        
        var size = texture.get_size() * scale
        var modrot = fmod(rotation_degrees, 180)
        if modrot > 45 and modrot < 135:
            size = Vector2(size.y, size.x)
        
        var rect := Rect2(-size/2.0 + get_viewport_transform().origin + global_position, size)
        
        if event.pressed:
            if !rect.has_point(event.global_position):
                return
            startpos = global_position
            startoffset = event.global_position - startpos
            get_viewport().set_input_as_handled()
        else:
            commit(event.global_position)
            startpos = null
            startoffset = null
    elif event is InputEventMouseMotion:
        if startpos != null:
            commit(event.global_position)
        
