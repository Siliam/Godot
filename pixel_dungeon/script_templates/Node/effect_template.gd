# meta-name: Effect
# meta-description: Create an effect with can be applied to a target
class_name MyAwesomeEffect
extends Effect

var member_var := 0

func execute(targets: Array[Node]) -> void:
	print("My awesome effect has been played")
	print("Targets: ", targets)
	print("It does %s soemthing" % member_var)
