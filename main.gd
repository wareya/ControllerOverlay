extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

var controller = 0

var base_modulate = Color.WHITE

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    if Input.is_key_label_pressed(KEY_0):
        controller = 9
    elif Input.is_key_label_pressed(KEY_1):
        controller = 0
    elif Input.is_key_label_pressed(KEY_2):
        controller = 1
    elif Input.is_key_label_pressed(KEY_3):
        controller = 2
    elif Input.is_key_label_pressed(KEY_4):
        controller = 3
    elif Input.is_key_label_pressed(KEY_5):
        controller = 4
    elif Input.is_key_label_pressed(KEY_6):
        controller = 5
    elif Input.is_key_label_pressed(KEY_7):
        controller = 6
    elif Input.is_key_label_pressed(KEY_8):
        controller = 7
    elif Input.is_key_label_pressed(KEY_9):
        controller = 8
    
    if Input.is_action_just_pressed("ui_accept"):
        if base_modulate == Color.WHITE:
            base_modulate = Color.LIGHT_GRAY
        else:
            base_modulate = Color.WHITE
    
    var lit := {}
    
    lit.U = 1.0 if Input.is_joy_button_pressed(controller, JOY_BUTTON_DPAD_UP) else 0.0
    lit.D = 1.0 if Input.is_joy_button_pressed(controller, JOY_BUTTON_DPAD_DOWN) else 0.0
    lit.L = 1.0 if Input.is_joy_button_pressed(controller, JOY_BUTTON_DPAD_LEFT) else 0.0
    lit.R = 1.0 if Input.is_joy_button_pressed(controller, JOY_BUTTON_DPAD_RIGHT) else 0.0
    
    lit.FU = 1.0 if Input.is_joy_button_pressed(controller, JOY_BUTTON_Y) else 0.0
    lit.FL = 1.0 if Input.is_joy_button_pressed(controller, JOY_BUTTON_X) else 0.0
    lit.FD = 1.0 if Input.is_joy_button_pressed(controller, JOY_BUTTON_A) else 0.0
    lit.FR = 1.0 if Input.is_joy_button_pressed(controller, JOY_BUTTON_B) else 0.0
    
    lit.SL = 1.0 if Input.is_joy_button_pressed(controller, JOY_BUTTON_LEFT_STICK) else 0.0
    lit.SR = 1.0 if Input.is_joy_button_pressed(controller, JOY_BUTTON_RIGHT_STICK) else 0.0
    
    lit.START = 1.0 if Input.is_joy_button_pressed(controller, JOY_BUTTON_START) else 0.0
    lit.SELECT = 1.0 if Input.is_joy_button_pressed(controller, JOY_BUTTON_BACK) else 0.0
    
    lit.L1 = 1.0 if Input.is_joy_button_pressed(controller, JOY_BUTTON_LEFT_SHOULDER) else 0.0
    lit.R1 = 1.0 if Input.is_joy_button_pressed(controller, JOY_BUTTON_RIGHT_SHOULDER) else 0.0
    
    lit.L2 = Input.get_joy_axis(controller, JOY_AXIS_TRIGGER_LEFT)
    lit.R2 = Input.get_joy_axis(controller, JOY_AXIS_TRIGGER_RIGHT)
    
    lit.ML = 1.0 if Input.is_joy_button_pressed(controller, JOY_BUTTON_GUIDE) else 0.0
    lit.MH = 1.0 if Input.is_joy_button_pressed(controller, JOY_BUTTON_TOUCHPAD) else 0.0
    
    for key in lit:
        get_node(key).modulate = Color(1.0,0.5,0.5).lerp(base_modulate, 1.0 - lit[key])
        get_node(key).offset.x = 0
        get_node(key).offset.y = lerp(0.0, 5.0, lit[key])
        get_node(key).offset = Vector2(get_node(key).offset).rotated(-get_node(key).rotation)
    
    $SL.offset += 32.0 * Vector2(Input.get_joy_axis(controller, JOY_AXIS_LEFT_X), Input.get_joy_axis(controller, JOY_AXIS_LEFT_Y))
    $SR.offset += 32.0 * Vector2(Input.get_joy_axis(controller, JOY_AXIS_RIGHT_X), Input.get_joy_axis(controller, JOY_AXIS_RIGHT_Y))
