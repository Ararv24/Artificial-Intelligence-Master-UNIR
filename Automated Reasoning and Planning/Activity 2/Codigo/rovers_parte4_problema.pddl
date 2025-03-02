; Definicion de problema para hacer notar el uso de baterias

(define (problem roverprob1234)
	(:domain Rover2)
	(:objects
		general - Lander
		colour high_res low_res - Mode
		rover0 rover1 - Rover ; Anadimos otro rover
		rover0store rover1store - Store
		waypoint0 waypoint1 waypoint2 waypoint3 waypoint4 waypoint5 - Waypoint ; Anadimos dos waypoints
		camera0 camera1 - Camera ; Anadimos otra camara
		objective0 objective1 - Objective
		battery-0 - battery-number ; Definimos las baterias
		battery-1 - battery-number
		battery-2 - battery-number
		battery-3 - battery-number
	)
	(:init
		(battery-predecessor battery-0 battery-1) ; Definimos la secuencia de baterias
		(battery-predecessor battery-1 battery-2)
		(battery-predecessor battery-2 battery-3)

		; Hemos definido un nuevo mapa
		(visible waypoint0 waypoint1)
		(visible waypoint0 waypoint2)
		(visible waypoint0 waypoint4)

		(visible waypoint1 waypoint0)
		(visible waypoint1 waypoint4)

		(visible waypoint2 waypoint0)
		(visible waypoint2 waypoint3)
		(visible waypoint2 waypoint4)

		(visible waypoint3 waypoint2)
		(visible waypoint3 waypoint4)

		(visible waypoint4 waypoint3)
		(visible waypoint4 waypoint5)

		(visible waypoint5 waypoint4)

		; Ajustamos las muestras de suelo y roca
		(at_rock_sample waypoint1)
		(at_soil_sample waypoint5)

		; El lander esta en waypoint4
		(at_lander general waypoint4)

		(channel_free general)
		; Rover0 parte de waypoint0
		(at rover0 waypoint0)
		(available rover0)
		(has-battery rover0 battery-3) ; Rover0 tiene bateria 3
		(store_of rover0store rover0)
		(empty rover0store)
		(equipped_for_soil_analysis rover0)
		(equipped_for_rock_analysis rover0)
		(equipped_for_imaging rover0)

		(can_traverse rover0 waypoint0 waypoint1)
		(can_traverse rover0 waypoint0 waypoint2)

		(can_traverse rover0 waypoint1 waypoint0)

		(can_traverse rover0 waypoint2 waypoint0)
		(can_traverse rover0 waypoint2 waypoint3)

		(can_traverse rover0 waypoint3 waypoint2)
		(can_traverse rover0 waypoint3 waypoint4)

		(can_traverse rover0 waypoint4 waypoint3)
		(can_traverse rover0 waypoint4 waypoint5)

		(can_traverse rover0 waypoint5 waypoint4)

		(on_board camera0 rover0)
		(calibration_target camera0 objective1)
		(supports camera0 colour)
		(supports camera0 high_res)

		(visible_from objective1 waypoint3)

		(has-battery rover1 battery-3) ; Rover1 tiene bateria 3
		(at rover1 waypoint0) ; Rover1 parte de waypoint0
		(available rover1) ; Rover1 disponible
		(equipped_for_imaging rover1) ; Rover1 equipado para imagen
		(equipped_for_soil_analysis rover1)
		(equipped_for_rock_analysis rover1)

		(store_of rover1store rover1)
		(empty rover1store)

		(can_traverse rover1 waypoint0 waypoint1)
		(can_traverse rover1 waypoint0 waypoint2)

		(can_traverse rover1 waypoint1 waypoint0)

		(can_traverse rover1 waypoint2 waypoint0)
		(can_traverse rover1 waypoint2 waypoint3)

		(can_traverse rover1 waypoint3 waypoint2)
		(can_traverse rover1 waypoint3 waypoint4)

		(can_traverse rover1 waypoint4 waypoint3)
		(can_traverse rover1 waypoint4 waypoint5)

		(can_traverse rover1 waypoint5 waypoint4)

		(on_board camera1 rover1) ; Camara1 en rover1
		(calibration_target camera1 objective1)
		(supports camera1 colour)
		(supports camera1 high_res)
	)

	(:goal
		(and
			(communicated_soil_data waypoint5)
			(communicated_rock_data waypoint1)
			(communicated_image_data objective1 high_res)
		)
	)
)