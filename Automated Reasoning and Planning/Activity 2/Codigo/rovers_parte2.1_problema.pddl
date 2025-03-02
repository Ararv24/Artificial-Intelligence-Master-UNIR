; Se ha usado waypoint2 como ubicacion del objetivo2, debido a que solo es accesible desde waypoint1

(define (problem roverprob1234)
	(:domain Rover)
	(:objects
		general - Lander
		colour high_res low_res colour_high_res - Mode ; Hemos agrupado los modos de color y high_res en un solo modo
		rover0 - Rover
		rover0store - Store
		waypoint0 waypoint1 waypoint2 waypoint3 - Waypoint
		camera0 - Camera
		objective0 objective1 objective2 - Objective ; Anadido objective2
		)
	(:init
		(visible waypoint1 waypoint0)
		(visible waypoint0 waypoint1)
		; (visible waypoint2 waypoint0) No visible el lander desde waypoint2
		; (visible waypoint0 waypoint2)
		(visible waypoint2 waypoint1)
		(visible waypoint1 waypoint2)
		(visible waypoint3 waypoint0)
		(visible waypoint0 waypoint3)
		(visible waypoint3 waypoint1)
		(visible waypoint1 waypoint3)
		(visible waypoint3 waypoint2)
		(visible waypoint2 waypoint3)
		(at_soil_sample waypoint0)
		(at_rock_sample waypoint1)
		(at_soil_sample waypoint2)
		(at_rock_sample waypoint2)
		(at_soil_sample waypoint3)
		(at_rock_sample waypoint3)
		(at_lander general waypoint0)
		(channel_free general)
		(at rover0 waypoint3)
		(available rover0)
		(store_of rover0store rover0)
		(empty rover0store)
		(equipped_for_soil_analysis rover0)
		(equipped_for_rock_analysis rover0)
		(equipped_for_imaging rover0)
		(can_traverse rover0 waypoint3 waypoint0)
		(can_traverse rover0 waypoint0 waypoint3)
		(can_traverse rover0 waypoint3 waypoint1)
		(can_traverse rover0 waypoint1 waypoint3)
		(can_traverse rover0 waypoint1 waypoint2)
		(can_traverse rover0 waypoint2 waypoint1)
		(on_board camera0 rover0)
		(calibration_target camera0 objective1)
		(supports camera0 colour)
		(supports camera0 high_res)
		(supports camera0 colour_high_res) ; La camara soporta el modo de color y alta resolucion de forma simultanea
		(visible_from objective0 waypoint0)
		(visible_from objective0 waypoint1)
		(visible_from objective0 waypoint2)
		(visible_from objective0 waypoint3)
		(visible_from objective1 waypoint0)
		(visible_from objective1 waypoint1)
		(visible_from objective1 waypoint2)
		(visible_from objective1 waypoint3)
		(visible_from objective2 waypoint2) ; Anadido que el objetivo2 es visible desde waypoint2
	)

	(:goal
		(and
			(communicated_soil_data waypoint2)
			(communicated_rock_data waypoint3)
			(communicated_image_data objective1 high_res)
			(communicated_image_data objective2 colour_high_res) ; Es necesario fotografiar el objetivo2 en alta resolucion y color
		)
	)
)